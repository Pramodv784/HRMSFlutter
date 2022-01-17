import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Header.dart';

import 'card_feed.dart';
class EmpFeedBack extends StatefulWidget {
  const EmpFeedBack({Key key}) : super(key: key);

  @override
  _EmpFeedBackState createState() => _EmpFeedBackState();
}

class _EmpFeedBackState extends State<EmpFeedBack> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(

      child: Column(
      children: [
      Header(headerText: 'Employee Feedback',),
    Expanded(child:
    ListView(children: [
      CardFeed()
    ]
    )
    )
    ])
    )
    );
  }
}
