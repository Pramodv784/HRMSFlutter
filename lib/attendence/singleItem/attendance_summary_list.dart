import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:intl/intl.dart';

class SummaryList extends StatefulWidget {
  const SummaryList({Key key}) : super(key: key);

  @override
  _SummaryListState createState() => _SummaryListState();
}

class _SummaryListState extends State<SummaryList> {
  String day = DateFormat('E').format(DateTime.now());
  String week = DateFormat('MMMMEEEEd').format(DateTime.now());
  String date = DateFormat('d').format(DateTime.now());
  String month = DateFormat('MMM').format(DateTime.now());
  String year = DateFormat('y').format(DateTime.now());
  List<Widget> widgetList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('date **${day} date $date  month $month year $year');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(color: AppColors.backGroundColor),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Today',
                  style: textStyleWhite12px400w,
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  '${date}  ${month}, ${year}',
                  style: textStyleDarkHeavy24px,
                ),
                const SizedBox(
                  height: 6.0,
                ),
                const Text(
                  'Shift Timings: 9:30 am - 7:00 pm ',
                  style: textStyleLightRegular12pxNew,
                ),
                SizedBox(
                  height: 20.0,
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Flexible(
              child: Container(
                decoration:
                    const BoxDecoration(color: AppColors.backGroundColor),
                width: Utility.screenWidth(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Avg Work hours/day ',
                        style: textStyleLightRegular12pxNew,
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        '0h 00m',
                        style: textStyleRegular18px,
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Flexible(
              child: Container(
                decoration:
                    const BoxDecoration(color: AppColors.backGroundColor),
                width: Utility.screenWidth(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'On Time Arrival ',
                        style: textStyleRegular12px,
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        '0.0%',
                        style: textStyleRegular18px,
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text(
          'Week offs- This Week',
          style: textStyleDark14px500wH08,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.cardBackGroundColor),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                        color: day == 'Sun'
                            ? Color(0xFFFDC76F)
                            : AppColors.backGroundColor,
                        width: Utility.screenWidth(context),
                        height: 50,
                        child: Center(child: Text("SU"))),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                    child: Container(
                        color: day == 'Mon'
                            ? Color(0xFFFDC76F)
                            : AppColors.backGroundColor,
                        width: Utility.screenWidth(context),
                        height: 50,
                        child: Center(child: Text("MO"))),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                    child: Container(
                        color: day == 'Tue'
                            ? Color(0xFFFDC76F)
                            : AppColors.backGroundColor,
                        width: Utility.screenWidth(context),
                        height: 50,
                        child: Center(child: Text("TU"))),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                    child: Container(
                        color: day == 'Wed'
                            ? Color(0xFFFDC76F)
                            : AppColors.backGroundColor,
                        width: Utility.screenWidth(context),
                        height: 50,
                        child: Center(child: Text("WE"))),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                    child: Container(
                        color: day == 'Thu'
                            ? Color(0xFFFDC76F)
                            : AppColors.backGroundColor,
                        width: Utility.screenWidth(context),
                        height: 50,
                        child: Center(child: Text("TH"))),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                    child: Container(
                        color: day == 'Fri'
                            ? Color(0xFFFDC76F)
                            : AppColors.backGroundColor,
                        width: Utility.screenWidth(context),
                        height: 50,
                        child: Center(child: Text("FR"))),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                    child: Container(
                        color: day == 'Sat'
                            ? Color(0xFFFDC76F)
                            : AppColors.backGroundColor,
                        width: Utility.screenWidth(context),
                        height: 50,
                        child: Center(child: Text("SA"))),
                  ),
                ],
              )),
          /* child:  ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...daysList
            ],
          ),*/
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          'Shift Timings: 9:30 am - 7:00 pm ',
          style: textStyleLightRegular12pxNew,
        )
      ],
    );
  }
}
