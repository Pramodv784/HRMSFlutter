import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/AppColors.dart';
import '../../../res/Fonts.dart';
import '../../../res/Images.dart';
import '../../../res/Screens.dart';
import 'model/RecievedTicketResponse.dart';

class ReceivedItem extends StatelessWidget {
  OpenTicket _data;
   ReceivedItem(this._data,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Screens.ReceivedTicketDetail,arguments:_data);
      },
      child: Container(
        decoration: BoxDecoration(color: Color(0xFFEEF4FB)),
        margin: EdgeInsets.only(bottom: 5.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_data.title}',
                    style: textStyleWhite12px400w,
                  ),
                  /* Flexible(
                    child: Container(
                      width: 150.0,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColors.white
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<Statuses>(
                            isExpanded: true,
                            value: itemselected,
                            borderRadius: BorderRadius.circular(20.0),
                            icon: new Image.asset(Images.DropIcon),
                            items:_data.statuses
                                .map(
                                    (Statuses label) => DropdownMenuItem(
                                  child: Text(label.statusVal),
                                  value: label,
                                ))
                                .toList(),
                            onChanged: (Statuses data) => setState(() {
                             // currentItem = selectedItem;
                              //widget.itemCallBack(currentItem);
                              itemselected=data;
                            }),

                            hint: Container(
                              child: Text('${_data.caseStatus}'),
                            ),
                          ),
                    ),
                  ),
                  )*/
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '${_data.ticketStatus}',
                style: textStyleSubText14px600w,
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    color: AppColors.cardBackGroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: [
                            Text('${_data.categoryName}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                    color: AppColors.borderColor))
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.white,
                    child: SvgPicture.asset(
                      Images.UserDemo,
                      height: 60.0,
                      width: 60.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ticket from',
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
      ),
    );
  }
}
