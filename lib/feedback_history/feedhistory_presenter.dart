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

import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';




class FeedHistoryPresenter {
  var tag = 'FeedHistoryPresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  FeedHistoryView _view;
  ApiController _repository = ApiController.getInstance();

  FeedHistoryPresenter(this._view);



  getFeedHistory(BuildContext context,int id) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.FeedHistory}?empId=$id',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);
          FeedHistoryResponse data = FeedHistoryResponse.fromJson(res.data);
          if (data?.statusReason??false)
            _view.onFeedHistoryFecthed(data);
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








