import 'package:dio/dio.dart';

class ErrorException {
  DioException? exception;
  ErrorException(this.exception);

  DioException get connectionTimeout => DioException(
      requestOptions: exception!.requestOptions,
      message: "No Internet connection",
      type: DioExceptionType.unknown,
      response: Response(requestOptions: exception!.requestOptions, statusCode: 1));
}
