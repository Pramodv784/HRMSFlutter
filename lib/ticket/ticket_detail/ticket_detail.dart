import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/ticket/ticket_detail/model/AddCommentResponse.dart';
import 'package:hrms/ticket/ticket_detail/model/AddTicketCommentRequest.dart';
import 'package:hrms/ticket/ticket_detail/model/TicketDetailResposne.dart';
import 'package:hrms/ticket/ticket_detail/ticket_detail_presenter.dart';
import 'package:hrms/ticket/ticket_detail/ticket_detail_view.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/Utility.dart';

import '../model/GetMyCaseResponse.dart';
import '../model/TicketResponse.dart';

class TicketDetail extends StatefulWidget {
  OpenTicket _data;
   TicketDetail(this._data,{Key key}) : super(key: key);

  @override
  _TicketDetailState createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> implements TicketDetailView {

  AddTicketCommentRequest _request=AddTicketCommentRequest();
  List<CommentList> commentList=[];
  String msg='';
  final myController = TextEditingController();
  final _controller = ScrollController();
  TicketDetailPresenter _presenter;

  @override
  void initState() {
    _presenter=TicketDetailPresenter(this);
    _presenter.getTicketDetail( widget._data.ticketId);
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
              child: RefreshIndicator(
                onRefresh: _pullRefresh,
                child: SingleChildScrollView(
                  controller: _controller,
                  child: ListView.builder(
                    itemCount: commentList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Container(
                        padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                        child: Align(
                          alignment: (commentList[index].commentType == "RECIVER"?Alignment.topLeft:Alignment.topRight),
                          child: Column(
                            crossAxisAlignment: commentList[index].commentType == "RECIVER"?CrossAxisAlignment.start:CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: (commentList[index].commentType  == "RECIVER"?Color(0xFF616576):Colors.white),
                                    border: commentList[index].commentType  == "RECIVER"?
                                    Border.all(color: AppColors.white):Border.all(width: 0.5,color: AppColors.black)
                                ),
                                padding: EdgeInsets.all(7.0),
                                child: Text(commentList[index].message, style: TextStyle(fontSize: 15,color:
                                commentList[index].commentType  == "RECIVER"?AppColors.white:AppColors.black),),
                              ),
                              SizedBox(height: 3.0,),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text('${Utility.formatDate(commentList[index]?.createOn??'')}',style: TextStyle(fontSize: 10.0),),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

                Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    height: 70,
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
                                hintText: "Write comment...",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none),
                          ),
                        ),
                      ),

                      FloatingActionButton(
                        onPressed: () {
                          if(myController.text.isNotEmpty){
                            _request.message=myController.text;
                            _request.ticketId=widget._data.ticketId;
                            _presenter.AddTicketComment(context, _request);
                            //messages.add(ChatMessage(messageContent: myController.text, messageType: 'sender'));
                            setState(() {

                            });
                            final screenHeight = MediaQuery.of(context).size.height;

                            // If you don't want any animation, use this:
                          //  _controller.jumpTo(screenHeight);

                            // Otherwise use this:
                            _controller.animateTo(_controller.position.maxScrollExtent,
                                curve: Curves.easeOut,
                                duration: const Duration(milliseconds: 500));
                           // _controller.animateTo(0.0, curve: Curves.easeOut, duration: Duration(seconds: 1));
                            myController.clear();
                          }
                          else{
                            Utility.showErrorToast(context, 'please enter message');
                          }



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
  Future<void> _pullRefresh() async {
    _presenter.getTicketDetail(widget._data.ticketId);
    setState(() {});
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
     commentList.clear();
     commentList.addAll(response.data.commentList);
     setState(() {

     });
  }

  @override
  void onTicketDetailCommentPost(AddCommentResponse response) {
   _presenter.getTicketDetail(widget._data.ticketId);
   setState(() {

   });
  }
}



