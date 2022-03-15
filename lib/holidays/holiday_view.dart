


import 'package:hrms/base/base_view.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';

import 'model/GetAllHolidaysResponse.dart';

abstract class HolidayView extends BaseView  {
  void onFeedHolidayFecthed(GetAllHolidaysResponse response);

}