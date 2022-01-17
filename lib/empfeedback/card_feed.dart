import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
class CardFeed extends StatelessWidget {
  const CardFeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        child: Column(
          children: [
            Container(
              height: 30.0,
              alignment: Alignment.center,
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
                  ],borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0))),
              child: Text('Development',style: textStyleWhite16px400wB,),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              color: AppColors.white,
                child: Column(
                  children: [
                    Text(' Q1. How much points you will give him for code quality?',style: textStyleWhite12px400w),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
