

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hrms/ticket/ticket_detail/recieved_ticket/model/RecievedTicketResponse.dart';
import 'package:hrms/ticket/ticket_detail/recieved_ticket/model/ticket_receive_detail_resposne.dart';
import 'package:hrms/ticket/ticket_detail/recieved_ticket/ticket_recieve_view.dart';

import '../../../api_provider/ApiController.dart';
import '../../../api_provider/endpoints.dart';
import '../../../utility/Dialogs.dart';
import '../../../utility/NetworkCheck.dart';
import '../../../utility/Utility.dart';
import '../model/AddCommentResponse.dart';
import '../model/AddTicketCommentRequest.dart';

class TicketRecievedPresenter {
  var tag = 'TicketRecievedPresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');

  TicketRecivedView _view;
  ApiController _repository = ApiController.getInstance();

  TicketRecievedPresenter(this._view);

  getReceivedTicket(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.TicketReceived}',
          headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          Dialogs.hideLoader(context);
          RecievedTicketResponse data =
          RecievedTicketResponse.fromJson(res.data);
          if (data?.status ?? false)
            _view.onRecievedFetch(data);
          else {
            _view.onError(data.message);
          }
        }).catchError((e) async {
          Utility.log(tag, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }

  getReceivedTicketDetail(BuildContext context,int id) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.TicketReceivedDetail}?ticketId=$id',
          headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          Dialogs.hideLoader(context);
          TicketReceiveDetailResposne data =
          TicketReceiveDetailResposne.fromJson(res.data);
          if (data?.status ?? false)
            _view.onRecievedDetailFetch(data);
          else {
            _view.onError(data.message);
          }
        }).catchError((e) async {
          Utility.log(tag, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }

  AddTicketComment(BuildContext context, AddTicketCommentRequest addTicketCommentRequest) async {
    if (await NetworkCheck.check()) {
      // Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.post(EndPoints.AddTicketComment,
          body: addTicketCommentRequest.toJson(), headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          // Dialogs.hideLoader(context);
          AddCommentResponse data = AddCommentResponse.fromJson(res.data);

          if (data?.status ?? false)
            _view.onRecievedDetailCommentFetch(data);
          else {
            _view.onError(data.message);
          }
        }).catchError((e) async {
          Utility.log(tag, e);
          //  Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }


}
