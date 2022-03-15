


import 'package:hrms/base/base_view.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
import 'package:hrms/myteam/model/GetMyTeamResposne.dart';
abstract class TeamView extends BaseView  {
  void onFeedHistoryFecthed(FeedHistoryResponse response);
  void onTeamFecthed(GetMyTeamResposne response);

}