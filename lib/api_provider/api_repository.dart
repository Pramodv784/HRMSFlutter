import 'package:dio/dio.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/login_screen/model/login_response.dart';
import 'package:hrms/main.dart';

class ApiRepository {
  static final ApiRepository apiRepository = ApiRepository.internal();

  factory ApiRepository() {
    return apiRepository;
  }

  ApiRepository.internal();

  Future<LoginResponse> login(Map input) async {
    Response response = await dio.post(EndPoints.baseUrl, data: input);
    LoginResponse res = LoginResponse.fromJson(response.toString());
    return res;
  }
}
