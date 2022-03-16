

import 'package:hrms/add_leave_request/model/add_leave_response.dart';
import 'package:hrms/add_leave_request/model/emp_key_response.dart';
import 'package:hrms/base/base_view.dart';
import 'package:hrms/feedback/model/add_feedback_response.dart';
import 'package:hrms/feedback/select_emp/model/employee_data.dart';
import 'package:hrms/workFromHome/model/get_work_from_list_response.dart';
import 'package:hrms/workFromHome/model/w_f_h_response.dart';




abstract class WorkFromHomeView extends BaseView  {


  void onAddWFHRequest(WFHResponse response);
  void onGetFHList(GetWorkFromListResponse response);
  void onEmpkeyFecthed(EmpKeyResponse response);



}