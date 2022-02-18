import 'package:hrms/base/base_view.dart';
import 'package:hrms/home_screen/model/check_in_response.dart';
import 'package:hrms/home_screen/model/checkout_response.dart';
import 'package:hrms/home_screen/model/home_data.dart';
import 'package:hrms/home_screen/model/w_f_h_list_response.dart';

import 'model/get_attendence_response.dart';
import 'model/today_leave_response.dart';

abstract class HomeView extends BaseView {
  void onHomeFecthed(HomeData response);
  void onCheckInFecthed(CheckInResponse response);
  void onAttendenceFetch(GetAttendenceResponse response);
  void onCheckOutFetch(CheckoutResponse response);
  void onLeaveTodayFetch(TodayLeaveResponse response);
  void onWfhListFetched(WFHListResponse response);
}
