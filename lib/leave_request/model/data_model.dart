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
];
List<TimeModel> helpList=[
  TimeModel('Raise Ticket', Images.RaiseTicktIcon, 'You can raise a ticket from here'),
  TimeModel('My Tickets', Images.MyTicketIcon, 'List of tickets you have raised'),
  TimeModel('Following', Images.FlloIcon, 'List of tickets you are following'),
  TimeModel('Following', Images.FlloIcon, 'List of tickets you are following'),
  TimeModel('Following', Images.FlloIcon, 'List of tickets you are following'),
  TimeModel('Following', Images.FlloIcon, 'List of tickets you are following'),
  TimeModel('Following', Images.FlloIcon, 'List of tickets you are following'),
  TimeModel('Following', Images.FlloIcon, 'List of tickets you are following'),
  TimeModel('Following', Images.FlloIcon, 'List of tickets you are following'),
  TimeModel('Following', Images.FlloIcon, 'List of tickets you are following'),

];