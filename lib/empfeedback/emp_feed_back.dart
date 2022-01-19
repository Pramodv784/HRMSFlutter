import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';

import 'card_feed.dart';
class EmpFeedBack extends StatefulWidget {
  const EmpFeedBack({Key key}) : super(key: key);

  @override
  _EmpFeedBackState createState() => _EmpFeedBackState();
}

class _EmpFeedBackState extends State<EmpFeedBack> {
  bool check=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(

      child: Column(
      children: [
      Header(headerText: 'Employee Feedback',),
    Expanded(child:
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
        SizedBox(height: 20.0,),
        Container(
          height: 50.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient:
          LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [AppColors.g1, AppColors.g2]
          ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500],
                  offset: Offset(0.0, 1.5),
                  blurRadius: 1.5,
                ),
              ],borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0))),
          child: Text('Development',style: textStyleWhite16px400wB,),
        ),
        CardFeed(),
        CardFeed(),
        CardFeed(),
        CardFeed(),

      ]
      ),
    )
    ),
        bottomButton()
    ])
    )
    );
  }
  Container bottomButton() {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(0, -6),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: RevButton(
              height: 55.0,
              text: 'Cancel',
              textStyle: textStyleDark16px600w,
              color: AppColors.grey,
              radius: 50.0,
              borderColor: AppColors.grey,
              onTap: () async {
                // opendDialog();
              },
            ),
          ),
          horizontalSpace(10.0),
          Expanded(
            child: RevButton(
              width: 55.0,
              text: 'Next',
              radius: 50.0,
              borderColor: AppColors.colorPrimary,
              textStyle: textStyleWhite14px600w,
              onTap: () {
                // Navigator.pushNamed(context, Screens.AddFeedBack );
              },
            ),
          ),
        ],
      ),
    );
  }
}
