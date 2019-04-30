import 'package:sembast/sembast.dart';
import 'package:canorous/data/AppDatabase.dart';
import 'package:canorous/data/model/Track.dart';

class TrackDao {
  static const TRACK_STORE_NAME = 'tracks';

  final _trackStore =intMapStoreFactory.store(TRACK_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  // TODO: inplement Track logic here

  // Sample: insert a track
  Future create(Track track) async {
    delete(track);
    await _trackStore.add(await _db, track.toJson());
  }

  Future delete(Track track) async {
    final finder = Finder(filter: Filter.byKey(track.id));
    await _trackStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future clear() async {
    await _trackStore.delete(
      await _db,
    );
  }

  Future <List<Track>> getAllStoredByName() async {
    final finder = Finder(sortOrders: [
      SortOrder('id'),
    ]);
    final recordSnapshots = await _trackStore.find(
      await _db,
      finder: finder,
    );
    return recordSnapshots.map((snapshot) {
      final track = Track.fromJson(snapshot.value);
      track.id = snapshot.key;
      return track;
    }).toList();  
  }
}