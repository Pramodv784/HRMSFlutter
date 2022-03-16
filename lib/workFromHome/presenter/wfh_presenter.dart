import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';

import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:hrms/workFromHome/model/get_work_from_list_response.dart';
import 'package:hrms/workFromHome/model/w_f_h_request.dart';
import 'package:hrms/workFromHome/model/w_f_h_response.dart';
import 'package:hrms/workFromHome/work_from_home_view.dart';

import '../../add_leave_request/model/emp_key_response.dart';

class WFHPresenter {
  var tag = 'WorkFromPresenterPresenter ';
  static const encryptionChannel = MethodChannel('enc/dec');


  final WorkFromHomeView _view;
  final ApiController _repository = ApiController.getInstance();

  WFHPresenter(this._view);

     addWorkFromHomeRequest(BuildContext context,WFHRequest wfhRequest) async {

      if (await NetworkCheck.check()) {
        Dialogs.showLoader(context, 'Loading ...', '');
        // Dialogs.showLoader(context, 'Please wait getting chapters', '');
        _repository.post(EndPoints.WorkFromHomeRequest, body: wfhRequest.toJson(),headers: await Utility.header())
          ..then((Response res) async {
            Utility.log(tag, res);
            Utility.log('$tag>>>',jsonDecode(res.toString()) );


            Dialogs.hideLoader(context);
            WFHResponse data = WFHResponse.fromJson(res.data);

              _view.onAddWFHRequest(data);

          }
          ).catchError((e) async {
            Utility.log(tag, e);
            Dialogs.hideLoader(context);

          });
      }
    }

  getWFHRequestList(BuildContext context,int id) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetWorkFromHomeList}?employeeid=$id',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);
          GetWorkFromListResponse data = GetWorkFromListResponse.fromJson(res.data);
           if (data?.status=='OK')
          _view.onGetFHList(data);
          else {
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

  getEmpKey(BuildContext context,String key) async {
    if (await NetworkCheck.check()) {
      //  Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetEmpKeyword}?searchtext=$key',headers: await Utility.header())
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








