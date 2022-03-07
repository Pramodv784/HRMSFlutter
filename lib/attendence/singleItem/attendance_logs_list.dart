import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms/attendence/model/attendence_log_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';

class AttendanceLogsList extends StatelessWidget {
  Data _data;
   AttendanceLogsList(this._data,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cardBackGroundColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'This Week',
                style: textStyleDarkRegular14px700w,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                decoration: const BoxDecoration(color: AppColors.backGroundColor),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Column(
                         children: [
                           Text(
                            '${_data.dateString}',
                            style: textStyleRegular12px,
                      ),
                           SizedBox(height: 10.0,),
                           Text(
                             'Total Time ${_data.totalTime}',
                             style: textStyleRegular12px,
                           ),

                         ],
                       ),
                     Column(
                       children: [
                         Text(
                          'Clock In - ${_data.clockInTime}',
                          style: textStyleRegular12px,
                             ),
                         SizedBox(height: 10.0,),
                         Text(
                           'Clock Out - ${_data.clockOutTime}',
                           style: textStyleRegular12px,
                         ),
                       ],
                     )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
