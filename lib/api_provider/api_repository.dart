import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/home_screen/model/home_avg_score_response.dart';
import 'package:hrms/login_screen/model/login_response.dart';
import 'package:hrms/main.dart';
import 'package:hrms/utility/Utility.dart';

class ApiRepository {
  static final ApiRepository apiRepository = ApiRepository.internal();
  ApiController _controller = ApiController.getInstance();

  factory ApiRepository() {
    return apiRepository;
  }

  ApiRepository.internal();

  Future<LoginResponse> login(Map input) async {
    Response response = await dio.post(EndPoints.Login, data: input);
    LoginResponse res = LoginResponse.fromJson(response.toString());
    return res;
  }

  Future<HomeAvgScoreResponse> getAverageScore(int input) async {
    Response response = await dio.get('${EndPoints.GetAvgScore}?empId=$input');
    Utility.log('Api call', '${EndPoints.GetAvgScore}');

    HomeAvgScoreResponse res =HomeAvgScoreResponse.fromJson(response.toString());

    return res;
  }
Future<HomeAvgScoreResponse>  getDashBard(int id) async {


      //Dialogs.showLoader(context, 'Please wait ', '');
      _controller.get('${EndPoints.GetAvgScore}?empId=$id')
        ..then((Response res) async {
          Utility.log('${'tag'}>>>', jsonDecode(res.toString()));
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);

          //Dialogs.hideLoader(context);

          HomeAvgScoreResponse homeAvgScoreResponse = HomeAvgScoreResponse.fromJson(res.data);
          return homeAvgScoreResponse;

        }).catchError((e) async {
          Utility.log('tag', e);
          //Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }



