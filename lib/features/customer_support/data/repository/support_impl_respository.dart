import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/customer_support/data/data_sources/support_api_service.dart';
import 'package:project_romance/features/customer_support/data/models/contact/all_contact.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';

class SupportImplRepository implements SupportRepository {
  final SupportApiService supportApiService;
  SupportImplRepository(this.supportApiService);

  @override
  Future<DataState<AllContacts>> getAllContacts() async {
    try {
      final httpResponse = await supportApiService.getAllContacts();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        debugPrint("success");
        return DataSuccess(httpResponse.data);
      } else {
        debugPrint("error occuring");
        return DataFailed(DioException(
            error: httpResponse.response.data,
            message: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      debugPrint("failed - $e");
      return DataFailed(e);
    }
  }
}
