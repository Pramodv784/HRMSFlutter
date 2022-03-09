import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/api_provider/endpoints.dart';
import 'package:hrms/home_screen/model/home_data.dart';
import 'package:hrms/home_screen/model/home_data_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/utility/Utility.dart';

import '../model/today_leave_response.dart';

class CardLeaveToday extends StatelessWidget {
  EmpList _data;
  Color color;


  CardLeaveToday(this._data,this.color, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tag=_data.fullName.substring(0,1);
    String d=_data.fullName.split(" ").last.substring(0,1);
    
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: color,
            ),
            child: Stack(children: [
              Align(
                alignment: Alignment.center,
                child: Text('${tag+d}'.toUpperCase(),
                    style: TextStyle(color: AppColors.white)),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 10.0,
                  width: 10.0,
                  margin: EdgeInsets.only(bottom: 3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: AppColors.red,
                    border: Border.all(width: 0.8,color: AppColors.white)
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            '${_data.fullName}',
            style: textStyleBlackRegular12pxW700,
          ),
        ],
      ),
    );
  }
}
