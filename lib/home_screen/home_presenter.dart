import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hrms/api_provider/ApiController.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/home_screen/home_view.dart';
import 'package:hrms/home_screen/model/check_in_response.dart';
import 'package:hrms/home_screen/model/checkout_response.dart';
import 'package:hrms/home_screen/model/get_attendence_response.dart';
import 'package:hrms/home_screen/model/get_my_attendence_response.dart';
import 'package:hrms/home_screen/model/home_data.dart';
import 'package:hrms/home_screen/model/w_f_h_list_response.dart';
import 'package:hrms/login_screen/model/login_response.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/NetworkCheck.dart';
import 'package:hrms/utility/Utility.dart';

import '../login_screen/model/login_response.dart';
import '../user/AuthUser.dart';
import '../user/CurrentUser.dart';
import 'model/check_in_request.dart';
import 'model/check_out_request.dart';
import 'model/today_leave_response.dart';

class HomePresenter {
  var tag = 'HomePresenter ';
  static const encryptionChannel = const MethodChannel('enc/dec');

  HomeView _view;
  ApiController _repository = ApiController.getInstance();

  HomePresenter(this._view);

  getHomeData(BuildContext context) async {
    if (await NetworkCheck.check()) {
      //Dialogs.showLoader(context, 'Loading ...', '');
      //  Dialogs.showCustomProgress(context);
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.get2('${EndPoints.GetHomeData}',
          headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
         // Dialogs.hideLoader(context);
           print('response code ***${res.statusCode}');



            HomeData data = HomeData.fromJson(res.data);
            _view.onHomeFecthed(data);

        }).catchError((e) async {
          Utility.log(tag, e);
          if(e is DioError){
            if(e.response.statusCode==401)
              {
                login();
              }
          }

          print('res code ***${e}');

        });
    }
  }

  getAttendence(BuildContext context, int id) async {
    if (await NetworkCheck.check()) {
    //  Dialogs.showLoader(context, 'Loading ...', '');
      _repository.get2('${EndPoints.GetAttendence}?empId=$id',
          headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
       //   Dialogs.hideLoader(context);

          GetAttendenceResponse data = GetAttendenceResponse.fromJson(res.data);
          if (data?.status ?? false)
            _view.onAttendenceFetch(data);
          else {
            _view.onError(data?.message);
          }
        }).catchError((e) async {
          Utility.log(tag, e);

        });
    }
  }
  getMyAttendence(BuildContext context, int id) async {
    if (await NetworkCheck.check()) {
      //  Dialogs.showLoader(context, 'Loading ...', '');
      _repository.get2('${EndPoints.GetMyTodayAttendence}?empId=$id',
          headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          //   Dialogs.hideLoader(context);

          GetMyAttendenceResponse data = GetMyAttendenceResponse.fromJson(res.data);
          if (data?.status ?? false)
            _view.onMyAttendenceFetch(data);
          else {
            _view.onError(data?.message);
          }
        }).catchError((e) async {
          Utility.log(tag, e);
          // Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }

  getLeaveToday(BuildContext context) async {
    if (await NetworkCheck.check()) {
      _repository.get2('${EndPoints.LeaveToday}',
          headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));

          TodayLeaveResponse data = TodayLeaveResponse.fromJson(res.data);
          if (data?.status != 'No Data!')
            _view.onLeaveTodayFetch(data);
          else {
            _view.onError(data?.message);
          }
        }).catchError((e) async {
          Utility.log(tag, e);

          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }

  getWFHList(BuildContext context) async {
    if (await NetworkCheck.check()) {
      _repository.get2('${EndPoints.GetWFHAllRequestList}',
          headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));

          WFHListResponse data = WFHListResponse.fromJson(res.data);
          print('wfh **** ${data.workFromHomeList.length}');
          if (data?.status != 'No Data!')
            _view.onWfhListFetched(data);
          else {
            _view.onError(data?.message);
          }
        }).catchError((e) async {
          Utility.log(tag, e);

          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }

  CheckIn(BuildContext context, CheckInRequest checkInRequest) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.post(EndPoints.CheckIn,
          body: checkInRequest.toJson(), headers: await Utility.header());
      _repository.post(EndPoints.CheckIn,
          body: checkInRequest.toJson(), headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
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
        }).catchError((e) async {
          Utility.log(tag, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }

  CheckOut(BuildContext context, CheckOutRequest checkOutRequest) async {
    if (await NetworkCheck.check()) {
      Dialogs.showLoader(context, 'Loading ...', '');
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.put(EndPoints.CheckOut,
          body: checkOutRequest.toJson(), headers: await Utility.header())
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
         Dialogs.hideLoader(context);
          CheckoutResponse data = CheckoutResponse.fromJson(res.data);

          if (data?.status ?? false)
            _view.onCheckOutFetch(data);
          else {
            _view.onError(data.message);
          }
          //  }
        }).catchError((e) async {
          Utility.log(tag, e);
          Dialogs.hideLoader(context);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }
  login() async {
    if (await NetworkCheck.check()) {
      Map input = HashMap();
      input["UserName"] = await AuthUser.getInstance().GetUserEmail();
      input["Password"] = await AuthUser.getInstance().GetUserPass();
      // Dialogs.showLoader(context, 'Please wait getting chapters', '');
      _repository.post(EndPoints.Login, body: input)
        ..then((Response res) async {
          Utility.log(tag, res);
          Utility.log('${tag}>>>', jsonDecode(res.toString()));
          // final decoded_data = GZipCodec().decode(res.data.bodyBytes);
          //Utility.log('${tag}>>>pramod>>>',decoded_data.first);
          LoginResponse data = LoginResponse.fromJson(res.data);
          var currentUser = CurrentUser()..userCredentials = data;
          currentUser.isLoggedIn = true;
          currentUser.userId = data.userprofile.userId;
          currentUser.userName = data.userprofile.fullName;

          AuthUser.getInstance().login(currentUser);
          //print('pramod${data.data.message}');
        }).catchError((e) async {
          Utility.log(tag, e);
          // Utility.showErrorToast(context, e);
          //  _view.onError(e);
          // DioErrorParser.parseError(e, _signupView);
        });
    }
  }
}
