import 'package:canorous/config/env.dart';

void main() => Production();

class Production extends Env {
  final String appName = "Canorous";
  final String baseUrl = 'https://api.website.org'; // put sns server url
  EnvType environmentType = EnvType.PRODUCTION;

  final String dbName = 'canorous.db';
}
