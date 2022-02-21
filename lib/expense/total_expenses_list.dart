import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/leave_request/model/data_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/Utility.dart';

import '../ticket/model/my_ticket_response.dart';
import 'model/expense_history_response.dart';

class TotalExpensesList extends StatelessWidget {

  ExpenseList _data;
  TotalExpensesList(this._data,{Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.backGroundColor),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_data.expenseTitle}',
              style: textStyleWhite12px400w,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Ticket created on ${Utility.formatDate(_data?.createdOn??"")}',
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
                      Text('Expenses Category',
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
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: SvgPicture.asset(Images.UserDemo,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_data?.projectName??""}',
                      style: textStyleWhite12px400w,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Assigned on ${(_data?.expenseDate??"")}',
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
