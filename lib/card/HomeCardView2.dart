import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
class HomeCard2 extends StatelessWidget {
  const HomeCard2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Month’s avg score',style: textStyleWhite12px400w,),
                Text('view all',style: textStyleWhite12px400w,),
              ],
            ),
        SizedBox(height: 15.0,),
        Container(
          height: 70.0,
          decoration: BoxDecoration(gradient:
           LinearGradient(
               begin: Alignment.topLeft,
               end: Alignment.bottomLeft,
               colors: [AppColors.g1, AppColors.g2]
           ),
              boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ],borderRadius: BorderRadius.circular(20.0)),
          child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Your Avg Score',style: textStyleWhite16px400wB,),
                      Row(
                        children: [
                          Text('09',style: textStyleWhite16px400wB,),
                          SizedBox(width: 5,),
                          Image.asset(Images.StarICon,height: 30,width: 30,)
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
          )
        ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Category 1',style: textStyleWhite12px400w,),
                  Text('09',style: textStyleWhite12px400w,),
                ],
              ),
            ),
            Container(height: 1.0,color: AppColors.grey,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Category 1',style: textStyleWhite12px400w,),
                  Text('09',style: textStyleWhite12px400w,),
                ],
              ),
            ),
            Container(height: 1.0,color: AppColors.grey,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Category 1',style: textStyleWhite12px400w,),
                  Text('09',style: textStyleWhite12px400w,),
                ],
              ),
            ),
            Container(height: 1.0,color: AppColors.grey,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Category 1',style: textStyleWhite12px400w,),
                  Text('09',style: textStyleWhite12px400w,),
                ],
              ),
            ),
            Container(height: 1.0,color: AppColors.grey,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Category 1',style: textStyleWhite12px400w,),
                  Text('09',style: textStyleWhite12px400w,),
                ],
              ),
            ),
            Container(height: 1.0,color: AppColors.grey,),
          ],
        ),
      ),

    );
  }
}
