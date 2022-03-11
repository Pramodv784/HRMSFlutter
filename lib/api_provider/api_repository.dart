


import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/employee/model/employee_list_response.dart';
import 'package:hrms/employee/model/get_company_type.dart';
import 'package:hrms/employee/model/get_emp_type_response.dart';
import 'package:hrms/employee/model/get_roll_type_response.dart';
import 'package:hrms/feedback/select_emp/model/team_role_response.dart';
import 'package:hrms/home_screen/model/home_avg_score_response.dart';
import 'package:hrms/main.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:http/http.dart';

class ApiRepository {
  static final ApiRepository apiRepository = ApiRepository.internal();
  ApiController _controller = ApiController.getInstance();
  Client client = Client();

  factory ApiRepository() {
    return apiRepository;
  }

  ApiRepository.internal();

 /* Future<LoginResponse> login(Map input) async {
    //Dialogs.showLoader(context, 'Loading', '');

    Response response = await dio.post(EndPoints.Login, data: input);
    Utility.log('Api call', '${EndPoints.Login}');

    LoginResponse res = LoginResponse.fromJson(response.toString());
    //Dialogs.hideLoader(context);
    Utility.log('Api Respnse', '$res');
    return res;
  }*/

  Future<EmployeeListResponse> fetchEmployeList() async {
    Map headers= await Utility.header();
    Map<String, String> headerMap = headers ?? {};
    final response = await client.get(Uri.parse("${EndPoints.GetAllEmpData}"),headers: headerMap);
    print(response.body.toString());

    if (response.statusCode == 200) {
      return EmployeeListResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<GetRollTypeResponse> fetchDepartment() async {
    Map headers= await Utility.header();
    Map<String, String> headerMap = headers ?? {};
    final response = await client.get(Uri.parse("${EndPoints.GetDepartment}"),headers: headerMap);
    print(response.body.toString());

    if (response.statusCode == 200) {
      return GetRollTypeResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
  Future<GetEmpTypeResponse> fetchEmpType() async {
    Map headers= await Utility.header();
    Map<String, String> headerMap = headers ?? {};
    final response = await client.get(Uri.parse("${EndPoints.GetEmpType}"),headers: headerMap);
    print(response.body.toString());

    if (response.statusCode == 200) {
      return GetEmpTypeResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
  Future<GetCompanyType> fetchCompany() async {
    Map headers= await Utility.header();
    Map<String, String> headerMap = headers ?? {};
    final response = await client.get(Uri.parse("${EndPoints.GetCompany}"),headers: headerMap);
    print(response.body.toString());

    if (response.statusCode == 200) {
      return GetCompanyType.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<EmployeeListResponse> postFilter() async {
    Map headers= await Utility.header();
    Map<String, String> headerMap = headers ?? {};
    final response = await client.post(Uri.parse("${EndPoints.UserFilter}"),headers: headerMap,body: null);
    print(response.body.toString());

    if (response.statusCode == 200) {
      return EmployeeListResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }






  }



