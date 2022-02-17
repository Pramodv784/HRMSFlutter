import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/feedback/empfeedback/model/feed_question_model.dart';
import 'package:hrms/feedback/feed_question_view.dart';
import 'package:hrms/feedback/select_emp/model/employee_data.dart';
import 'package:hrms/home_screen/home_view.dart';
import 'package:hrms/home_screen/model/check_in_response.dart';
import 'package:hrms/home_screen/model/checkout_response.dart';
import 'package:hrms/home_screen/model/get_attendence_response.dart';
import 'package:hrms/home_screen/model/home_data.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';

import 'model/check_in_request.dart';
import 'model/check_out_request.dart';

class HomePresenter {
  var tag = 'HomePresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');


  HomeView _view;
  ApiController _repository = ApiController.getInstance();

  HomePresenter(this._view);



  getHomeData(BuildContext context) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
    //  Dialogs.showCustomProgress(context);
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetHomeData}',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          Dialogs.hideLoader(context);

          HomeData data = HomeData.fromJson(res.data);
          //print('pramod${data.data.message}');

         // if (data?.dataCategory?.isNotEmpty)
            _view.onHomeFecthed(data);

        }
        ).catchError((e) async {
          Utility.log(tag, e);
         Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }
  getAttendence(BuildContext context,int id) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      _repository.get2('${EndPoints.GetAttendence}?empId=$id',headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          Dialogs.hideLoader(context);

          GetAttendenceResponse data = GetAttendenceResponse.fromJson(res.data);
            if(data?.status??false)
          _view.onAttendenceFetch(data);
            else{
              _view.onError(data?.message);
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



  CheckIn(BuildContext context,CheckInRequest checkInRequest) async {

    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.post(EndPoints.CheckIn, body: checkInRequest.toJson(),headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);

          Dialogs.hideLoader(context);
          CheckInResponse data = CheckInResponse.fromJson(res.data);
          //print('pramod${data.data.message}');

          //  if (data?.statusReason?? false)
          _view.onCheckInFecthed(data);
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
  CheckOut(BuildContext context,CheckOutRequest checkOutRequest) async {

    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.put(EndPoints.CheckOut, body: checkOutRequest.toJson(),headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>',jsonDecode(res.toString()) );
          Dialogs.hideLoader(context);
          CheckoutResponse data = CheckoutResponse.fromJson(res.data);
            if (data?.status?? false)
          _view.onCheckOutFetch(data);
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
