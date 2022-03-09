import 'package:flutter/material.dart';
import 'package:hrms/home_screen/model/w_f_h_list_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';

class CardWFHList extends StatelessWidget {
  WorkFromHomeList _data;
  Color color;


  CardWFHList(this._data,this.color, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(_data.appliedBy!=null && _data.appliedBy!="")
      {
        String tag = _data.appliedBy.substring(0, 1);
        String d = _data.appliedBy.split(" ").last.substring(0, 1);
      }


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
                child: Text(_data.appliedBy!=null&& _data.appliedBy!=''?
                '${_data.appliedBy.substring(0, 1) + _data.appliedBy.split(" ").last.substring(0, 1)}'.toUpperCase():'',
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
                      border: Border.all(width: 0.8, color: AppColors.white)),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            '${_data.appliedBy}',
            style: textStyleBlackRegular12pxW700,
          ),
        ],
      ),
    );
  }
}
