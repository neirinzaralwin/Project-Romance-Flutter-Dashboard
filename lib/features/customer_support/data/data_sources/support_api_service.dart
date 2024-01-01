import 'package:project_romance/core/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/contact/all_contact.dart';
part 'support_api_service.g.dart';

@RestApi(baseUrl: ApiConst.baseUrl)
abstract class SupportApiService {
  factory SupportApiService(Dio dio) = _SupportApiService;

  @GET(ApiConst.allProducts)
  Future<HttpResponse<AllContacts>> getAllContacts();
}
