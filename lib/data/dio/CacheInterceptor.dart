import 'package:dio/dio.dart';
import 'package:get/get_core/get_core.dart';

class CacheInterceptor extends Interceptor {
  CacheInterceptor();

  final _cache = <Uri, Response>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final response = _cache[options.uri];
    if (options.extra['refresh'] == true) {
      Get.log(
          'onRequest CacheInterceptor if******${options.uri}: force refresh, ignore cache! \n');
      return handler.next(options);
    } else if (response != null) {
      Get.log('onRequest CacheInterceptor else if: ${options.uri} \n');
      return handler.resolve(response);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _cache[response.requestOptions.uri] = response;
    Get.log('onResponse CacheInterceptor : $response \n');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Get.log('onError CacheInterceptor: $err');
    super.onError(err, handler);
  }
}
