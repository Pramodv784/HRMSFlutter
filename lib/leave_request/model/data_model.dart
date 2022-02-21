import 'package:hrms/res/Images.dart';

class TimeModel{
   final String title;
   final String icon;
   final String subtitle;

   TimeModel(this.title, this.icon, this.subtitle);
}
List<TimeModel> timeList=[
  TimeModel('Apply Leave', Images.LeaveIcon, 'You can apply leave from here'),
  TimeModel('Leave Balance', Images.LeaveBalanceIcon, 'View leave balance from here.'),
  TimeModel('Attendance History', Images.AttendenceIcon, 'view attendence history form here.'),
  TimeModel('Work From Home', Images.WfhIcon, 'You can apply work form home from here'),
  TimeModel('Leave History', Images.WfhIcon, 'View leave history from here.'),
];
List<TimeModel> helpList=[
  TimeModel('Raise Ticket', Images.RaiseTicktIcon, 'You can raise a ticket from here'),
  TimeModel('My Tickets', Images.MyTicketIcon, 'List of tickets you have raised'),
];
List<TimeModel> expenseList=[
  TimeModel('Add Expenses', Images.ExpenseIcon, 'Save and Claim your expenses here.'),
  TimeModel('History', Images.AttendenceIcon, 'view your past expenses and advance here'),
];