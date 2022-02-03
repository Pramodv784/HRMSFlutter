import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/leave_request/model/data_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Header.dart';

import 'card_leave.dart';
class LeaveRequestDashboard extends StatefulWidget {
  const LeaveRequestDashboard({Key key}) : super(key: key);

  @override
  _LeaveRequestDashboardState createState() => _LeaveRequestDashboardState();
}

class _LeaveRequestDashboardState extends State<LeaveRequestDashboard>
    with SingleTickerProviderStateMixin{
  TabController _tabController;
  List<Widget> widgettimeList=[];
  List<Widget> widgethelpList=[];
  List<Widget> widgetexpenseList=[];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    for(TimeModel t in timeList)
      {
        widgettimeList.add(CardLeave(t));
      }
    for(TimeModel t in helpList)
    {
      widgethelpList.add(CardLeave(t));
    }
    for(TimeModel t in expenseList)
    {
      widgetexpenseList.add(CardLeave(t));
    }


    setState(() {

    });
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(

      child: Column(
      children: [
      Header(headerText: 'Leave  Dashboard',),
    Expanded(child:
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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

                   gradient:LinearGradient(
                       begin: Alignment.topLeft,
                       end: Alignment.bottomLeft,
                       colors: [AppColors.g1, AppColors.g2]
                   ),
                 ),
                 labelColor: Colors.white,
                 unselectedLabelColor: Colors.black,
                 tabs: [
                   // first tab [you can add an icon using the icon property]
                   Tab(
                    child: Text('Time',style: TextStyle(fontWeight:FontWeight.bold),),
                   ),

                   // second tab [you can add an icon using the icon property]
                   Tab(
                     child: Text('Helpdesk',style: TextStyle(fontWeight:FontWeight.bold),),
                   ),
                   Tab(
                     child: Text('Expenses',style: TextStyle(fontWeight:FontWeight.bold),),
                   ),
                 ],
               ),
             ),
             Expanded(
               child: TabBarView(
                 controller: _tabController,
                 children: [
                   // first tab bar view widget
                   ListView(
                     children: [
                       SizedBox(height: 30,),
                      ...widgettimeList

                     ],
                   ),

                   // second tab bar view widget
                   ListView(
                     children: [
                       SizedBox(height: 30,),
                       ...widgethelpList
                     ],
                   ),
                   ListView(
                     children: [
                       SizedBox(height: 30,),
                       ...widgetexpenseList
                     ],
                   ),
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
}
