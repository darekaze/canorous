import 'package:canorous/data/model/PlayList.dart';
import 'package:canorous/data/model/Track.dart';
import 'package:sembast/sembast.dart';
import 'package:canorous/data/AppDatabase.dart';


class PlayListDao {
  static const PLAYLIST_STORE_NAME = 'playlists';

  final _playListStore =intMapStoreFactory.store(PLAYLIST_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;



  Future create(PlayList playList) async {
    await _playListStore.add(await _db, playList.toJson());
  }

  Future delete(PlayList playList) async {
    final finder = Finder(filter: Filter.byKey(playList.id));
    await _playListStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future insertTrack(PlayList playList, Track track) async {
    playList.tracksTitle.add(track.title);
    playList.tracksVideoId.add(track.videoId);
    playList.tracksDuration.add(track.duration);
    //print(playList.tracks[0]);
    final finder = Finder(filter: Filter.byKey(playList.id));
    await _playListStore.update(
      await _db,
      playList.toJson(),
      finder: finder,
    );
  }

  Future deleteTrack(PlayList playList, Track track) async {
    playList.tracksTitle.remove(track.title);
    playList.tracksVideoId.remove(track.videoId);
    playList.tracksDuration.remove(track.duration);
    final finder = Finder(filter: Filter.byKey(playList.id));
    await _playListStore.update(
      await _db,
      playList.toJson(),
      finder: finder,
    );
  }
  
  Future <List<PlayList>> getAllStoredByName() async {
    final finder = Finder(sortOrders: [
      SortOrder('title'),
    ]);
    final recordSnapshots = await _playListStore.find(
      await _db,
      finder: finder,
    );
    return recordSnapshots.map((snapshot) {
      final playList = PlayList.fromJson(snapshot.value);
      playList.id = snapshot.key;
      return playList;
    }).toList();
  }
}