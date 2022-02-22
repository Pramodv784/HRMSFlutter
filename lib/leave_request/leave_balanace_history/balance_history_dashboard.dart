import 'package:flutter/material.dart';
import 'package:hrms/leave_request/leave_balanace_history/leave_balance/leave_balance_page.dart';
import 'package:hrms/leave_request/leave_balanace_history/leave_history/leave_history_request.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Header.dart';

class BalanceHistoryDashboard extends StatefulWidget {
  const BalanceHistoryDashboard({Key key}) : super(key: key);

  @override
  _BalanceHistoryDashboardState createState() => _BalanceHistoryDashboardState();
}

class _BalanceHistoryDashboardState extends State<BalanceHistoryDashboard>  with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    setState(() {

    });
    super.initState();
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(children: [
            Header(
              headerText: 'Leave Balance',
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
                                  'Balance',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),

                              // second tab [you can add an icon using the icon property]
                              Tab(
                                child: Text(
                                  'History',
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

                                LeaveBalancePage(),

                              // second tab bar view widget
                                LeaveHistoryRequest(),
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
