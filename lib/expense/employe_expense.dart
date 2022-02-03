import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms/feedback/empfeedback/card_feed.dart';
import 'package:hrms/feedback/empfeedback/model/feed_question_model.dart';
import 'package:hrms/feedback/select_emp/feed_presenter.dart';
import 'package:hrms/feedback/select_emp/model/employee_data.dart';
import 'package:hrms/feedback/select_emp/model/team_data.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';

class EmployeeExpense extends StatefulWidget {
  const EmployeeExpense({Key key}) : super(key: key);

  @override
  _EmployeeExpenseState createState() => _EmployeeExpenseState();
}

class _EmployeeExpenseState extends State<EmployeeExpense> {
  String description='';
  var text=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Header(headerText: 'Add Expenses',),
            Expanded(
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Purpose of the advance Request ',
                                    style: textStyleWhite12px400w,
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(color: AppColors.red, fontSize: 16.0),
                                  ),
                                ])),
                            SizedBox(
                              height: 5.0,
                            ),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20.0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: AppColors.dropbg,
                              ),
                              dropdownColor: Colors.white,
                              onChanged: (String value) {
                                setState(() {
                                  //_selected=value;
                                  print('Valuse....${value}');
                                  if (value == 'EMPLOYEE') {
                                   // empstatus = true;
                                  } else {
                                 //   empstatus = false;
                                  }
                                });
                              },
                              hint: Text('Available Leave Type*'),
                              icon: new Image.asset(Images.DropIcon),
                              /*items:
                              //["feed back type"]
                              feedTypeList
                                  .map((DataCategory label) => DropdownMenuItem(
                                child: Text(label.categoryType),
                                value: label.categoryType,
                              ))
                                  .toList(),*/
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'Note for approvers',
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
                            SizedBox(height: 5.0,),
                            Container(
                              height:100.0,
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
                                  description=vale;
                                  setState(() {
                                  });
                                },
                                decoration: InputDecoration(
                                    hintText: 'Please enter reason for applying leave',
                                    hintStyle: TextStyle(
                                        color: AppColors.greyNew
                                    ),
                                    border: InputBorder.none,
                                    counterStyle: TextStyle(height: double.minPositive,),
                                    counterText: ""
                                ),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: AppColors.dropbg,
                                border: Border.all(
                                    width: 1.0,
                                    color:AppColors.grey
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Images.AddDocumentIcon,
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 10,

                                ),
                                RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'Add Attachment',
                                        style: textStyleWhite12px400wRed,

                                      ),

                                     /* TextSpan(
                                        text: '*',
                                        style: TextStyle(color: AppColors.red, fontSize: 16.0),
                                      ),*/
                                    ])),
                               /* Text('${text}/200 words',
                                  style: textStyleWhite12px400w,
                                ),*//* Text('${text}/200 words',
                                  style: textStyleWhite12px400w,
                                ),*/
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ])),
            bottomButton()
          ],
        ),
      ),
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
              text: 'Cancel',
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
              text: 'Select',
              radius: 50.0,
              borderColor: AppColors.colorPrimary,
              textStyle: textStyleWhite14px600w,
              onTap: () {

               /* Navigator.pushNamed(context, Screens.AddEmpFeedBack,
                    arguments:[roleId,selectedId]);*/
              },
            ),
          ),
        ],
      ),
    );
  }
}
