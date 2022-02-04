import 'package:flutter/material.dart';
import 'package:hrms/attendence/singleItem/attendance_request_list.dart';

import 'singleItem/attendance_logs_list.dart';

class AttendanceRequest extends StatefulWidget {
  const AttendanceRequest({Key key}) : super(key: key);

  @override
  _AttendanceRequestState createState() => _AttendanceRequestState();
}

class _AttendanceRequestState extends State<AttendanceRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          AttendanceRequestList(),
          SizedBox(
            height: 20.0,
          ),

          AttendanceRequestList(),
          SizedBox(
            height: 20.0,
          ),

          AttendanceRequestList(),
          SizedBox(
            height: 20.0,
          ),

        ],
      ),
    );
  }
}
