import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network_leyer/core/network/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';

import 'package:network_leyer/features/auth/models/login_request.dart';
import 'package:network_leyer/features/auth/models/login_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiEndpoints.login)
  Future<LoginResponse> login(
    @Body() LoginRequest request,
  );
}

@module
abstract class ApiServiceModule {
  @lazySingleton
  ApiService apiService(Dio dio) => ApiService(dio);
}