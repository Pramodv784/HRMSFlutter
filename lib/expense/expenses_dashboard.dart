import 'package:flutter/material.dart';
import 'package:hrms/expense/total_expenses_list.dart';
import 'package:hrms/leave_request/model/data_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Header.dart';

class ExpensesDashboard extends StatefulWidget {
  const ExpensesDashboard({Key key}) : super(key: key);

  @override
  _ExpensesDashboardState createState() => _ExpensesDashboardState();
}

class _ExpensesDashboardState extends State<ExpensesDashboard> with SingleTickerProviderStateMixin {

  TabController _tabController;
  List<Widget> widgetExpensesList=[];
  List<Widget> widgetAdvancesSettlement=[];


  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    for (TimeModel t in timeList) {
      widgetExpensesList.add(TotalExpensesList(t));;
    }
    for (TimeModel t in helpList) {
      widgetAdvancesSettlement.add(TotalExpensesList(t));
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
                Header(headerText: 'History',),
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

                                gradient:const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomLeft,
                                    colors: [AppColors.g1, AppColors.g2]
                                ),
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              tabs: const [
                                // first tab [you can add an icon using the icon property]
                                Tab(
                                  child: Text('Expenses',style: TextStyle(fontWeight:FontWeight.bold),),
                                ),

                                // second tab [you can add an icon using the icon property]
                                Tab(
                                  child: Text('Advances Settlement',style: TextStyle(fontWeight:FontWeight.bold),),
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
                                    const SizedBox(height: 30,),
                                    ...widgetExpensesList

                                  ],
                                ),

                                // second tab bar view widget
                                ListView(
                                  children: [
                                    const SizedBox(height: 30,),
                                    ...widgetAdvancesSettlement
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
