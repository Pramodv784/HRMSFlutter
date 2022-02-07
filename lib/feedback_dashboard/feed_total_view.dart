

import 'model/avg_month_response.dart';
import 'model/feed_total_avg_response.dart';
abstract class FeedTotalView   {
  void onFeedTotalFecthed(FeedTotalAvgResponse response);
  void onAvgMothFecthed(List<AvgMonthResponse> response);

}