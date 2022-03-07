import 'package:hrms/base/base_view.dart';
import 'package:hrms/home_screen/model/get_clock_in_time_response.dart';

import 'package:hrms/home_screen/model/home_data.dart';
import 'package:hrms/home_screen/model/w_f_h_list_response.dart';

import 'model/check_in_out_response.dart';
import 'model/today_leave_response.dart';

abstract class HomeView extends BaseView {
  void onHomeFecthed(HomeData response);
  void onCheckInOutFetched(CheckInOutResponse response);
  void ongetClockInTimeFetch(GetClockInTimeResponse response);
  void onLeaveTodayFetch(TodayLeaveResponse response);
  void onWfhListFetched(WFHListResponse response);
}
