


import 'package:hrms/base/base_view.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
abstract class FeedHistoryView extends BaseView  {
  void onFeedHistoryFecthed(FeedHistoryResponse response);

}