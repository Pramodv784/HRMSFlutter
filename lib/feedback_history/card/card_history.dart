import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/utility/Utility.dart';

import '../model/feed_history_response.dart';

class CardHistory extends StatelessWidget {
  FeedbackDatas _data;

  CardHistory(this._data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 40,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                    child: Container(
                        alignment: Alignment.center,
                        width: Utility.screenWidth(context),
                        child: Text(_data.receiverEmployeeName!=null?
                        '${_data.receiverEmployeeName}':'NA',
                            maxLines: 2, overflow: TextOverflow.ellipsis))),
                SizedBox(
                  width: 5.0,
                ),
                Flexible(
                    child: Container(
                      alignment: Alignment.center,
                        width: Utility.screenWidth(context),
                        child: Text(_data.teamLeadName!=null?'${_data.teamLeadName}':'NA',
                            maxLines: 1, overflow: TextOverflow.ellipsis))),
                SizedBox(
                  width: 5.0,
                ),
                Flexible(
                    child: Container(
                        alignment: Alignment.center,
                        width: Utility.screenWidth(context),
                        child: Text(_data.categoryType!=null?'${_data.categoryType}':'NA',
                            maxLines: 1, overflow: TextOverflow.ellipsis))),
                SizedBox(
                  width: 5.0,
                ),
                InkWell(
                  child: Container(
                      height: 30,
                      padding: EdgeInsets.all(10.0),
                      color: Color(0xFF14CD93),
                      child: SvgPicture.asset(
                        Images.IconEye,
                        height: 25,
                        width: 25,
                      )),
                  onTap: () {
                    Navigator.pushNamed(context, Screens.FeedbcakHistory,
                        arguments: [_data.feedbackId]);
                  },
                ),
              ],
            ),
          )),
    );
  }
}
