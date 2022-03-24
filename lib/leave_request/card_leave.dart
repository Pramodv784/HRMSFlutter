import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/leave_request/model/data_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';

class CardLeave extends StatelessWidget {
  TimeModel _data;

  CardLeave(this._data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color(0xFFEEF4FB),
            border: Border.all(color: AppColors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(_data.icon),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    _data.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _data.subtitle,
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        switch (_data.title) {
          case 'Apply Leave':
            Navigator.pushNamed(context, Screens.AddLeaveRequest);
            break;
          case 'Add Expenses':
            Navigator.pushNamed(context, Screens.AddExpense);
            break;
          case 'Attendance History':
            Navigator.pushNamed(context, Screens.AttendencePage);
            break;
          case 'Leave Balance':
            Navigator.pushNamed(context, Screens.LeaveBalancePage);
            break;
          case 'Raise Ticket':
            Navigator.pushNamed(context, Screens.RaiseTicket,arguments: null);
            break;
          case 'My Tickets':
            Navigator.pushNamed(context, Screens.TicketDashBoard);
            break;
          case 'History':
            Navigator.pushNamed(context, Screens.ExpenseHistory);
            break;
          case 'Work From Home':
            Navigator.pushNamed(context, Screens.WorkFromHomePage);
            break;



        }
      },
    );
  }
}
