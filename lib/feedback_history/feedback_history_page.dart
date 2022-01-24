import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/feedback_history/card_feed_history.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/Utility.dart';

import 'model/feedback_history_model.dart';
class FeedbackHistory extends StatefulWidget {
  const FeedbackHistory({Key key}) : super(key: key);

  @override
  _FeedbackHistoryState createState() => _FeedbackHistoryState();
}

class _FeedbackHistoryState extends State<FeedbackHistory> {
  bool checkList=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(

      child: Column(
      children: [
      Header(headerText: ' Feedback History',),

    Expanded(child:
    Padding(
    padding: const EdgeInsets.all(10.0),
    child: SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          children: [
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(gradient:
              LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [AppColors.black, AppColors.black]
              ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(0.0, 1.5),
                      blurRadius: 1.5,
                    ),
                  ],borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Avg Score',style: textStyleWhite20px400wB,),
                  Row(
                    children: [
                      Text('41',style: textStyleWhite20px400wB,),
                      SizedBox(width: 5.0,),
                      Image.asset(Images.StarICon,width: 32.0,height: 30.0,),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: feedHistory.length,
                itemBuilder: (context, i) {
                  return  Column(
                    children: [
                      Divider(
                        height: 17.0,
                        color: Colors.white,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),

                        child: ExpansionTile(
                         onExpansionChanged: (data){
                           setState(() {
                           });
                         },
                         // title:CardFeedHistoy(feedHistory[i]),
                          title: Text('Title',style: TextStyle(color: AppColors.white),),
                          children: <Widget>[

                             Column(
                              children: _buildExpandableContent(feedHistory[i]),
                            ),
                          ],
                         backgroundColor: AppColors.red,
                          collapsedBackgroundColor: AppColors.red,
                          iconColor: AppColors.white,
                          collapsedIconColor: AppColors.white,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),

    )
    )
    ])
    )
    );

  }
  _buildExpandableContent(FeedbackHistoryModel vehicle) {
    List<Widget> columnContent = [];
    int ques=1;
    for (SubItem content in vehicle.contents)
      columnContent.add(
        Container(
          color: AppColors.white,
          child: new ListTile(
            title:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                    Text('Q ${ques++} . ${content.feed}', style: new TextStyle(fontSize: 15.0),),


                SizedBox(height: 5.0,),
                Row(
                  children: [
                    SizedBox(width: 30.0,),
                    Text(content.score.toString(), style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                    SizedBox(width: 5.0,),
                    Image.asset(Images.StarICon)
                  ],
                ),

              ],
            ),
          //  leading: new Icon(vehicle.icon),
          ),
        ),
      );

    return columnContent;
  }

}
