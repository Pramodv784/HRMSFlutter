import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/feedback/select_emp/model/employee_data.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';

import 'feed_view.dart';
import 'model/team_data.dart';
import 'model/team_role_response.dart';






/// Created by Pratik Kataria on 19-05-2021.

class FeedPresenter {
  var tag = 'FeedPresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  FeedView _view;
  ApiController _repository = ApiController.getInstance();

  FeedPresenter(this._view);



  getFeedType(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetFeedType}')
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);

          TeamRoleResponse data = TeamRoleResponse.fromJson(res.data);
          //print('pramod${data.data.message}');

         // if (data?.dataCategory?.isNotEmpty)
            _view.onFeedTypeFecthed(data);

        }
        ).catchError((e) async {
          Utility.log(tag, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }
  getTeamsdata(BuildContext context,int id) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetTeamdata}?empId=$id')
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);

          TeamData data = TeamData.fromJson(res.data);
          //print('pramod${data.data.message}');

          // if (data?.dataCategory?.isNotEmpty)
          _view.onTeamdataFecthed(data);

        }
        ).catchError((e) async {
          Utility.log(tag, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }
  getEmploydata(BuildContext context,int id) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetEmpData}?TeamLeadId=$id')
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);

          EmployeeData data = EmployeeData.fromJson(res.data);
          //print('pramod${data.data.message}');

          if (data?.typeVMs!=null)
          _view.onEmplyoeedataFecthed(data);
          else{
            Utility.log(tag, "null data");
          }


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
