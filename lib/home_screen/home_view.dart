

import 'package:hrms/feedback/select_emp/model/employee_data.dart';
import 'package:hrms/home_screen/model/check_in_response.dart';
import 'package:hrms/home_screen/model/home_data.dart';



abstract class HomeView   {
  void onHomeFecthed(HomeData response);
  void onCheckInFecthed(CheckInResponse response);



}