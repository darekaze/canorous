import 'package:canorous/config/env.dart';

void main() => Production();

class Production extends Env {
  final String appName = "Canorous";
  final String baseUrl = 'https://canorous.herokuapp.com/';
  EnvType environmentType = EnvType.PRODUCTION;

  final String dbName = 'canorous.db';
}
