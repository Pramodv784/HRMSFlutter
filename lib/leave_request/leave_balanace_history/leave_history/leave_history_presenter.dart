import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hrms/add_leave_request/leave_view.dart';
import 'package:hrms/add_leave_request/model/add_leave_request.dart';
import 'package:hrms/add_leave_request/model/add_leave_response.dart';
import 'package:hrms/add_leave_request/model/emp_key_response.dart';

import 'package:hrms/add_leave_request/model/leave_type_response.dart';

import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';

import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';

import 'leave_history_view.dart';
import 'model/leave_request_history_response.dart';
class LeaveHistoryPresenter {
  var tag = 'LeaveHistoryPresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  LeaveHistoryView _view;
  ApiController _repository = ApiController.getInstance();

  LeaveHistoryPresenter(this._view);
  getLeaveHistory(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetLeaveHistory}',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);

          LeaveRequestHistoryResponse data = LeaveRequestHistoryResponse.fromJson(res.data);
          print('pramod${data.message}');
          if (data?.status=='OK')
            _view.onLeaveHistoryFetched(data);
          else
            {
              _view.onError(data.message);
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








