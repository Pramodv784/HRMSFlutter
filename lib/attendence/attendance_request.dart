import 'package:flutter/material.dart';
import 'package:hrms/add_leave_request/model/emp_key_response.dart';
import 'package:hrms/attendence/singleItem/attendance_request_list.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:hrms/workFromHome/model/get_work_from_list_response.dart';
import 'package:hrms/workFromHome/model/w_f_h_response.dart';
import 'package:hrms/workFromHome/presenter/wfh_presenter.dart';
import 'package:hrms/workFromHome/work_from_home_view.dart';

class AttendanceRequest extends StatefulWidget {
  const AttendanceRequest({Key key}) : super(key: key);

  @override
  _AttendanceRequestState createState() => _AttendanceRequestState();
}

class _AttendanceRequestState extends State<AttendanceRequest>
    implements WorkFromHomeView {
  WFHPresenter _presenter;
  List<Widget> wfhList = [];

  @override
  void initState() {
    _presenter = WFHPresenter(this);
    _presenter.getWFHRequestList(context,156 );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ...wfhList,

        ],
      ),
    );
  }

  @override
  void onAddWFHRequest(WFHResponse response) {}

  @override
  onError(String message) {
    Utility.showErrorToast(context, message);
  }

  @override
  void onGetFHList(GetWorkFromListResponse response) {
    for (WorkFromHomeList workFromHomeList in response.workFromHomeList) {
      wfhList.add(AttendanceRequestList(workFromHomeList));
    }
    setState(() {
    });
  }

  @override
  void onEmpkeyFecthed(EmpKeyResponse response) {
    // TODO: implement onEmpkeyFecthed
  }
}
