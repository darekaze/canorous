import 'package:canorous/config/env.dart';
import 'package:canorous/utils/log/DioLogger.dart';
import 'package:dio/dio.dart';

class APIProvider {
  final String _tag;
  final String _baseUrl;

  Dio _dio;

  APIProvider(this._tag, this._baseUrl) {
    BaseOptions dioOptions = BaseOptions()..baseUrl = _baseUrl;

    _dio = Dio(dioOptions);

    if (EnvType.DEVELOPMENT == Env.value.envType) {
      _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          DioLogger.onSend(_tag, options);
          return options;
        },
        onResponse: (Response response) {
          DioLogger.onSuccess(_tag, response);
          return response;
        },
        onError: (DioError error) {
          DioLogger.onError(_tag, error);
          return error;
        },
      ));
    }
  }

  void throwIfNoSuccess(Response response) {
    if(response.statusCode < 200 || response.statusCode > 299) {
      throw Exception(response);
    }
  }
}
