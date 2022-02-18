import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/leave_request/model/data_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';

import '../ticket/model/my_ticket_response.dart';

class TicketListItem extends StatelessWidget {

  MyTicketResponse _data;
  TicketListItem(this._data,{Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFEEF4FB)),
      margin: EdgeInsets.only(bottom: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_data.caseTitle}',
              style: textStyleWhite12px400w,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              '${_data.comment}',
              style: textStyleSubText14px600w,
            ),
            SizedBox(
              height: 8.0,
            ),
            Card(
              color: AppColors.cardBackGroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      Text('${_data.caseType}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: AppColors.borderColor))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.white,
                  child: SvgPicture.asset(Images.UserDemo,height: 60.0,width: 60.0,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Assigned To',
                      style: textStyleWhite12px400w,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '${_data.assignedTo}',
                      style: textStyleSubText14px600w,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
