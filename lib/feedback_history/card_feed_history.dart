import 'package:flutter/material.dart';
import 'package:hrms/feedback/empfeedback/model/feed_question_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';

import 'model/feedback_history_model.dart';
class CardFeedHistoy extends StatelessWidget {
  DataCategory _data;
   CardFeedHistoy(this._data,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${_data.categoryName}',style: textStyleWhite14px500w,),
            Row(
              children: [
                Text('${_data.categoryId}',style: textStyleWhite14px500w,),
                SizedBox(width: 5.0,),
                Image.asset(Images.StarICon),
              ],
            )
          ],
        ),
      ),
    );
  }
}
