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
import 'package:hrms/expense/expense_view.dart';
import 'package:hrms/expense/model/add_expense_response.dart';
import 'package:hrms/expense/model/expense_history_response.dart';
import 'package:hrms/profile/model/upload_image_response.dart';

import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';

import 'model/add_expense_request.dart';
import 'model/expense_category_response.dart';
import 'model/get_project_list_response.dart';


class ExpensePresenter {
  var tag = 'ExpensePresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  ExpenseView _view;
  ApiController _repository = ApiController.getInstance();
  ExpensePresenter(this._view);



  getExpenseCategory(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetExpenseCate}',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);
          ExpenseCategoryResponse data = ExpenseCategoryResponse.fromJson(res.data);
         // if (data?.status??false)
            _view.onExpenseCateFecthed(data);

        }
        ).catchError((e) async {
          Utility.log(tag, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }}
  getProjectList(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetProjectList}',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);
          GetProjectListResponse data = GetProjectListResponse.fromJson(res.data);
          // if (data?.status??false)
          _view.onProjectListFecthed(data);

        }
        ).catchError((e) async {
          Utility.log(tag, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }}

  uploadImage(BuildContext context, File imageToUpload) async {
    if (await NetworkCheck.check()) {
      String fileName = imageToUpload.path.split('/').last;
      print(fileName);
      print(imageToUpload.path);
      FormData formData = FormData.fromMap({
        "": await MultipartFile.fromFile(imageToUpload.path,
            filename: fileName),
      });
      Dialogs.showLoader(context, 'Please wait while uploading image',
          '');

      _repository.post('${EndPoints.ImageUpload}?FolderName=ExpenseBillUpload'
          '&BaseUrl=${EndPoints.baseUrl}',
        body: formData,headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          UploadImageResponse uploadImageResponse =
          UploadImageResponse.fromJson(res.data);
          Dialogs.hideLoader(context);
          // if (uploadImageResponse?.data?.flag??false) {
          _view.onImageFecthed(uploadImageResponse);
          // if (_view is EditProfileView) {
          //   EditProfileView _profileView = _view as EditProfileView;
          //   _profileView.onInstantUploaded(uploadProfileResponse);
          // }
          /* } else {
            _view.onError(uploadImageResponse.errorMessage);
          }*/
        })
        ..catchError((e) {
          Dialogs.hideLoader(context);
          // _view.onError(e.message);
        });
    }
  }



     AddExpense(BuildContext context,AddExpenseRequest addExpenseRequest) async {
      // String jsonArray=jsonEncode(feedbackRequest.fBScore);
      if (await NetworkCheck.check()) {
        Dialogs.showLoader(context, 'Loading ...', '');
        // Dialogs.showLoader(context, 'Please wait getting chapters', '');
        _repository.post(EndPoints.AddExpense, body: addExpenseRequest.toJson(),headers: await Utility.header())
          ..then((Response res) async {
            Utility.log(tag, res);
            Utility.log('${tag}>>>',jsonDecode(res.toString()) );
            // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
            //Utility.log('${tag}>>>pramod>>>',decoded_data.first);

            Dialogs.hideLoader(context);
            AddExpenseResponse data = AddExpenseResponse.fromJson(res.data);
            //print('pramod${data.data.message}');

          //  if (data?.statusReason?? false)
              _view.onAddExpenseFecthed(data);

          }
          ).catchError((e) async {
            Utility.log(tag, e);
            Dialogs.hideLoader(context);
            //  _view.onError(e);
            // DioErrorParser.parseError(e, _signupView);
          });
      }
    }
  getExpenseHistory(BuildContext context,String status) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.ExpenseHistory}?Status=$status',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);
          ExpenseHistoryResponse data = ExpenseHistoryResponse.fromJson(res.data);
          if (data?.status=='OK')
          _view.onExpenseHistoryFecthed(data);
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
    }}

  }








