

import 'package:hrms/add_leave_request/model/add_leave_response.dart';
import 'package:hrms/add_leave_request/model/emp_key_response.dart';
import 'package:hrms/feedback/model/add_feedback_response.dart';
import 'package:hrms/feedback/select_emp/model/employee_data.dart';
import 'model/add_leave_request.dart';
import 'model/leave_type_response.dart';



abstract class LeaveView   {

  void onLeaveFecthed(LeaveTypeResponse response);
  void onAddLeaveFecthed(AddLeaveResponse response);
  void onEmpkeyFecthed(EmpKeyResponse response);



}