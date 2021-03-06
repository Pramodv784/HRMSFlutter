import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';

import 'model/GetMyTeamResposne.dart';

class CardWorkingRemotely extends StatelessWidget {
  OnLeave _data;
  CardWorkingRemotely(this._data,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.blueCard,
            ),
            child: Stack(children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'LV'.toUpperCase(),
                  style:
                      const TextStyle(color: AppColors.white, fontSize: 20.0),
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 5.0,
          ),
           Text(
            '${_data.employeeName.replaceAll(' ', '\n')}',
            style: textStyleDarkRegular14px700w,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
