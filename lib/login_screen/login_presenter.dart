import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/feedback/select_emp/model/employee_data.dart';
import 'package:hrms/login_screen/login_view.dart';

import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';

import 'model/LoginResponse.dart';


class LoginPresenter {
  var tag = 'LoginPresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  LoginView _view;
  ApiController _repository = ApiController.getInstance();

  LoginPresenter(this._view);



  login(BuildContext context,Map input) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.post(EndPoints.Login, body: input)
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);

          Dialogs.hideLoader(context);
          LoginResponse data = LoginResponse.fromJson(res.data);
          //print('pramod${data.data.message}');

          if (data?.status ?? false)
            _view.onLoginFetch(data);
          else {
            _view.onError(data.message);
          }
        }
        ).catchError((e) async {
          Utility.log(tag, e);
         // Utility.showErrorToast(context, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
    else{
      Utility.showErrorToast(context, 'please connect to internet');
    }
  }




}
