import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import 'custom_trace.dart';
import 'dio_client.dart';

mixin ApiClient {
  String baseUrl = 'https://imake-app.com:4001';

  late DioClient _httpClient;

  DioClient get httpClient => _httpClient;

  Future<ApiClient> init() async {
    _httpClient = DioClient(baseUrl, dio.Dio());
    return this;
  }

  Future<ApiClient> changeHeader() async {
    _httpClient = DioClient(baseUrl, dio.Dio());
    return this;
  }

  bool isLoading({String? task, List<String>? tasks}) {
    return _httpClient.isLoading(task: task, tasks: tasks);
  }

  String getApiBaseUrl(String path) {
    return '$baseUrl/$path';
  }

  Uri getApiBaseUri(String path) {
    return Uri.parse('$baseUrl/$path');
  }

  void printUri(StackTrace stackTrace, Uri uri) {
    Get.log(CustomTrace(stackTrace, message: uri.toString()).toString());
  }
}
