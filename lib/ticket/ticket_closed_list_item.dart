import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/ticket/model/TicketResponse.dart';
import 'package:hrms/ticket/ticket_presenter.dart';
import 'package:hrms/utility/Utility.dart';

import 'model/GetMyCaseResponse.dart';

class TicketCloseedListItem extends StatefulWidget {
  CloseTicket _data;
  TicketPresenter _presenter;

  TicketCloseedListItem(this._data, this._presenter, {Key key})
      : super(key: key);

  @override
  State<TicketCloseedListItem> createState() => _TicketCloseedListItemState();
}

class _TicketCloseedListItemState extends State<TicketCloseedListItem> {
  Statuses itemselected;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget._data.title}',
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
                          items:widget._data.statuses
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
                            child: Text('${widget._data.caseStatus}'),
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
              'Ticket created on ${Utility.getDateFormate(widget?._data?.createdOn ?? '')}',
              style: textStyleSubText12px600w,
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
                          Text('${widget._data.categoryName}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: AppColors.borderColor))
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: Icon(Icons.edit),
                  onTap: () {
                    Navigator.pushNamed(context, Screens.RaiseTicket,
                        arguments: widget._data);
                  },
                )
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
                      'Assigned To',
                      style: textStyleWhite12px400w,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Ticket Closed On ${Utility.formatDate(widget?._data?.closedOn ?? '')}',
                      style: textStyleSubText12px600w,
                    maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
