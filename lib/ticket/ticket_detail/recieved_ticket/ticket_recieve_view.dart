import 'package:hrms/base/base_view.dart';
import 'package:hrms/ticket/ticket_detail/recieved_ticket/model/RecievedTicketResponse.dart';
import 'package:hrms/ticket/ticket_detail/recieved_ticket/model/ticket_receive_detail_resposne.dart';

import '../model/AddCommentResponse.dart';

abstract class TicketRecivedView extends BaseView{
  onRecievedFetch(RecievedTicketResponse response);
  onRecievedDetailFetch(TicketReceiveDetailResposne response);
  onRecievedDetailCommentFetch(AddCommentResponse response);
}