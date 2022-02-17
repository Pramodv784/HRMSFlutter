import 'package:flutter/material.dart';
import 'package:hrms/attendence/attendance_logs.dart';
import 'package:hrms/attendence/singleItem/attendance_logs_list.dart';
import 'package:hrms/attendence/attendance_request.dart';
import 'package:hrms/attendence/singleItem/attendance_summary_list.dart';
import 'package:hrms/expense/expense_presenter.dart';
import 'package:hrms/expense/expense_view.dart';
import 'package:hrms/expense/model/add_expense_response.dart';
import 'package:hrms/expense/model/expense_category_response.dart';
import 'package:hrms/expense/model/expense_history_response.dart';
import 'package:hrms/expense/model/get_project_list_response.dart';
import 'package:hrms/expense/total_expenses_list.dart';
import 'package:hrms/profile/model/upload_image_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/Utility.dart';

class ExpenseHistory extends StatefulWidget {
  const ExpenseHistory({Key key}) : super(key: key);

  @override
  _ExpenseHistory createState() => _ExpenseHistory();
}

class _ExpenseHistory extends State<ExpenseHistory>
    with SingleTickerProviderStateMixin implements ExpenseView {
  TabController _tabController;
  List<Widget> widgetApproveList = [];
  List<Widget> widgetRejectList = [];
  ExpensePresenter _presenter;


  @override
  void initState() {
    _presenter=ExpensePresenter(this);
          _presenter.getExpenseHistory(context, 'Approve');
    _tabController = TabController(length: 2, vsync: this);



   _tabController.addListener(() {
     print('controller index '+_tabController.index.toString());
     _tabController.index==0?_presenter.getExpenseHistory(context, 'Approve')
         :_presenter.getExpenseHistory(context, 'Reject');
   });
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
              headerText: 'Expense History',
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
                                'Approve',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),

                            // second tab [you can add an icon using the icon property]
                            Tab(
                              child: Text(
                                'Reject',
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
                                ...widgetApproveList
                              ],
                            ),

                            // second tab bar view widget
                            ListView(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                ...widgetRejectList
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

  @override
  void onAddExpenseFecthed(AddExpenseResponse response) {
    // TODO: implement onAddExpenseFecthed
  }

  @override
  void onExpenseCateFecthed(ExpenseCategoryResponse response) {
    // TODO: implement onExpenseCateFecthed
  }

  @override
  void onExpenseHistoryFecthed(ExpenseHistoryResponse response) {
     for(int i=0;i<= response.expenseList.length;i++){
        if(response.expenseList[i].expenseStatus=='Reject'){
          widgetRejectList.add(TotalExpensesList(response.expenseList[i]));
        }
        else{
          widgetApproveList.add(TotalExpensesList(response.expenseList[i]));
        }
     }
     setState(() {

     });
  }

  @override
  void onImageFecthed(UploadImageResponse response) {
    // TODO: implement onImageFecthed
  }

  @override
  onError(String message) {
   Utility.showErrorToast(context, message);
  }

  @override
  void onProjectListFecthed(GetProjectListResponse response) {
    // TODO: implement onProjectListFecthed
  }
}
