import 'dart:io';
import 'package:dio/dio.dart';
import 'package:project_romance/core/resources/data_state.dart';
import 'package:project_romance/features/customer_support/data/data_sources/support_api_service.dart';
import 'package:project_romance/features/customer_support/data/models/contact/contact.dart';
import 'package:project_romance/features/customer_support/domain/repositories/support_repository.dart';
import 'package:project_romance/features/customer_support/domain/usecases/update_contact.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/ui_models/create_contact_request_model.dart';

class SupportImplRepository implements SupportRepository {
  final SupportApiService supportApiService;
  SupportImplRepository(this.supportApiService);

  @override
  Future<DataState<List<Contact>>> getAllContacts() async {
    try {
      final httpResponse = await supportApiService.getAllContacts();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
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

  @override
  Future<DataState<Contact>> createContact(
      CreateContactRequestModel request) async {
    try {
      final httpResponse = await supportApiService.createContact(request);
      if (httpResponse.response.statusCode == HttpStatus.created) {
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

  @override
  Future<DataState> deleteContact(int id) async {
    try {
      final httpResponse = await supportApiService.deleteContact(id);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
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

  @override
  Future<DataState> updateContact(UpdateContactParams param) async {
    try {
      final httpResponse = await supportApiService.updateContact(param.id, {
        "value": param.value,
      });
      if (httpResponse.response.statusCode == HttpStatus.ok) {
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
