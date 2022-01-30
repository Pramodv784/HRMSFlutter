import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Header.dart';
import 'package:table_calendar/table_calendar.dart';
class AddLeaveRequest2 extends StatefulWidget {
  const AddLeaveRequest2({Key key}) : super(key: key);

  @override
  _AddLeaveRequest2State createState() => _AddLeaveRequest2State();
}

class _AddLeaveRequest2State extends State<AddLeaveRequest2> {
  CalendarController _controller;

  @override
  void initState() {
    _controller = CalendarController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(

      child: Column(
      children: [
      Expanded(
      child: ListView(
    children: [
    Header(headerText: 'Add Leave Request',),
      SizedBox(height: 20.0,),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              TableCalendar(

                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                    todayColor: Colors.blue,
                    selectedColor: Theme.of(context).primaryColor,
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.white),

                ),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.white),
                  formatButtonShowsNext: false,
                ),


                startingDayOfWeek: StartingDayOfWeek.sunday,
               /* onDaySelected: (date, events) {
                  print(date.toUtc());
                },*/
                builders: CalendarBuilders(


                  selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                  todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xFFFDC76F),
                          borderRadius: BorderRadius.circular(50.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                ),

                calendarController: _controller,
              )
            ],
          ),
        ),
      )

    ]),
    ),
    ]),
    ),
    );

  }
}
