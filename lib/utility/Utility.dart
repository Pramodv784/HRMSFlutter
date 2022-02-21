import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:convert';

import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:intl/intl.dart';

import '../user/AuthUser.dart';



/// Created by Pratik Kataria on 20-02-2021.


class Utility {
  static final emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  static double screenWidth(BuildContext context) {
    // print('${MediaQuery.of(context).size.width/1.55}');
    return MediaQuery
        .of(context)
        .size
        .width;
  }
  static void showToast(BuildContext context, String text) async {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .height;
  }

  static var paddingSize15Box = SizedBox(
      height: 15
  );
  static var paddingSize10Box = SizedBox(
      height: 10
  );

  static var paddingSize30Box = SizedBox(
    height: 30,
  );

  static log(var tag, var message) {
    dev.log('\n\n*****************\n$tag\n$message\n*****************\n\n');
    // print('\n\n*****************\n$tag\n$message\n*****************\n\n');


  }


  static String getDateFormate(String serverdate)
  {

    final date = DateTime.parse(serverdate);
    final format = DateFormat('yyyy-MM-dd H:m:s');
    print(format.format(date));
    return format.format(date);
  }
  static String formatDate(String date) {
    //format: yyyy-MM-dd'T'HH:mm:ss.SSSZ
    if (date == "") return "";
    DateTime dt = DateTime.parse(date);
    String dtm = DateFormat("MMM dd, yyyy").format(dt);
    return dtm;
  }

  static String getDateMonth(String date) {
    //format: yyyy-MM-dd'T'HH:mm:ss.SSSZ
    if (date == "") return "";
    DateTime dt = DateTime.parse(date);
    String dtm = DateFormat("dd MMM").format(dt);
    return dtm;
  }
  static String getDayFromServer(String date) {
    //format: yyyy-MM-dd'T'HH:mm:ss.SSSZ
    if (date == "") return "";
    DateTime dt = DateTime.parse(date);
    String dtm = DateFormat("EEEE").format(dt);
    return dtm;
  }

  /* static void CustomToast(BuildContext context,String) async{
    Widget widget = Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          width: 40.0,
          height: 40.0,
          color: Colors.grey.withOpacity(0.3),
          child: Icon(
            Icons.add,
            size: 30.0,
            color: Colors.green,
          ),
        ),
      ),
    );

    ToastFuture toastFuture = showToastWidget(
      widget,
      duration: Duration(seconds: 3),
      onDismiss: () {
        print("the toast dismiss"); // the method will be called on toast dismiss.
      },
    );
  }*/
  static void showErrorToast(BuildContext context, String text) async {
    FToast fToast = FToast(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: AppColors.red),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.warning_rounded, color: AppColors.white),
          SizedBox(width: 6.0),
          Expanded(child: Text(
              "$text", style: textStyleWhite16px500w, maxLines: 2, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
  }

  static void showSuccessToastB(BuildContext context, String text) async {
    FToast fToast = FToast(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.green[900]),
      child: Expanded(child: Text(
          "$text", style: textStyleWhite12px600w,
          maxLines: 2,
          overflow: TextOverflow.ellipsis)),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 4),
    );
  }
  static Future<Map<String, String>> header() async {
    return {'Authorization': await AuthUser.getInstance().token()};
  }
  }


 /* static void showErrorToastB(BuildContext context, String text) async {
    FToast fToast = FToast(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: AppColors.red.withOpacity(0.8)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.warning_rounded, color: AppColors.white),
          SizedBox(width: 6.0),
          Expanded(child: Text(
              "$text", style: textStyleWhite12px600w,
              maxLines: 2,
              overflow: TextOverflow.ellipsis)),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }*/


 /* static void showToast(BuildContext context, String text) async {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  static void showToastB(BuildContext context, String text) async {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        fontSize: 16.0);
  }*/

/*  static Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + kRecordingFileName;
  }

  static Future<bool> checkPermission() async {
    Map<PermissionGroup, PermissionStatus> map = await new PermissionHandler()
        .requestPermissions(
            [PermissionGroup.storage, PermissionGroup.microphone]);
    print(map[PermissionGroup.microphone]);
    return map[PermissionGroup.microphone] == PermissionStatus.granted;
  }

  static Future pickImage() async {
    File _imageFile;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
    }
    return _imageFile;
  }*/

 /* static void portrait() =>
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  static void statusBarAndNavigationBarColor() =>
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.white, // status bar color
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.background, // status bar icon color
      ));

  static void statusBarAndNavigationBarColorDark() =>
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.textColorBlack, // status bar color
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors
            .textColorBlack, // status bar icon color
      ));

*/


  /*static Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    print('pratik 234 ${Duration(
        hours: hours, minutes: minutes, microseconds: micros).toString()}');
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }

  static String calculateReturnDateString(String deliveryDate,
      int timePeriodDays) {
    DateTime deliveryDateTime = DateTime.parse(deliveryDate);
    DateTime returnTime = DateTime(
        deliveryDateTime.year, deliveryDateTime.month,
        deliveryDateTime.day + 7);
    return '${returnTime.day}/${returnTime.month}/${returnTime.year}';
  }

  static DateTime calculateReturnDate(String deliveryDate, int timePeriodDays) {
    DateTime deliveryDateTime = DateTime.parse(deliveryDate);
    DateTime returnTime = DateTime(
        deliveryDateTime.year, deliveryDateTime.month,
        deliveryDateTime.day + 7);
    return returnTime;
  }

  static int calculateExtendDays(String deliveryDate, int timePeriodDays) {
    DateTime deliveryDateTime = DateTime.parse(deliveryDate);
    DateTime returnDate = calculateReturnDate(deliveryDate, timePeriodDays);
    int days = deliveryDateTime
        .difference(returnDate)
        .inDays;
    return days;
  }

  static calculateTimePercentage(String endTime, String totalTime) {
    Duration end = parseDuration(endTime);
    Duration total = parseDuration(totalTime);

    int endMinutes = end.inMilliseconds;
    int totalMinutes = total.inMilliseconds;

    print('End minutes = $endMinutes && Total minutes = $totalMinutes');

    double percentageMinutes = (endMinutes / totalMinutes);
    print('Total Percentage Minutes = $percentageMinutes ');
    return percentageMinutes;
  }*/

  /*static Container separatedText(String lText, String rText,
      {required TextStyle lStyle, required TextStyle rStyle}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(lText, style: lStyle ?? textStyleSubText14px400w),
          Text(rText, style: rStyle ?? textStyleDarkRegular14px600w),
        ],
      ),
    );
  }*/



  /* static String getDateFormate(String serverdate)
  {

    final date = DateTime.parse(serverdate);
    final format = DateFormat('yyyy-MM-dd H:m:s');
    print(format.format(date));
    return format.format(date);
  }
}*/

Widget verticalSpace(double height) =>
    SizedBox(
      height: height,
    );

Widget horizontalSpace(double height) =>
    SizedBox(
      width: height,
    );