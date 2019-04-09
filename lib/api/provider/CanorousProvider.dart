import 'package:canorous/api/provider/APIProvider.dart';
import 'package:canorous/config/env.dart';

class CanorousProvider extends APIProvider {
  static const TAG = 'CanorousProvider';

  CanorousProvider() : super(TAG, Env.value.baseUrl);

  // TODO: add canorous api calls here
}
