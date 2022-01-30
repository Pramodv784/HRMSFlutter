import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class LeaveBalancePage extends StatefulWidget {
  const LeaveBalancePage({Key key}) : super(key: key);

  @override
  _LeaveBalancePage createState() => _LeaveBalancePage();
}

class _LeaveBalancePage extends State<LeaveBalancePage>
   {
  bool _selected=false;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(

      child: ListView(
      children: [
      Header(headerText: 'Leave  Dashboard',),
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
       child: Padding(
         padding: const EdgeInsets.all(15.0),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Flexible(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Paid Leave',style: TextStyle(
                     fontSize: 20.0,fontWeight: FontWeight.bold
                   ),),
                   SizedBox(height: 20.0,),
                   Container(
                     color: AppColors.dropbg,
                     height: 50,
                     width: Utility.screenWidth(context),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Text('Consumed',style: TextStyle(
                             fontSize: 20.0
                         ),),
                         Text('40',style: TextStyle(
                             fontSize: 20.0,fontWeight: FontWeight.bold
                         ),),
                       ],
                     ),
                   ),
                   SizedBox(height: 10.0,),
                   Container(
                     color: AppColors.dropbg,
                     height: 50,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Text('Annual Quota',style: TextStyle(
                             fontSize: 20.0
                         ),),
                         Text('100',style: TextStyle(
                             fontSize: 20.0,fontWeight: FontWeight.bold
                         ),),
                       ],
                     ),
                   )
                 ],
               ),
             ),

             SizedBox(width: 20.0,),
             Flexible(
               child: Container(
                 margin: EdgeInsets.only(top: 20.0),
                 child: CircularPercentIndicator(
                   radius: 70.0,
                   lineWidth: 40.0,
                   percent: 0.4,
                   center: new Text("40%",style: TextStyle(fontSize: 20.0),),
                   progressColor: Colors.blue,
                   backgroundColor: AppColors.grey,
                   animateFromLastPercent: true,
                   circularStrokeCap: CircularStrokeCap.butt,
                 ),
               ),
             )
           ],

         ),
       ),
      ),
    ),

        InputChip(
          selected: _selected,
          label: Text('Flutter'),
          tooltip: 'This is Flutter',
          onPressed: () {
            print('Fluter is pressed');

            setState(() {
              _selected = !_selected;
            });
          },
          onDeleted: () {
            print('Flutter is deleted');

          },
        )
    ]),
    ));

  }
}
