import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:table_calendar/table_calendar.dart';
class AddLeaveRequest2 extends StatefulWidget {
  const AddLeaveRequest2({Key key}) : super(key: key);

  @override
  _AddLeaveRequest2State createState() => _AddLeaveRequest2State();
}

class _AddLeaveRequest2State extends State<AddLeaveRequest2> {
  CalendarController _controller;

  int _value;

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
              ),
             SizedBox(height: 20.0,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Flexible(
                    child: Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      alignment: Alignment.center,
                      color: Color(0xFFFDC76F),
                      child: Text('Holiday'),),
                  ),
                  SizedBox(width: 10.0,),
                  Flexible(
                    child: Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      alignment: Alignment.center,
                      color: Color(0xFF89AEC7),
                      child: Text('Week off'),),
                  ),
                    SizedBox(width: 10.0,),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      alignment: Alignment.center,
                      height: 50.0,
                      color: Color(0xFFE86D72),
                      child: Text('Leave'),),
                  ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Flexible(
                        child: Container(
                          height: 50.0,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          alignment: Alignment.center,
                          color: _value==1?AppColors.dropbg:AppColors.colorPrimary,
                          child: Text('First Half'),),
                      ),
                      onTap: (){
                        _value=1;
                        setState(() {

                        });
                      },
                    ),

                    InkWell(
                      child: Flexible(
                        child: Container(
                          height: 50.0,
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          alignment: Alignment.center,
                          color: _value==0?AppColors.colorPrimary:AppColors.dropbg,
                          child: Text('Second Half'),),
                      ),
                      onTap: (){
                        _value=0;
                        setState(() {

                        });
                      },
                    ),
                  ],
                ),
              ),
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
