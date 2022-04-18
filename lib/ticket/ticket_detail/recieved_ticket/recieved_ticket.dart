

import 'package:flutter/material.dart';
import 'package:hrms/ticket/ticket_detail/model/AddCommentResponse.dart';
import 'package:hrms/ticket/ticket_detail/recieved_ticket/model/RecievedTicketResponse.dart';
import 'package:hrms/ticket/ticket_detail/recieved_ticket/model/ticket_receive_detail_resposne.dart';
import 'package:hrms/ticket/ticket_detail/recieved_ticket/received_tem.dart';
import 'package:hrms/ticket/ticket_detail/recieved_ticket/ticket_recieve_view.dart';
import 'package:hrms/ticket/ticket_detail/recieved_ticket/ticket_recieved_presenter.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/Utility.dart';

import '../../ticket_list_item.dart';
class RecievedTicket extends StatefulWidget {
  const RecievedTicket({Key key}) : super(key: key);

  @override
  State<RecievedTicket> createState() => _RecievedTicketState();
}

class _RecievedTicketState extends State<RecievedTicket>  implements TicketRecivedView{

  TicketRecievedPresenter _presenter;
  List<OpenTicket> list=[];

  @override
  void initState() {
    _presenter=TicketRecievedPresenter(this);
    _presenter.getReceivedTicket(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Column(
        children: [
          Header(headerText: "Received Ticket",),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Card(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ListView.builder(
                     itemCount: list.length,
                     itemBuilder:(context,index){
                       return ReceivedItem(list[index]);
                     }
                   ),
                 ),
               ),
             ),
           )
        ],
      ),
      ),
    );
  }

  @override
  onError(String message) {
  Utility.showErrorToast(context, message);
  }

  @override
  onRecievedFetch(RecievedTicketResponse response) {
  list.clear();
  list.addAll(response.data.openTicket);
  setState(() {

  });
  }

  @override
  onRecievedDetailFetch(TicketReceiveDetailResposne response) {

  }

  @override
  onRecievedDetailCommentFetch(AddCommentResponse response) {

  }
}
