import 'package:flutter/material.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
class HomeCard extends StatelessWidget {
  const HomeCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your Achievements',style: textStyleWhite12px400w,),
                Text('view all',style: textStyleWhite12px400w,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset(Images.AchievIcon,),
                    Text('10X',style: textStyleWhite12px400w,),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(Images.AchievIcon,),
                    Text('10X',style: textStyleWhite12px400w,),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(Images.AchievIcon,),
                    Text('10X',style: textStyleWhite12px400w,),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
