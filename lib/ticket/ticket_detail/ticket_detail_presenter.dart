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
import 'package:hrms/ticket/ticket_detail/model/AddTicketCommentRequest.dart';
import 'package:hrms/ticket/ticket_detail/model/TicketDetailResposne.dart';
import 'package:hrms/ticket/ticket_detail/ticket_detail_view.dart';

import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';

import 'model/AddCommentResponse.dart';




class TicketDetailPresenter {
  var tag = 'TicketDetailPresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  TicketDetailView _view;
  ApiController _repository = ApiController.getInstance();

  TicketDetailPresenter(this._view);



  getTicketDetail(int id) async {
    if (await NetworkCheck.check()) {
     // Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.TicketDetail}?ticketId=$id',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          //Dialogs.hideLoader(context);
          TicketDetailResposne data = TicketDetailResposne.fromJson(res.data);
          if (data?.status??false)
            _view.onTicketDetailFecthed(data);
          else
            {
              _view.onError(data.message);
            }

        }
        ).catchError((e) async {
          Utility.log(tag, e);
          //Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }}
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
            _view.onTicketDetailCommentPost(data);
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








