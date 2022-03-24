import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/ticket/ticket_detail/model/TicketDetailResposne.dart';
import 'package:hrms/ticket/ticket_detail/ticket_detail_presenter.dart';
import 'package:hrms/ticket/ticket_detail/ticket_detail_view.dart';
import 'package:hrms/utility/Header.dart';

class TicketDetail extends StatefulWidget {
   TicketDetail({Key key}) : super(key: key);

  @override
  _TicketDetailState createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> implements TicketDetailView {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),


  ];
  String msg='';
  final myController = TextEditingController();
  final _controller = ScrollController();
  TicketDetailPresenter _presenter;

  @override
  void initState() {
    _presenter=TicketDetailPresenter(this);
    _presenter.getTicketDetail(context, 0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(headerText: 'Ticket Detail',),
            Expanded(
              child: SingleChildScrollView(
                controller: _controller,
                child: ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                      child: Align(
                        alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (messages[index].messageType  == "receiver"?Color(0xFF616576):Colors.white),
                              border: messages[index].messageType  == "receiver"?
                              Border.all(color: AppColors.white):Border.all(width: 1.0,color: AppColors.black)
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15,color:
                          messages[index].messageType  == "receiver"?AppColors.white:AppColors.black),),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

                Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: TextField(
                            maxLines: null,
                            controller: myController,
                            decoration: InputDecoration(
                                hintText: "Write message...",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          messages.add(ChatMessage(messageContent: myController.text, messageType: 'sender'));
                          setState(() {

                          });
                          final screenHeight = MediaQuery.of(context).size.height;

                          // If you don't want any animation, use this:
                          _controller.jumpTo(screenHeight);

                          // Otherwise use this:
                          _controller.animateTo(screenHeight, curve: Curves.easeOut, duration: Duration(seconds: 1));
                          myController.clear();
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        backgroundColor: AppColors.colorPrimary,
                        elevation: 0,
                      ),
                    ])),

              ],
            ),
      ),
    );
  }
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  onError(String message) {

  }

  @override
  void onTicketDetailFecthed(TicketDetailResposne response) {

  }
}
class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}
/*
Stack(
children: [
Padding(
padding: const EdgeInsets.all(10.0),
child: SingleChildScrollView(
controller: _controller,
padding: EdgeInsets.all(10.0),
child: ListView.builder(
itemCount: messages.length,
shrinkWrap: true,
padding: EdgeInsets.only(top: 10,bottom: 10),
physics: NeverScrollableScrollPhysics(),
itemBuilder: (context, index){
return Container(
padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
child: Align(
alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
child: Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(20),
color: (messages[index].messageType  == "receiver"?Color(0xFF616576):Colors.white),
border: messages[index].messageType  == "receiver"?
Border.all(color: AppColors.white):Border.all(width: 1.0,color: AppColors.black)
),
padding: EdgeInsets.all(16),
child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15,color:
messages[index].messageType  == "receiver"?AppColors.white:AppColors.black),),
),
),
);
},
),
),
),

Positioned.fill(
child: Align(
alignment: Alignment.bottomLeft,
child: Container(
padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
height: 60,
width: double.infinity,
color: Colors.white,
child: Row(children: <Widget>[
GestureDetector(
onTap: () {},
child: Container(
height: 30,
width: 30,
decoration: BoxDecoration(
color: Colors.grey,
borderRadius: BorderRadius.circular(30),
),
child: Icon(
Icons.add,
color: Colors.white,
size: 20,
),
),
),
SizedBox(
width: 15,
),
Expanded(
child: Container(
padding: EdgeInsets.symmetric(horizontal: 10.0),
decoration: BoxDecoration(
color: AppColors.grey,
borderRadius: BorderRadius.circular(20.0)
),
child: TextField(
maxLines: null,
controller: myController,
decoration: InputDecoration(
hintText: "Write message...",
hintStyle: TextStyle(color: Colors.black54),
border: InputBorder.none),
),
),
),
SizedBox(
width: 15,
),
FloatingActionButton(
onPressed: () {
messages.add(ChatMessage(messageContent: myController.text, messageType: 'sender'));
setState(() {

});
final screenHeight = MediaQuery.of(context).size.height;

// If you don't want any animation, use this:
_controller.jumpTo(screenHeight);

// Otherwise use this:
_controller.animateTo(screenHeight, curve: Curves.easeOut, duration: Duration(seconds: 1));
myController.clear();
},
child: Icon(
Icons.send,
color: Colors.white,
size: 18,
),
backgroundColor: Colors.grey,
elevation: 0,
),
])),
),
),

],
),*/
