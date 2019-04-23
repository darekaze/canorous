import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


enum PlayerState { stopped, playing, paused }

class PlayerWidget extends StatefulWidget {
  final String url;
  final bool isLocal;
  final PlayerMode mode;

  PlayerWidget({
    @required this.url,
    this.isLocal = false,
    this.mode = PlayerMode.MEDIA_PLAYER,
    Key key,
  }) : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  AudioPlayer _audioPlayer;
  AudioPlayerState _audioPlayerState;
  Duration _duration;
  Duration _position;

  Icon iconPlayorPause = new Icon(Icons.play_arrow);
  Text musicName = new Text("Music Name");

  PlayerState _playerState = PlayerState.stopped;
  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;

  get _isPlaying => _playerState == PlayerState.playing;
  get _isPaused => _playerState == PlayerState.paused;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
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
      padding: EdgeInsets.only(
          top: 5,
          bottom: 5,
          left: 20,
          right: 5
        ),
        decoration: BoxDecoration(
          color: Colors.grey[400].withOpacity(0.93),
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade900, width: 1.0),
          ),
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
                            _position.inMilliseconds < _duration.inMilliseconds)
                        ? _position.inMilliseconds / _duration.inMilliseconds
                        : 0.0,
                    valueColor: AlwaysStoppedAnimation(Colors.cyan),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.only(
                  left: 15
                ),
                child: musicName
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new IconButton(
                onPressed: () => playorpause(),
                iconSize: 40.0,
                icon: iconPlayorPause,
                color: Colors.black
              ),
              new IconButton(
                  onPressed: () => playNext(),
                  iconSize: 40.0,
                  icon: new Icon(Icons.skip_next),
                  color: Colors.black
              ),
            ],
          ),
        ],
      )
    );
  }

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
    if(!_isPlaying || _isPaused) {
      final playPosition = (_position != null &&
            _duration != null &&
            _position.inMilliseconds > 0 &&
            _position.inMilliseconds < _duration.inMilliseconds)
        ? _position
        : null;
      await _audioPlayer.play(widget.url, isLocal: widget.isLocal, position: playPosition);
      setState(() {
        _playerState = PlayerState.playing;
        iconPlayorPause = new Icon(Icons.pause);
      });
    }
    else {
      await _audioPlayer.pause();
      setState(() {
        _playerState = PlayerState.paused;
        iconPlayorPause = new Icon(Icons.play_arrow);
      });
    }
  }

  Future playNext() async {
    stop();
    await _audioPlayer.play(widget.url, isLocal: widget.isLocal, position: null);
    setState(() {
      musicName = new Text("Second music");
      _playerState = PlayerState.playing;
      iconPlayorPause = new Icon(Icons.pause);
    });
  }

  Future stop() async {
    await _audioPlayer.stop();
    setState(() {
      _playerState = PlayerState.stopped;
      _position = new Duration();
    });
  }

  void _onComplete() {
    setState(() => _playerState = PlayerState.stopped);
  }
}
