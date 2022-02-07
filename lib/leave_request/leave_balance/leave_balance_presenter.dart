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
import 'package:hrms/leave_request/leave_balance/leave_balance_view.dart';
import 'package:hrms/leave_request/leave_balance/model/leave_balance_model.dart';

import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';
class LeaveBalancePresenter {
  var tag = 'LeaveBalancePresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  LeaveBalanceView _view;
  ApiController _repository = ApiController.getInstance();

  LeaveBalancePresenter(this._view);
  getLeaveBalance(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetLeaveBalance}')
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);

          LeaveBalanceModel data = LeaveBalanceModel.fromJson(res.data);
          print('pramod${data.message}');
          if (data?.status=='OK')
            _view.onLeaveBalanceFetched(data);
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








