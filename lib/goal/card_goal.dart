import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Images.dart';
class CardGoal extends StatelessWidget {
  const CardGoal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Employee name'),
                Text('Emp name'),
                Text('Emp name'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Image.asset(Images.UploadIcon),color: AppColors.blue,),
                      SizedBox(width: 10.0,),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Image.asset(Images.RightIcon,),color: AppColors.green,),
                  ],

                )

              ],
            ),
            Container(height: 1.0,color: AppColors.grey,
            margin: EdgeInsets.symmetric(horizontal: 0.0,vertical: 10.0),)
          ],
        ),
      ),
    );
  }
}
