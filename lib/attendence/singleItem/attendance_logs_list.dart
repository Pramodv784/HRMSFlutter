import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';

class AttendanceLogsList extends StatelessWidget {
  const AttendanceLogsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: const BoxDecoration(color: AppColors.backGroundColor),*/

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
                    const Text(
                      'Fri, 14 Jan',
                      style: textStyleRegular12px,
                    ),
                   Row(
                     children: [
                       const Text(
                         '9h 23m',
                         style: textStyleRegular12px,
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
            ),
            const SizedBox(
              height: 10.0,
            ),

            Container(
              decoration: const BoxDecoration(color: AppColors.backGroundColor),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Fri, 14 Jan',
                      style: textStyleRegular12px,
                    ),
                    Row(
                      children: [
                        const Text(
                          '9h 23m',
                          style: textStyleRegular12px,
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
            ),
            const SizedBox(
              height: 10.0,
            ),

            Container(
              decoration: const BoxDecoration(color: AppColors.backGroundColor),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Fri, 14 Jan',
                      style: textStyleRegular12px,
                    ),
                    Row(
                      children: [
                        const Text(
                          '9h 23m',
                          style: textStyleRegular12px,
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
            ),
            const SizedBox(
              height: 10.0,
            ),

            Container(
              decoration: const BoxDecoration(color: AppColors.backGroundColor),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Fri, 14 Jan',
                      style: textStyleRegular12px,
                    ),
                    Row(
                      children: [
                        const Text(
                          '9h 23m',
                          style: textStyleRegular12px,
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
            ),
            const SizedBox(
              height: 10.0,
            ),

            Container(
              decoration: const BoxDecoration(color: AppColors.backGroundColor),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Fri, 14 Jan',
                      style: textStyleRegular12px,
                    ),
                    Row(
                      children: [
                        const Text(
                          '9h 23m',
                          style: textStyleRegular12px,
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
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
