import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Utility.dart';
class CardHoliday extends StatelessWidget {
   CardHoliday({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.colorPrimary,width: 0.5)
            ),
            child: Column(
              children: [
                Text('AUG',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w800),),
                Text('23',style: TextStyle(fontSize: 20.0),),

              ],
            ),
          ),
          Text('Pramod')

        ],
        ),
      ),
    );
  }
}
