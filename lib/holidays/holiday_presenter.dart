import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/expense/expense_view.dart';
import 'package:hrms/expense/model/add_expense_response.dart';
import 'package:hrms/feedback_history/feedhistory_view.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
import 'package:hrms/holidays/holiday_view.dart';
import 'package:hrms/holidays/model/get_all_holidays_response.dart';
import 'package:hrms/profile/model/upload_image_response.dart';

import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';




class HolidayPresenter {
  var tag = 'HolidayPresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  HolidayView _view;
  ApiController _repository = ApiController.getInstance();

  HolidayPresenter(this._view);



  getHoliday(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetAllHolidays}',headers: await Utility.header())
        ..then((Response res) async {

          Dialogs.hideLoader(context);
          if (res.statusCode==200) {
            List<GetAllHolidaysResponse> list = (res.data as List)
                .map((x) => GetAllHolidaysResponse.fromJson(x))
                .toList();
            _view.onFeedHolidayFecthed(list);
          }
          else
            {
              _view.onError('some thing went wrong');
            }

        }
        ).catchError((e) async {
          Utility.log(tag, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }}




  }








