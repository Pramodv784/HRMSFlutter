import 'package:hrms/add_feedback/model/team_data.dart';
import 'package:hrms/add_feedback/model/team_role_response.dart';

abstract class FeedView   {

  void onFeedTypeFecthed(TeamRoleResponse response);
  void onTeamdataFecthed(TeamData response);


}