


import 'package:hrms/base/base_view.dart';
import 'package:hrms/feedback_history/model/feed_history_response.dart';
import 'package:hrms/ticket/model/add_ticket_response.dart';
import 'package:hrms/ticket/model/ticket_type_response.dart';
abstract class TicketView extends BaseView  {
  void onTicketTypeFecthed(TicketTypeResponse response);
  void onTicketAddedFecthed(AddTicketResponse response);

}