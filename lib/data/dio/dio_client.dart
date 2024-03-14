import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'custom_trace.dart';
import 'network_exceptions.dart';

class DioClient {
  final String baseUrl;

  late Dio _dio;
  final List<Interceptor>? interceptors;
  final _progress = <String>[].obs;

  DioClient(
    this.baseUrl,
    Dio? dio, {
    this.interceptors,
  }) {
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors ?? []);
    }

    _dio.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
        requestBody: false));

    _dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        // Don't trust any certificate just because their root cert is trusted.
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        // You can test the intermediate / root cert here. We just ignore it.
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return client;
      },
    );
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> getUri(
    Uri uri, {
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio.getUri(
        uri,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } on FlutterError catch (e) {
      if (kDebugMode) {
        print(e.runtimeType);
      }
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  void _endProgress(CustomTrace programInfo) {
    try {
      Get.log('_endProgress ******${_getTaskName(programInfo)}');
      _progress.remove(_getTaskName(programInfo));
    } on FlutterError {}
  }

  void _startProgress(CustomTrace programInfo) {
    try {
      Get.log('_startProgress ******${_getTaskName(programInfo)}');
      _progress.add(_getTaskName(programInfo));
    } on FlutterError {}
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  Future<dynamic> postUri(
    Uri uri, {
    data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio.postUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> putUri(
    Uri uri, {
    data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio.putUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  Future<dynamic> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> patchUri(
    Uri uri, {
    data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio.patchUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> deleteUri(
    Uri uri, {
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio.deleteUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  Future<dynamic> downloadUri(
    Uri uri,
    String savePath, {
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio.downloadUri(
        uri,
        savePath,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  bool isLoading({String? task, List<String>? tasks}) {
    if (tasks != null) {
      return _progress.any((_task) => _progress.contains(_task));
    }
    return _progress.contains(task);
  }

  String _getTaskName(programInfo) {
    return programInfo.callerFunctionName.split('.')[1];
  }
}

/*
*     (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
*
* */
