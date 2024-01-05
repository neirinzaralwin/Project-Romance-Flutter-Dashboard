import 'package:project_romance/core/constants/api_constants.dart';
import 'package:project_romance/features/customer_support/data/models/contact/contact.dart';
import 'package:project_romance/features/customer_support/presentation/pages/support/ui_models/create_contact_request_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'support_api_service.g.dart';

@RestApi(baseUrl: ApiConst.baseUrl)
abstract class SupportApiService {
  factory SupportApiService(Dio dio) = _SupportApiService;

  @GET(ApiConst.allContacts)
  Future<HttpResponse<List<Contact>>> getAllContacts();

  @POST(ApiConst.createContact)
  Future<HttpResponse<Contact>> createContact(
      @Body() CreateContactRequestModel request);
}
