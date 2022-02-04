import 'package:flutter/material.dart';
import 'package:hrms/attendence/singleItem/attendance_logs_list.dart';

class AttendanceLogs extends StatefulWidget {
  const AttendanceLogs({Key key}) : super(key: key);

  @override
  _AttendanceLogsState createState() => _AttendanceLogsState();
}

class _AttendanceLogsState extends State<AttendanceLogs> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        AttendanceLogsList(),
        SizedBox(
          height: 20.0,
        ),
        AttendanceLogsList(),
      ],
    ));
  }
}
