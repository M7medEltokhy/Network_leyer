import 'package:dio/dio.dart';
import 'package:network_leyer/core/network/api_endpoints.dart';
import 'package:network_leyer/core/network/base_response.dart';
import 'package:network_leyer/features/auth/data/models/login_data.dart';
import 'package:network_leyer/features/auth/data/models/login_request.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class AuthApiClient {
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(ApiEndpoints.login)
  Future<BaseResponse<LoginData>> login(@Body() LoginRequest request);
}
