import 'dart:io';

import 'package:dio/dio.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioExceptionType.unknown:
              errorDescription = "Connection to API server failed due to internet connection";
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription = "Receive timeout in connection with API server";
              break;

            case DioExceptionType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
            case DioExceptionType.badCertificate:
              errorDescription = "bad Certificate with server";
            case DioExceptionType.badResponse:
              errorDescription = "bad Response with server";
            case DioExceptionType.connectionError:
              errorDescription = "Connection Error with API server";
              break;
          }
        } else if (error is SocketException) {
          errorDescription = error.message;
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
