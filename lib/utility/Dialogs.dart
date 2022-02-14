import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'Utility.dart';

class Dialogs {


  static void hideLoader(BuildContext context) {
    Navigator.pop(context);
    /* if (_dialog != null)
      _dialog.hide().then((value) {
        print("Hide Loader $value");
        print("Hide Loader ${_dialog.isShowing()}");
        if (_dialog.isShowing()) {
          _dialog.hide();
        }
      });*/
  }

  static ProgressDialog _dialog;

  static void showLoader(BuildContext context, String description,
      String title) {
   /* _dialog = ProgressDialog(context,
        type: ProgressDialogType.Normal,
        isDismissible: false,
        customBody: Container(
          height: 65.0,
          child: Row(
            children: [
              horizontalSpace(20.0),
              Container(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.colorPrimary))),
              horizontalSpace(20.0),
              Expanded(
                  child:
                  Text('$description', style: textStylePrimary14px500w,
                      overflow: TextOverflow.ellipsis)),
            ],
          ),
        ));

    _dialog.show();*/
    final spinkit = SpinKitThreeBounce(
      color: AppColors.red,
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return spinkit;
      },
    );
  }

  static Widget buildProgressIndicator(bool isLoading) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );
  }


  static showCustomDialog(BuildContext context,
      {Function onAccept, Function onReject, String title, String message}) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "No",
        style: textStyleDark16px600w,
      ),
      onPressed: onReject ?? () => Navigator.pop(context),
    );
    Widget continueButton = TextButton(
      child: Text(
        "Yes",
        style: textStyleWhite16px600w,
      ),
      onPressed: onAccept,
    );


    // set up the AlertDialog
    Scaffold body = Scaffold(
      backgroundColor: AppColors.background.withOpacity(0.1),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          height: Utility.screenHeight(context) * .23,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('$title', style: textStyleRegular16px700w),
              Text('$message', style: textStyle12px500w),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          width: 1,
                          color: AppColors.textColor,
                        ),
                      ),
                      child: cancelButton,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50.0,
                      margin: EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 0.0),
                      decoration: BoxDecoration(
                        color: AppColors.colorPrimary,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: continueButton,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return body;
      },
    );
  }


  static showCustomProgress(BuildContext context) {
    final spinkit = SpinKitThreeBounce(
    color: AppColors.red,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return spinkit;
      },
    );


  }


  static showMsgCustomDialog(BuildContext context,
      { Function onok, String title, String message}) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "OK",
        style: textStyleLite16px700w,
      ),
      onPressed: onok ?? () => Navigator.pop(context),
    );



    // set up the AlertDialog
    Scaffold body = Scaffold(
      backgroundColor: AppColors.background.withOpacity(0.1),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40.0),
          height: Utility.screenHeight(context) * .23,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('$title', style: textStyleRegular16px700w,textAlign: TextAlign.center,),
                Text('$message', style: textStyle12px500w),
                Container(
                  height: 50.0,
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                  decoration: BoxDecoration(
                    color: AppColors.colorPrimary,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      width: 1,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                  child: cancelButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return body;
      },
    );
  }

}
abstract class ClickInterface {
  void onClick();
}

/*
AlertDialog(
backgroundColor: AppColors.colorPrimary,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(10))),
contentPadding: EdgeInsets.all(0),
titlePadding: EdgeInsets.all(0),
title: Container(
width: Utility.screenWidth(context),
height: 50,
decoration: BoxDecoration(
borderRadius: BorderRadius.only(
topLeft: Radius.circular(10), topRight: Radius.circular(10)),
color: AppColors.colorPrimary,
),
alignment: Alignment.center,
child: Text(title,
style: TextStyle(
color: AppColors.white,
fontFamily: kFontFamily,
fontWeight: FontWeight.bold,
fontSize: 18)),
),
content: Stack(
children: <Widget>[
Container(
color: AppColors.white,
margin: EdgeInsets.only(bottom: 50),
child: SingleChildScrollView(
child: Container(
width: Utility.screenWidth(context),
padding: EdgeInsets.all(10),
),
),
),
Positioned(
bottom: 0,
left: 0,
right: 0,
child: InkWell(
child: Container(
width: Utility.screenWidth(context),
height: 50,
decoration: BoxDecoration(
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular(10),
bottomRight: Radius.circular(10)),
color: AppColors.colorPrimary,
),
alignment: Alignment.center,
child: Text(
"Close",
style: TextStyle(
color: AppColors.white,
fontFamily: kFontFamily,
fontWeight: FontWeight.bold,
fontSize: 18),
),
),
onTap: () {
Navigator.pop(context);
listener.onClick();
},
),
),
],
),
)*/
