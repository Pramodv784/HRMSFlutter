import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:intl/intl.dart';

class CardFeed extends StatefulWidget {
  const CardFeed({Key key}) : super(key: key);

  @override
  _CardFeedState createState() => _CardFeedState();
}

class _CardFeedState extends State<CardFeed> {
  bool check=false;
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [

          Container(
              padding: EdgeInsets.all(8.0),
              color: AppColors.white,
              child: Column(
                children: [
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Q1. ',
                      style: textStyleDark16px600w,
                      children: [
                        TextSpan(
                          text: 'How much points you will give him for code quality?'
                          ,style: textStylePrimary16px600w,
                         ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                    child: Container(
                      width: Utility.screenWidth(context),
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 10,
                        itemSize: 40,
                        maxRating: 10,
                        glow: true,

                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: AppColors.ratingColor,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCheckBox(
                        value: check,
                        shouldShowBorder: true,
                        borderColor: AppColors.borderColor,
                        checkedFillColor: AppColors.borderColor,
                        borderRadius: 8,
                        borderWidth: 1,
                        checkBoxSize: 22,
                        onChanged: (val) {
                           setState(() {
                          check = val;
                           });
                        },
                      ),
                     Text('Did not witness this Human Skill',style: textStyleSubText14px400w,),
                    ],
                  ),

                Container(
                  height: 1,
                  color: AppColors.grey,
                  margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                )
                ],
              ))
        ],
      ),
    );
  }
}

