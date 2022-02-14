import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/feedback/empfeedback/model/feed_question_model.dart';
import 'package:hrms/feedback/feed_question_view.dart';
import 'package:hrms/feedback/feedback_request.dart';
import 'package:hrms/feedback/model/add_feedback_response.dart';
import 'package:hrms/feedback/select_emp/model/employee_data.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';









class FeedQuestionPresenter {
  var tag = 'FeedQuestionPresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  FeedQuestionView _view;
  ApiController _repository = ApiController.getInstance();

  FeedQuestionPresenter(this._view);



  getQuestion(BuildContext context,int roleId,int selectedId,int loginId) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetQuestion}'
          '?roleId=$roleId&SelectedEmpId=$selectedId&LoginEmpId=$loginId',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);

          FeedQuestionModel data = FeedQuestionModel.fromJson(res.data);
          //print('pramod${data.data.message}');

          if (data?.statusReason??false)
            _view.onFeedQuestionFecthed(data);
          else{
             _view.onError(data.message);
          }

        }
        ).catchError((e) async {
          Utility.log('$tag error&&', e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }}

     submitQuestion(BuildContext context,FeedbackRequest feedbackRequest) async {
      // String jsonArray=jsonEncode(feedbackRequest.fBScore);
       var jsonArray=feedbackRequest.fBScore;
       var json={
         'ReceiverEmployeeId',feedbackRequest.receiverEmployeeId,
         'RatedByEmpId',feedbackRequest.ratedByEmpId,
         'YourFeedback',feedbackRequest.yourFeedback,
         'CategoryTypeId',feedbackRequest.categoryTypeId,
         'FBScore',[jsonArray],
       };

      if (await NetworkCheck.check()) {
        Dialogs.showLoader(context, 'Loading ...', '');
        // Dialogs.showLoader(context, 'Please wait getting chapters', '');
        _repository.post(EndPoints.SubmitFeedback, body: feedbackRequest.toJson())
          ..then((Response res) async {
            Utility.log(tag, res);
            Utility.log('${tag}>>>',jsonDecode(res.toString()) );
            // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
            //Utility.log('${tag}>>>pramod>>>',decoded_data.first);

            Dialogs.hideLoader(context);
            AddFeedbackResponse data = AddFeedbackResponse.fromJson(res.data);
            //print('pramod${data.data.message}');

            if (data?.statusReason?? false)
              _view.onAddFeedResponseFecthed(data);
            else{
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
  }








