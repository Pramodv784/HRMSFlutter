import 'package:flutter/material.dart';
import 'package:hrms/attendence/attendance_logs.dart';
import 'package:hrms/attendence/singleItem/attendance_logs_list.dart';
import 'package:hrms/attendence/attendance_request.dart';
import 'package:hrms/attendence/singleItem/attendance_summary_list.dart';
import 'package:hrms/expense/total_expenses_list.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Header.dart';

class AttendanceDasboard extends StatefulWidget {
  const AttendanceDasboard({Key key}) : super(key: key);

  @override
  _AttendanceDasboardState createState() => _AttendanceDasboardState();
}

class _AttendanceDasboardState extends State<AttendanceDasboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Widget> widgetSummaryList = [];
  List<Widget> widgetLogsSettlement = [];
  List<Widget> widgetRequestSettlement = [];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    widgetSummaryList.add(const SummaryList());
    widgetLogsSettlement.add(const AttendanceLogs());
    widgetRequestSettlement.add(const AttendanceRequest());

    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Header(
              headerText: 'Attendance',
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
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                                colors: [AppColors.g1, AppColors.g2]),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: const [
                            // first tab [you can add an icon using the icon property]
                            Tab(
                              child: Text(
                                'Summary',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),

                            // second tab [you can add an icon using the icon property]
                            Tab(
                              child: Text(
                                'Logs',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Requests',
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
                            ListView(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                ...widgetSummaryList
                              ],
                            ),

                            // second tab bar view widget
                            AttendanceLogs(),

                            ListView(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                ...widgetRequestSettlement
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
