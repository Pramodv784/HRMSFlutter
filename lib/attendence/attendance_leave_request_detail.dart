import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/Utility.dart';

class AttendanceLeaveRequestDetail extends StatefulWidget {
  const AttendanceLeaveRequestDetail({Key key}) : super(key: key);

  @override
  _AttendanceLeaveRequestDetailState createState() =>
      _AttendanceLeaveRequestDetailState();
}

class _AttendanceLeaveRequestDetailState
    extends State<AttendanceLeaveRequestDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Header(
              headerText: 'Attendance',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          color: AppColors.backGroundColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.white,
                                  child: ClipOval(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        Images.UserDemo,
                                        fit: BoxFit.cover,
                                        width: 60,
                                        height: 60,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Lovely Sharma',
                                      /*style: textStyleLightRegular12pxNew,*/
                                      style: textStyleRegular12px,
                                    ),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      'Jan 11, 2022, 5:30 pm',
                                      style: textStyleRegular12px,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          color: AppColors.backGroundColor,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      'Lovely Sharma',
                                      /*style: textStyleLightRegular12pxNew,*/
                                      style: textStyleRegular12px,
                                    ),
                                    Text(
                                      ':',
                                      /*style: textStyleLightRegular12pxNew,*/
                                      style: textStyleRegular12px,
                                    ),
                                    SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      'Approved',
                                      style: textStyleGreenRegular12px500w,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: AppColors.white),
                                        width: Utility.screenWidth(context),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Avg Work hours/day ',
                                                style:
                                                    textStyleLightRegular12pxNew,
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
                                        decoration: const BoxDecoration(
                                            color: AppColors.white),
                                        width: Utility.screenWidth(context),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                  '10 day(s) of Work From Home',
                                  style: textStyleRegular12px,
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                const Text(
                                  'Work From Home Already Started',
                                  style: textStyleRegular12pxGrey,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Text(
                                  'Reason',
                                  style: textStyleRegular12px,
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                const Text(
                                  'Descripted reason will be shown here',
                                  style: textStyleRegular12pxGrey,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
