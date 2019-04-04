
import 'package:canorous/environment/env.dart';

void main() => Development();

class Development extends Env {
  final String appName = "(Dev)Canorous";
  final String baseUrl = 'https://api.dev.website.org';
  EnvType environmentType = EnvType.DEVELOPMENT;

  final String dbName = 'canorous_dev.db';
}
