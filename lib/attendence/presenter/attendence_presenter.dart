import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/attendence/model/attendence_log_response.dart';

import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';

import '../view/attendence_view.dart';


class AttendencePresenter {
  var tag = 'AttendencePresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  AttendenceView _view;
  ApiController _repository = ApiController.getInstance();

  AttendencePresenter(this._view);
  getAttendence(BuildContext context) async {
    if (await NetworkCheck.check()) {
   //   Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetAttendencelog}',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );

      //    Dialogs.hideLoader(context);

          AttendenceLogResponse data = AttendenceLogResponse.fromJson(res.data);

          if (data?.status??false)
            _view.onAttendenceFetch(data);
          else
            {
              _view.onError(data.message);
            }

        }
        ).catchError((e) async {
          Utility.log(tag, e);
        //  Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }}


  }








