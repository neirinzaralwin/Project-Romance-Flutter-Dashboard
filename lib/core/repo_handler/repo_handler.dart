import 'dart:io';

import 'package:dio/dio.dart';
import 'package:project_romance/core/resources/data_state.dart';

abstract class RepoHandler {
  HttpResponse? response;
  int? validStatus;

  RepoHandler({this.validStatus = HttpStatus.ok, this.response});

  handle<T>(response, validStatus);
}

class StandardRepoHandler extends RepoHandler {
  @override
  Future<DataState<T>> handle<T>(response, validStatus) async {
    try {
      final httpResponse = response;
      if (httpResponse.response.statusCode == validStatus) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.data,
            message: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
