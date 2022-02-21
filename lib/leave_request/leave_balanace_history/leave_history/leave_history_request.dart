import 'package:flutter/material.dart';
import 'package:hrms/attendence/singleItem/attendance_request_list.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:hrms/workFromHome/model/get_work_from_list_response.dart';
import 'package:hrms/workFromHome/model/w_f_h_response.dart';
import 'package:hrms/workFromHome/presenter/wfh_presenter.dart';
import 'package:hrms/workFromHome/work_from_home_view.dart';

import '../../../res/AppColors.dart';
import '../../../utility/Header.dart';
import 'leave_history_presenter.dart';
import 'leave_history_view.dart';
import 'leave_item_.dart';
import 'model/leave_request_history_response.dart';

class LeaveHistoryRequest extends StatefulWidget {
  const LeaveHistoryRequest({Key key}) : super(key: key);

  @override
  _LeaveHistoryRequestState createState() => _LeaveHistoryRequestState();
}

class _LeaveHistoryRequestState extends State<LeaveHistoryRequest>
    implements LeaveHistoryView {
  LeaveHistoryPresenter _presenter;
  List<Widget> leaveHistoryList = [];

  @override
  void initState() {
    _presenter = LeaveHistoryPresenter(this);
    _presenter.getLeaveHistory(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
            child: Column(children: [
          Expanded(
            child: ListView(
              children: [
                Header(
                  headerText: 'Leave  History',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ...leaveHistoryList,
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          )
        ])));
  }

  @override
  void onAddWFHRequest(WFHResponse response) {}

  @override
  onError(String message) {
    Utility.showErrorToast(context, message);
  }

  @override
  void onLeaveHistoryFetched(LeaveRequestHistoryResponse response) {
    for (LeaveRequestList item in response.leaveRequestList) {
      leaveHistoryList.add(LeaveItem(item));
    }
    setState(() {});
  }
}
