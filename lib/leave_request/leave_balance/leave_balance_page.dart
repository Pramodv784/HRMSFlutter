import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/leave_request/model/data_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/utility/Header.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class LeaveBalancePage extends StatefulWidget {
  const LeaveBalancePage({Key key}) : super(key: key);

  @override
  _LeaveBalancePage createState() => _LeaveBalancePage();
}

class _LeaveBalancePage extends State<LeaveBalancePage>
   {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(

      child: Column(
      children: [
      Header(headerText: 'Leave  Dashboard',),
    Expanded(child:
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Row(
           children: [
             Column(
               children: [
                 Text('Paid Leave',style: TextStyle(
                   fontSize: 20.0,fontWeight: FontWeight.bold
                 ),),
                 Container(
                   color: AppColors.dropbg,
                   height: 50,
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
             CircularPercentIndicator(
               radius: 100.0,
               lineWidth: 10.0,
               percent: 0.5,

               center: new Text("100%"),
               progressColor: Colors.green,
             )
           ],

         ),
       ),
      ),
    ),
    )
    ]),
    ));

  }
}
