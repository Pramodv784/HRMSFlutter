import 'package:flutter/material.dart';
import 'package:hrms/expense/total_expenses_list.dart';
import 'package:hrms/leave_request/card_leave.dart';
import 'package:hrms/leave_request/model/data_model.dart';
import 'package:hrms/profile/model/upload_image_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/ticket/model/GetAllUser.dart';
import 'package:hrms/ticket/model/GetMyCaseResponse.dart';
import 'package:hrms/ticket/model/TicketCategoryResponse.dart';
import 'package:hrms/ticket/model/TicketPriorityResponse.dart';
import 'package:hrms/ticket/model/my_ticket_response.dart';
import 'package:hrms/ticket/ticket_list_item.dart';
import 'package:hrms/ticket/ticket_presenter.dart';
import 'package:hrms/ticket/ticket_view.dart';
import 'package:hrms/utility/Header.dart';

import '../user/AuthUser.dart';
import 'model/AddTicketResponse.dart';

class MyTicketDashBoard extends StatefulWidget {
  const MyTicketDashBoard({Key key}) : super(key: key);

  @override
  _MyTicketDashBoardState createState() => _MyTicketDashBoardState();
}

class _MyTicketDashBoardState extends State<MyTicketDashBoard>
    with SingleTickerProviderStateMixin implements TicketView {
  TabController _tabController;
  List<Widget> widgetOpenList=[];
  List<Widget> widgetClosedSettlement=[];
  TicketPresenter _presenter;
  List<MyTicketResponse> ticketList=[];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _presenter=TicketPresenter(this);



    setState(() {});
    super.initState();
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
/*  void getTicketList() async{
    ticketList= await _presenter.getMyTicketData(354);
    print('ticket listResponse ${ticketList.length}');
    for (MyTicketResponse t in ticketList) {
       if(t.caseStatus=='Open')
         {
           widgetOpenList.add(TicketListItem(t));
         }
       else
         {
           //widgetClosedSettlement.add(TicketListItem(t));
         }
    }
    setState(() {

    });

  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(children: [
            Header(
              headerText: 'My Tickets',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(
                              25.0,
                            ),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            // give the indicator a decoration (color and border radius)
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                25.0,
                              ),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomLeft,
                                  colors: [AppColors.g1, AppColors.g2]),
                            ),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              // first tab [you can add an icon using the icon property]
                              Tab(
                                child: Text(
                                  'Open',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),

                              // second tab [you can add an icon using the icon property]
                              Tab(
                                child: Text(
                                  'Closed',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              // first tab bar view widget

                              widgetOpenList.length >0?
                              ListView(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ...widgetOpenList
                                ],
                              ):
                              Image.asset(Images.IconNoDataFound),
                              // second tab bar view widget

                              widgetClosedSettlement.length >0?
                              ListView(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                 // ...widgetClosedSettlement
                                ],
                              ):
                              Image.asset(Images.IconNoDataFound)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
        ));
  }

  @override
  onError(String message) {
    // TODO: implement onError
    throw UnimplementedError();
  }

  @override
  void onTicketAddedFecthed(AddTicketResponse response) {
    // TODO: implement onTicketAddedFecthed
  }



  @override
  void onUserByDepartmentFecthed(GetAllUser response) {

  }

  @override
  void onGetMyCaseFecthed(GetMyCaseResponse response) {
     for(CaseDataList data in response.caseDataList)
       {
         widgetOpenList.add(TicketListItem(data,_presenter));
       }

     setState(() {

     });
  }

  @override
  void onImageFecthed(UploadImageResponse response) {
    // TODO: implement onImageFecthed
  }

  @override
  void onTicketPriorityFecthed(TicketPriorityResponse response) {
    // TODO: implement onTicketPriorityFecthed
  }

  @override
  void onTicketcateFecthed(TicketCategoryResponse response) {
    // TODO: implement onTicketcateFecthed
  }
}


