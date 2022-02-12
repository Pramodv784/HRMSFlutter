import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';

class AddAttendance extends StatefulWidget {
  const AddAttendance({Key key}) : super(key: key);

  @override
  _AddAttendanceState createState() => _AddAttendanceState();
}

class _AddAttendanceState extends State<AddAttendance> {
  DateTime _end_date, _start_date;
  var text = 0;

  String title = "";
  String userId = '';
  String userName = '';
  String compId;
  String orgId = '';

  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(children: [
                  Header(
                    headerText: 'Add Attendance',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Request Details',
                              style: textStyleWhite12px400w,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Clock In ',
                                          style: textStyleWhite12px400w,
                                        ),
                                        TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                              color: AppColors.red,
                                              fontSize: 16.0),
                                        ),
                                      ])),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      InkWell(
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            width: Utility.screenWidth(context),
                                            height: 52.0,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              color: AppColors.dropbg,
                                              border: Border.all(
                                                width: 1,
                                                color: AppColors.grey,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                            child: Text(
                                              _start_date != null
                                                  ? Utility.formatDate(
                                                      _start_date.toString())
                                                  : 'hh/mm',
                                              style: TextStyle(fontSize: 15),
                                            )),
                                        onTap: () {
                                          _start_date = DateTime.now();
                                          _showDatePicker(context, 0);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Clock Out ',
                                          style: textStyleWhite12px400w,
                                        ),
                                        TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                              color: AppColors.red,
                                              fontSize: 16.0),
                                        ),
                                      ])),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      InkWell(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          width: Utility.screenWidth(context),
                                          height: 52.0,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: AppColors.dropbg,
                                            border: Border.all(
                                              width: 1,
                                              color: AppColors.grey,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          child: Text(
                                              _end_date != null
                                                  ? Utility.formatDate(
                                                      _end_date.toString())
                                                  : 'hh/mm',
                                              style: TextStyle(fontSize: 15)),
                                        ),
                                        onTap: () {
                                          _showDatePicker(context, 1);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              width: Utility.screenWidth(context),
                              height: 52.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: Color(0xFF616576),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.grey,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Text(
                                  _start_date != null && _end_date != null
                                      ? '${daysBetween(_start_date, _end_date)} days'
                                          .toString()
                                      : '0 hrs',
                                  style: TextStyle(
                                      fontSize: 15, color: AppColors.white)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Note',
                                    style: textStyleWhite12px400w,
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        color: AppColors.red, fontSize: 16.0),
                                  ),
                                ])),
                                Text(
                                  '${text}/200 words',
                                  style: textStyleWhite12px400w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              height: 100.0,
                              child: TextFormField(
                                minLines: null,
                                maxLines: null,
                                expands: true,
                                maxLength: 200,
                                textAlignVertical: TextAlignVertical.top,
                                textInputAction: TextInputAction.newline,
                                keyboardType: TextInputType.multiline,
                                onChanged: (vale) {
                                  text = vale.length;
                                  description = vale;
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                    hintText:
                                        'Please enter reason for applying leave',
                                    hintStyle: TextStyle(color: AppColors.grey),
                                    border: InputBorder.none,
                                    counterStyle: TextStyle(
                                      height: double.minPositive,
                                    ),
                                    counterText: ""),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: AppColors.dropbg,
                                border: Border.all(
                                    width: 1.0, color: AppColors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              bottomButton()
            ],
          ),
        ));
  }

  Container bottomButton() {
    return Container(
      height: 80.0,
      width: Utility.screenWidth(context),
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
      child: Expanded(
        child: RevButton(
          width: 55.0,
          text: 'Add Attendance',
          radius: 50.0,
          borderColor: AppColors.colorPrimary,
          textStyle: textStyleWhite14px600w,
          onTap: () {
            //  addLeaveRequest();
          },
        ),
      ),
    );
  }

  void _showDatePicker(ctx, int i) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    var now = DateTime.now();
    var today = new DateTime(now.year, now.month, now.day);
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 500,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    child: CupertinoDatePicker(
                        minuteInterval: 1,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (val) {
                          if (i == 0) {
                            _start_date = val;
                          } else {
                            _end_date = val;
                          }
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () {
                      setState(() {});
                      Navigator.of(ctx).pop();
                    },
                  )
                ],
              ),
            ));
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
