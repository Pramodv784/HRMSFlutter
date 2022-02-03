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

import '../add_leave_request_page.dart';
class LeavePresenter {
  var tag = 'LeavePresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  LeaveView _view;
  ApiController _repository = ApiController.getInstance();

  LeavePresenter(this._view);



  getLeaveType(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetLeave}')
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);

          LeaveTypeResponse data = LeaveTypeResponse.fromJson(res.data);
          //print('pramod${data.data.message}');

         // if (data?.status??false)
            _view.onLeaveFecthed(data);

        }
        ).catchError((e) async {
          Utility.log(tag, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }}

     AddLeave(BuildContext context,LeaveRequest addLeaveRequest) async {
      // String jsonArray=jsonEncode(feedbackRequest.fBScore);

    /*   var json={
         'ReceiverEmployeeId',feedbackRequest.receiverEmployeeId,
         'RatedByEmpId',feedbackRequest.ratedByEmpId,
         'YourFeedback',feedbackRequest.yourFeedback,
         'CategoryTypeId',feedbackRequest.categoryTypeId,
         'FBScore',[jsonArray],
       };*/

      if (await NetworkCheck.check()) {
        Dialogs.showLoader(context, 'Loading ...', '');
        // Dialogs.showLoader(context, 'Please wait getting chapters', '');
        _repository.post(EndPoints.AddLeave, body: addLeaveRequest.toJson())
          ..then((Response res) async {
            Utility.log(tag, res);
            Utility.log('${tag}>>>',jsonDecode(res.toString()) );
            // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
            //Utility.log('${tag}>>>pramod>>>',decoded_data.first);

            Dialogs.hideLoader(context);
            AddLeaveResponse data = AddLeaveResponse.fromJson(res.data);
            //print('pramod${data.data.message}');

          //  if (data?.statusReason?? false)
              _view.onAddLeaveFecthed(data);
           /* else{
              _view.onError(data.message);
            }*/
          }
          ).catchError((e) async {
            Utility.log(tag, e);
            Dialogs.hideLoader(context);
            //  _view.onError(e);
            // DioErrorParser.parseError(e, _signupView);
          });
      }
    }

  getEmpKey(BuildContext context,String key) async {
    if (await NetworkCheck.check()) {
    //  Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetEmpKeyword}?searchtext=$key')
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
         // Dialogs.hideLoader(context);

          EmpKeyResponse data = EmpKeyResponse.fromJson(res.data);
          //print('pramod${data.data.message}');

          // if (data?.status??false)
          _view.onEmpkeyFecthed(data);

        }
        ).catchError((e) async {
          Utility.log(tag, e);
         // Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }}
  }








