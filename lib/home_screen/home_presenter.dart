import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/feedback/empfeedback/model/feed_question_model.dart';
import 'package:hrms/feedback/feed_question_view.dart';
import 'package:hrms/feedback/select_emp/model/employee_data.dart';
import 'package:hrms/home_screen/home_view.dart';
import 'package:hrms/home_screen/model/home_data.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';







/// Created by Pratik Kataria on 19-05-2021.

class HomePresenter {
  var tag = 'HomePresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  HomeView _view;
  ApiController _repository = ApiController.getInstance();

  HomePresenter(this._view);



  getHomeData(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetHomeData}')
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);

          HomeData data = HomeData.fromJson(res.data);
          //print('pramod${data.data.message}');

         // if (data?.dataCategory?.isNotEmpty)
            _view.onHomeFecthed(data);

        }
        ).catchError((e) async {
          Utility.log(tag, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }





}
