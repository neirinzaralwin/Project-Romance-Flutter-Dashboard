import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/core/resources/logger.dart';
import 'package:project_romance/features/customer_support/data/data_sources/support_api_service.dart';
import 'package:project_romance/features/customer_support/data/models/contact/contact.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/ui_models/create_contact_request_model.dart';

class SupportImplRepository implements SupportRepository {
  final SupportApiService supportApiService;
  SupportImplRepository(this.supportApiService);

  @override
  Future<DataState<List<Contact>>> getAllContacts() async {
    try {
      final httpResponse = await supportApiService.getAllContacts();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        debugPrint("success");
        return DataSuccess(httpResponse.data);
      } else {
        Logger.Red.log("Error in getAllContact ❌");
        return DataFailed(DioException(
            error: httpResponse.response.data,
            message: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      Logger.Red.log("Dio Error in getAllContact ❌, reason $e");
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Contact>> createContact(
      CreateContactRequestModel request) async {
    try {
      final httpResponse = await supportApiService.createContact(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        debugPrint("success");
        return DataSuccess(httpResponse.data);
      } else {
        Logger.Red.log("Error in createContact ❌");
        return DataFailed(DioException(
            error: httpResponse.response.data,
            message: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      Logger.Red.log("Dio Error in createContact ❌, reason $e");
      return DataFailed(e);
    }
  }
}
