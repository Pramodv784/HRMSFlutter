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
import 'package:hrms/profile/model/upload_image_response.dart';
import 'package:hrms/ticket/model/GetAllUser.dart';
import 'package:hrms/ticket/model/GetMyCaseResponse.dart';
import 'package:hrms/ticket/model/TicketResponse.dart';
import 'package:hrms/ticket/model/add_ticket_response.dart';
import 'package:hrms/ticket/model/my_ticket_response.dart';
import 'package:hrms/ticket/model/ticket_type_response.dart';
import 'package:hrms/ticket/ticket_view.dart';

import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';

import '../main.dart';
import 'model/add_ticket_request.dart';

class TicketPresenter {
  var tag = 'TicketPresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  TicketView _view;
  ApiController _repository = ApiController.getInstance();

  TicketPresenter(this._view);


  getTicketType(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.TicketType}',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          Dialogs.hideLoader(context);
          TicketTypeResponse data = TicketTypeResponse.fromJson(res.data);
          if (data?.statusReason ?? false)
            _view.onTicketTypeFecthed(data);
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
    }
  }
  getUser(BuildContext context,int id) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetUserByDepartment}?Id=$id',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          Dialogs.hideLoader(context);
          GetAllUser data = GetAllUser.fromJson(res.data);
          if (data?.statusReason ?? false)
            _view.onUserByDepartmentFecthed(data);
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
    }
  }



  getMyCase(BuildContext context,int id) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetMyCase}?Id=$id',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          Dialogs.hideLoader(context);
          GetMyCaseResponse data = GetMyCaseResponse.fromJson(res.data);
          if (data?.statusReason ?? false)
            _view.onGetMyCaseFecthed(data);
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
    }
  }
  AddTicket(BuildContext context, AddTicketRequest addTicketRequest) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.post(EndPoints.AddTicket, body: addTicketRequest.toJson(),headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          Dialogs.hideLoader(context);
          AddTicketResponse data = AddTicketResponse.fromJson(res.data);

          if (data?.statusReason ?? false)
            _view.onTicketAddedFecthed(data);
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
    }
  }
  updateTicketStatus(BuildContext context, AddTicketRequest addTicketRequest) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.put(EndPoints.UpdateTicketStatus, body: addTicketRequest.toJson(),headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          Dialogs.hideLoader(context);
          AddTicketResponse data = AddTicketResponse.fromJson(res.data);

          if (data?.statusReason ?? false)
            _view.onTicketAddedFecthed(data);
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
    }
  }
  updateTicket(BuildContext context, AddTicketRequest addTicketRequest) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.put(EndPoints.UpdateTicket, body: addTicketRequest.toJson(),headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          Dialogs.hideLoader(context);
          AddTicketResponse data = AddTicketResponse.fromJson(res.data);

          if (data?.statusReason ?? false)
            _view.onTicketAddedFecthed(data);
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
    }
  }


  getMyTicket(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetMyCase}',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          Dialogs.hideLoader(context);
          TicketResponse data = TicketResponse.fromJson(res.data);
          if (data?.status ?? false)
            _view.onGetMyTicketFecthed(data);
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
    }
  }
  Future<List<MyTicketResponse>> getMyTicketData(int id) async {
    try {
      Map headers= await Utility.header();
      Map<String, String> headerMap = headers ?? {};
      Response response = await dio.get('${EndPoints.MyTicketList}?Id=$id',
          options: Options(
            contentType: ContentType.json.toString(),
            receiveTimeout: 300000,
            sendTimeout: 300000,
            method: "GET",
            headers: headerMap,
          ));
      print('Api Call *** ${EndPoints.MyTicketList}?Id=$id}');
      // if there is a key before array, use this : return (response.data['data'] as List).map((child)=> Children.fromJson(child)).toList();
      print('Response ****${response.data.toString()}');
      return (response.data as List)
          .map((x) => MyTicketResponse.fromJson(x))
          .toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }


}
