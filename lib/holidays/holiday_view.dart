


import 'package:hrms/base/base_view.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
import 'package:hrms/holidays/model/get_all_holidays_response.dart';
abstract class HolidayView extends BaseView  {
  void onFeedHolidayFecthed(GetAllHolidaysResponse response);

}