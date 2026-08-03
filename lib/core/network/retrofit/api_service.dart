import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network_leyer/core/network/api_endpoints.dart';
import 'package:network_leyer/core/network/base_response.dart';
import 'package:network_leyer/features/auth/data/models/login_data.dart';
import 'package:retrofit/retrofit.dart';

import 'package:network_leyer/features/auth/data/models/login_request.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiEndpoints.login)
  Future<BaseResponse<LoginData>> login(@Body() LoginRequest request);
}

