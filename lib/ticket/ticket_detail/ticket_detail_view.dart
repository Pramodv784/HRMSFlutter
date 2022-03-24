


import 'package:hrms/base/base_view.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
import 'package:hrms/ticket/ticket_detail/model/TicketDetailResposne.dart';
abstract class TicketDetailView extends BaseView  {
  void onTicketDetailFecthed(TicketDetailResposne response);

}