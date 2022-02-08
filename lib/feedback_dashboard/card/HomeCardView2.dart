import 'package:flutter/material.dart';
import 'package:hrms/home_screen/model/home_avg_score_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';

import '../model/feed_total_avg_response.dart';
class HomeCard2 extends StatelessWidget {
  MyCategoryScore _data;
   HomeCard2(this._data,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${_data?.categoryName?? ""}',style: textStyleWhite12px400w,),
                      Text('${_data?.avg?? 0}',style: textStyleWhite12px400w,),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Container(height: 1,color: AppColors.grey,)
                ],
              ),
    );
  }
}
