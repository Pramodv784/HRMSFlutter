import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/utility/Utility.dart';

class SummaryList extends StatelessWidget {
  const SummaryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const Text(
                  '13 Jan, 2022',
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
                decoration: const BoxDecoration(color: AppColors.backGroundColor),
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
                decoration: const BoxDecoration(color: AppColors.backGroundColor),
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
            child: Wrap(
              spacing:8.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.start,
              children: [
                Container(
                    color: AppColors.backGroundColor,
                    width: 50,
                    height: 50,
                    child:Center(child: Text("W1"))
                ),
                Container(
                    color: AppColors.backGroundColor,
                    width: 50,
                    height: 50,
                    child:Center(child: Text("W1"))
                ),
                Container(
                    color: AppColors.backGroundColor,
                    width: 50,
                    height: 50,
                    child:Center(child: Text("W1"))
                ),
                Container(
                    color: AppColors.backGroundColor,
                    width: 50,
                    height: 50,
                    child:Center(child: Text("W1"))
                ),
                Container(
                    color: AppColors.backGroundColor,
                    width: 50,
                    height: 50,
                    child:Center(child: Text("W1"))
                ),
                Container(
                    color: AppColors.backGroundColor,
                    width: 50,
                    height: 50,
                    child:Center(child: Text("W1"))
                ),
                Container(
                    color: AppColors.backGroundColor,
                    width: 50,
                    height: 50,
                    child:Center(child: Text("W1"))
                ),
              ],
            ),
          ),
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
