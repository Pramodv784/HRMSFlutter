import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';

class AttendanceRequestList extends StatelessWidget {
  const AttendanceRequestList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardBackGroundColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Wed, 12 Jan - Wed, 21 Jan',
                      style: textStyleRegular12px,
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    const Text(
                      'Work From home',
                      style: textStyleRegular12pxGrey,
                    ),

                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Approved',
                  style: textStyleGreenRegular12px500w,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                SvgPicture.asset(
                  Images.Forward,
                  width: 10.0,
                  height: 10.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
