import 'package:flutter/material.dart';
import 'package:hrms/attendence/model/attendence_log_response.dart';
import 'package:hrms/attendence/presenter/attendence_presenter.dart';
import 'package:hrms/attendence/singleItem/attendance_logs_list.dart';
import 'package:hrms/attendence/view/attendence_view.dart';
import 'package:hrms/utility/Utility.dart';

class AttendanceLogs extends StatefulWidget {
  const AttendanceLogs({Key key}) : super(key: key);

  @override
  _AttendanceLogsState createState() => _AttendanceLogsState();
}

class _AttendanceLogsState extends State<AttendanceLogs> implements AttendenceView{

  AttendencePresenter _presenter;
  AttendenceLogResponse _response;
  List<Widget> attendenceList=[];

  @override
  void initState() {
    _presenter=AttendencePresenter(this);
    _presenter.getAttendence(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: [
            ...attendenceList
          ],
    ));
  }

  @override
  void onAttendenceFetch(AttendenceLogResponse response) {
      print('attendence Response ***${response}');
      _response=response;
      attendenceList.clear();
      for(Data dat in response.data)
        {
          attendenceList.add(AttendanceLogsList(dat));
        }
      setState(() {

      });
  }

  @override
  onError(String message) {
  Utility.showErrorToast(context, message);
  }
}
