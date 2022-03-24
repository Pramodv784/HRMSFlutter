import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/employee/emp_view.dart';
import 'package:hrms/expense/expense_view.dart';
import 'package:hrms/expense/model/add_expense_response.dart';
import 'package:hrms/feedback_history/feedhistory_view.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
import 'package:hrms/profile/model/upload_image_response.dart';


import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';

import '../add_leave_request/model/emp_key_response.dart';
import 'model/employee_list_response.dart';




class EmpPresenter {
  var tag = 'EmpPresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  EmpView _view;
  ApiController _repository = ApiController.getInstance();

  EmpPresenter(this._view);



  getEmpList(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetAllEmpData}',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);
          EmployeeListResponse data = EmployeeListResponse.fromJson(res.data);
          if (data?.statusReason??false)
            _view.onUserListFetch(data);
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
  postFilter(BuildContext context,List<int> departmentList,int empTypeID,int cmpId) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      var map={'department':departmentList,'employeeTypeId':empTypeID,'companyId':cmpId};
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.post('${EndPoints.UserFilter}',body:map ,headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);
          EmployeeListResponse data = EmployeeListResponse.fromJson(res.data);
          if (data?.statusReason??false)
            _view.onUserListFetch(data);
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








