import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'exceptions/index.dart';

Exception handleError(String error) {
  // Logger().e("Generic exception: $error");
  return AppException(message: error);
}

Exception handleDioError(DioError dioError) {
  switch (dioError.type) {
    case DioErrorType.cancel:
      return AppException(message: "Request to API server was cancelled");
    case DioErrorType.connectTimeout:
      return AppException(message: "Connection timeout with API server");
    case DioErrorType.other:
      return NetworkException("There is no internet connection");
    case DioErrorType.receiveTimeout:
      return TimeoutException("Receive timeout in connection with API server");
    case DioErrorType.sendTimeout:
      return TimeoutException("Send timeout in connection with API server");
    case DioErrorType.response:
      return _parseDioErrorResponse(dioError);
  }
}

Exception _parseDioErrorResponse(DioError dioError) {
  final logger = Logger();

  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;

  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["statusCode"];
    }
    status = dioError.response?.data["status"];
    serverMessage = dioError.response?.data["message"];
  } catch (e, s) {
    logger.i("$e  $statusCode");
    logger.i(s.toString());
    serverMessage = "Something went wrong. Please try again later.";
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("Service Temporarily Unavailable");
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? "", status ?? "");

    default:
      return ApiException(httpCode: statusCode, status: status ?? "", message: serverMessage ?? "");
  }
}
