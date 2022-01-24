import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
class FeedbackRemark extends StatefulWidget {
  const FeedbackRemark({Key key}) : super(key: key);

  @override
  _FeedbackRemarkState createState() => _FeedbackRemarkState();
}

class _FeedbackRemarkState extends State<FeedbackRemark> {
  var text=0;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(

      child: Column(
      children: [
      Header(headerText: 'Employee Feedback',),
    Expanded(child:
    ListView(children: [
    Card(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0)),
        margin:
        EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Your  Feedback  ',
                              style: textStyleWhite12px400w,
                            ),
                            TextSpan(
                              text: '*',
                              style: TextStyle(color: AppColors.red, fontSize: 16.0),
                            ),
                          ])),
                      Text('${text}/200 words',
                        style: textStyleWhite12px400w,
                      ),
                    ],
                  ),
                 SizedBox(height: 15.0,),
                  Container(
                    height:300.0,

                    child: TextFormField(
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      maxLength: 200,
                      textAlignVertical: TextAlignVertical.top,
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      onChanged: (vale){
                        text=vale.length;
                        setState(() {
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'description',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                  ),
                ]
    )
        )
    ),



    ])
    ),
        bottomButton()

    ])
    )
    );
  }
  Container bottomButton() {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 20.0,
            spreadRadius: 5.0,
            offset: Offset(0, -6),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: RevButton(
              height: 55.0,
              text: 'Previous',
              textStyle: textStyleDark16px600w,
              color: AppColors.grey,
              radius: 50.0,
              borderColor: AppColors.grey,
              onTap: () async {
                // opendDialog();
              },
            ),
          ),
          horizontalSpace(10.0),
          Expanded(
            child: RevButton(
              width: 55.0,
              text: 'Submit',
              radius: 50.0,
              borderColor: AppColors.colorPrimary,
              textStyle: textStyleWhite14px600w,
              onTap: () {
                //Navigator.pushNamed(context, Screens.EmpFeedBack);
              },
            ),
          ),
        ],
      ),
    );
  }
}
