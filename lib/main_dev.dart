
import 'package:canorous/config/env.dart';

void main() => Development();

class Development extends Env {
  final String appName = "(Dev)Canorous";
  final String baseUrl = 'http://10.0.2.2:8081'; // connect to localhost
  EnvType environmentType = EnvType.DEVELOPMENT;

  final String dbName = 'canorous_dev.db';
}
