import 'dart:io';

import 'package:dio/dio.dart';

abstract class NetworkExceptions {
  static String handleResponse(Response? response) {
    int statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return "Unauthorized Request";
      case 404:
        return "Not found";
      case 409:
        return "Error due to a conflict";
      case 408:
        return "Connection request timeout";
      case 500:
        return "Internal Server Error";
      case 503:
        return "Service unavailable";
      default:
        return "Received invalid status code";
    }
  }

  static String getDioException(error) {
    if (error is Exception) {
      try {
        var errorMessage = "";
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorMessage = "Request to API server was cancelled";
              break;
            case DioExceptionType.receiveTimeout:
              errorMessage = "Receive timeout in connection with API server";
              break;
            case DioExceptionType.sendTimeout:
              errorMessage = "Send timeout in connection with API server";
              break;
            case DioExceptionType.connectionTimeout:
              errorMessage = "Connection timeout with API server";
              break;
            case DioExceptionType.badCertificate:
              errorMessage = "Bad Certificate with API server";
              break;
            case DioExceptionType.connectionError:
              errorMessage =
                  "Connection error with API server\nCheck connection internet";
              break;
            case DioExceptionType.unknown:
              errorMessage =
                  "Connection error: ${DioExceptionType.unknown.name}";
              break;
            case DioExceptionType.badResponse:
              // errorMessage =
              //     "Connection error: ${DioExceptionType.badResponse}";
              if (error.response?.data["status"] == 404) {
                errorMessage = 'page not found';
              } else {
                errorMessage = error.response?.data["message"] is Map
                    ? 'status: ${error.response?.data["status"]} - \nmessage: ${getMapValues(error.response?.data["message"])}'
                    : 'status: ${error.response?.data["status"]} - \nmessage: ${error.response?.data["message"]}';
              }
              break;
          }
        } else if (error is SocketException) {
          errorMessage = "No internet connection";
        } else {
          errorMessage = "Unexpected error occurred";
        }
        return errorMessage;
      } on FormatException {
        return "Unexpected error occurred";
      } catch (_) {
        return "Unexpected error occurred";
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return "Unable to process the data";
      } else {
        return "Unexpected error occurred";
      }
    }
  }

  static String getMapValues(map) {
    String values = "";
    map.forEach((key, value) {
      values += "$value\n";
    });
    return values;
  }
}
