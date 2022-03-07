


import 'package:hrms/base/base_view.dart';
import 'package:hrms/employee/model/employee_list_response.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
abstract class EmpView extends BaseView  {
  void onUserListFetch(EmployeeListResponse response);

}