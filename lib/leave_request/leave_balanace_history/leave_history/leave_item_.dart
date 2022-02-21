import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/workFromHome/model/get_work_from_list_response.dart';

import '../../../utility/Utility.dart';
import 'model/leave_request_history_response.dart';


class LeaveItem extends StatelessWidget {
  LeaveRequestList _data;
  LeaveItem(this._data, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
     //   Navigator.pushNamed(context, Screens.WorkFromHomePageDetail,arguments: workFromHomeList);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cardBackGroundColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text('${
                        Utility.formatDate(_data?.startdate??"")} - '
                           '${
                           Utility.formatDate(_data?.endDate??"")}'
                           ,
                        style: textStyleRegular12px,
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                       Text(
                        'Work From home',
                        style: textStyleRegular12pxGrey,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  if(_data?.leaveStatus == 'Pending')
                    Text(
                      _data?.leaveStatus?? "",

                      style: textStyleOrgangeRegular12px500w,
                    ),
                  if(_data?.leaveStatus == 'Approved')
                    Text(
                      _data?.leaveStatus?? "",
                      style: textStyleGreenRegular12px500w,
                    ),
                  if(_data?.leaveStatus == 'Rejected')
                    Text(
                      _data?.leaveStatus?? "",
                      style: textStyleRedRegular12px500w,
                    ),

                  /* Text(
                   _data?.leaveStatus?? "",

                    style: textStyleGreenRegular12px500w,
                  ),*/
                  const SizedBox(
                    width: 4.0,
                  ),
                  SvgPicture.asset(
                    Images.Forward,
                    width: 10.0,
                    height: 10.0,
                  )
                ],
              )



            ],
          ),

        ),

      ),
    );
  }
}
