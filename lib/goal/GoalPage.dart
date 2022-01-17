import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/InputField.dart';

import 'card_goal.dart';
class GoalPage extends StatefulWidget {
  const GoalPage({Key key}) : super(key: key);

  @override
  _GoalPageState createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.background,
        body: SafeArea(

          child: Column(
            children: [
            Header(headerText: 'Goal',),
          Expanded(child:
          ListView(children: [
            SizedBox(height: 10.0,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: InputField(
                  placeHolderText: 'Search',
                  errorMessage: 'Please enter first name',
                  inputType: InputType.ONLY_WORDS,
                  rightIcon: Images.SearchIcon,

                  onTextChange: (String val) =>  {}
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.all(5.0),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('My Goals  20',style: TextStyle(fontSize: 18.0,color: Colors.red,fontWeight: FontWeight.bold),),
                            Image.asset(Images.FilterIcon)
                          ],
                        )
                      ),
                    Container(
                      height:30,
                      alignment: Alignment.center,
                      color: AppColors.grey,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Goal name'),
                          Text('Assigned by'),
                          Text('Goal Type '),
                          Text('Action '),
                        ],
                      ),
                    ),
                    CardGoal(),
                    CardGoal(),
                    CardGoal(),
                    CardGoal(),
                    CardGoal(),
                  ],
                ),
              ),
            )

          ],)
            ,)
          ,]),
    ),
    );







      }
}
