

import 'package:hrms/feedback/select_emp/model/employee_data.dart';

import 'model/team_data.dart';
import 'model/team_role_response.dart';

abstract class FeedView   {

  void onFeedTypeFecthed(TeamRoleResponse response);
  void onTeamdataFecthed(TeamData response);
  void onEmplyoeedataFecthed(EmployeeData response);


}