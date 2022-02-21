import 'package:flutter/material.dart';
import 'package:hrms/add_leave_request/model/leave_type_response.dart';
import 'package:hrms/attendence/singleItem/attendance_request_list.dart';
import 'package:hrms/res/Images.dart';
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
  List<int> yearList = [];


  @override
  void initState() {
    _presenter = LeaveHistoryPresenter(this);
    _presenter.getLeaveHistory(context);
    yearList = [2017, 2018, 2019, 2020, 2021];

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

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          DropdownButtonFormField<int>(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: AppColors.dropbg,
                              ),
                              dropdownColor: Colors.white,
                              onChanged: (int value) {
                                setState(() {
                                  //_selected = value;
                                /*  widget?._request?.leaveTypeId =
                                      value.leaveTypeId.toString();
                                  widget?._request?.leaveType =
                                      value.leavetype;*/
                                });
                              },
                              hint: Text('2022'),
                              icon: new Image.asset(Images.DropIcon),
                               items: yearList.map((e) => DropdownMenuItem(
                                   child: Text(e.toString()),
                                   value: e))
                                   .toList(),
                              ),

                          SizedBox(height: 20,),
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
