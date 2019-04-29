import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_extractor/youtube_extractor.dart';

enum PlayerState { stopped, playing, paused }

// ENHANCE: Separate Player logic to another file (bloc) and make player global
class PlayerWidget extends StatefulWidget {
  final bool isLocal;
  final PlayerMode mode;
  final _PlayerWidgetState playerState = _PlayerWidgetState();

  PlayerWidget({
    this.isLocal = false,
    this.mode = PlayerMode.MEDIA_PLAYER,
    Key key,
  }) : super(key: key);

  @override
  _PlayerWidgetState createState() => playerState;

  void playFromYT(String videoId, String name) {
    playerState.playFromYT(videoId, name);
  }

  void playList(List<String> videoId, List<String> name) {
    playerState.playList(videoId, name);
  }
}

class _PlayerWidgetState extends State<PlayerWidget> {
  AudioPlayer _audioPlayer;
  AudioPlayerState _audioPlayerState;
  Duration _duration;
  Duration _position;
  List<String> videoId;
  List<String> name;
  String url = "http://www2.comp.polyu.edu.hk/~16097874d/test.mp3";

  Icon iconPlayorPause = Icon(Icons.play_arrow);
  Text musicName = Text("Music Name");

  PlayerState _playerState = PlayerState.stopped;
  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;

  get _isPlaying => _playerState == PlayerState.playing;
  get _isPaused => _playerState == PlayerState.paused;

  YouTubeExtractor extractor;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
    extractor = YouTubeExtractor();
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerStateSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 5),
        decoration: BoxDecoration(
          color: Colors.grey[400].withOpacity(0.93),
          border: Border(
              top: BorderSide(color: Colors.grey[500], width: 0.5),
              bottom: BorderSide(color: Colors.grey[500], width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    CircularProgressIndicator(
                      value: 1.0,
                      valueColor: AlwaysStoppedAnimation(Colors.grey[300]),
                    ),
                    CircularProgressIndicator(
                      value: (_position != null &&
                              _duration != null &&
                              _position.inMilliseconds > 0 &&
                              _position.inMilliseconds <
                                  _duration.inMilliseconds)
                          ? _position.inMilliseconds / _duration.inMilliseconds
                          : 0.0,
                      valueColor: AlwaysStoppedAnimation(Colors.red[300]),
                    ),
                  ],
                ),
                Container(padding: EdgeInsets.only(left: 15), width: 200, height: 20,child: musicName),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () => playorpause(),
                    iconSize: 40.0,
                    icon: iconPlayorPause,
                    color: Colors.black),
                IconButton(
                    onPressed: () => playNext(),
                    iconSize: 40.0,
                    icon: Icon(Icons.skip_next),
                    color: Colors.black),
              ],
            ),
          ],
        ));
  }

  // --- LOGIC ---

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer(mode: widget.mode);

    _durationSubscription =
        _audioPlayer.onDurationChanged.listen((duration) => setState(() {
              _duration = duration;
            }));

    _positionSubscription =
        _audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
              _position = p;
            }));

    _playerCompleteSubscription =
        _audioPlayer.onPlayerCompletion.listen((event) {
      _onComplete();
      setState(() {
        _position = _duration;
      });
    });

    _playerErrorSubscription = _audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
      setState(() {
        _playerState = PlayerState.stopped;
        _duration = Duration(seconds: 0);
        _position = Duration(seconds: 0);
      });
    });

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        _audioPlayerState = state;
      });
    });
  }

  Future playorpause() async {
    if (this.url != null){
      if (!_isPlaying) {
        resume();
        setState(() {
          _playerState = PlayerState.playing;
          iconPlayorPause = new Icon(Icons.pause);
        });
      } else {
        await _audioPlayer.pause();
        setState(() {
          _playerState = PlayerState.paused;
          iconPlayorPause = Icon(Icons.play_arrow);
        });
      }
    }
  }

  Future resume() async {
    final playPosition = (_position != null &&
                _duration != null &&
                _position.inMilliseconds > 0 &&
                _position.inMilliseconds < _duration.inMilliseconds)
            ? _position
            : null;
    await _audioPlayer.play(this.url, isLocal: widget.isLocal, position: playPosition);
    _audioPlayer.onPlayerCompletion.listen((onData){
      listPlay();
    });
  }

  Future playNext() async {
    if (videoId.length >= 1){
      stop();
      listPlay();
    }
  }

  Future playFromYT(String videoId, String name) async {
    var streamInfo = await extractor.getMediaStreamsAsync(videoId);
    play(streamInfo.audio.first.url, name);
  }

  Future play(String url, String name) async {
    this.url = url;
    stop();
    await _audioPlayer.play(this.url,
        isLocal: widget.isLocal, position: null);
    setState(() {
      musicName = Text(
        name,
        overflow: TextOverflow.ellipsis,
      );
      _playerState = PlayerState.playing;
      iconPlayorPause = Icon(Icons.pause);
    });
  }

  Future playList(List<String> videoId, List<String> name) async {
    this.videoId = videoId;
    this.name = name;
    stop();
    listPlay();
  }

  Future listPlay() async {
    if (videoId.isNotEmpty && name.isNotEmpty) {
        playFromYT(videoId[0], name[0]);
        videoId.removeAt(0);
        name.removeAt(0);
        _audioPlayer.onPlayerCompletion.listen((onData){
          if(videoId.isNotEmpty && name.isNotEmpty) {
            listPlay();
          }
        });
    }
  }

  Future stop() async {
    await _audioPlayer.stop();
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration();
    });
  }

  void _onComplete() {
    setState(() => _playerState = PlayerState.stopped);
  }
}
