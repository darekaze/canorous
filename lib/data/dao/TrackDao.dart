import 'package:sembast/sembast.dart';
import 'package:canorous/data/AppDatabase.dart';
import 'package:canorous/data/model/Track.dart';

class TrackDao {
  static const TRACK_STORE_NAME = 'tracks';

  final _trackStore =intMapStoreFactory.store(TRACK_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  // TODO: inplement Track logic here

  // Sample: insert a track
  Future insert(Track track) async {
    await _trackStore.add(await _db, track.toJson());
  }
}
