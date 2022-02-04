import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrms/add_leave_request/presenter/leave_presenter.dart';
import 'package:hrms/leave_request/leave_balance/card_balance.dart';
import 'package:hrms/leave_request/leave_balance/leave_balance_presenter.dart';
import 'package:hrms/leave_request/leave_balance/leave_balance_view.dart';
import 'package:hrms/leave_request/leave_balance/model/leave_balance_model.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LeaveBalancePage extends StatefulWidget {
  const LeaveBalancePage({Key key}) : super(key: key);

  @override
  _LeaveBalancePage createState() => _LeaveBalancePage();
}

class _LeaveBalancePage extends State<LeaveBalancePage>
    implements LeaveBalanceView {
  LeaveBalancePresenter _presenter;
  LeaveBalanceModel _response;

  @override
  void initState() {
    _presenter = LeaveBalancePresenter(this);
    _presenter.getLeaveBalance(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _response.leaveBalanceList == null
                    ? ListView(children: [
                        Header(
                          headerText: 'Leave  Balance',
                        ),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Paid Leave',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            width: Utility.screenWidth(context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Consumed',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '${_response?.leaveBalanceList[0]?.paidLeave ?? ""}',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Annual Quota',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '100',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: CircularPercentIndicator(
                                          radius: 70.0,
                                          lineWidth: 40.0,
                                          percent: 0.4,
                                          center: new Text(
                                            "40%",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          progressColor: Color(0xFF30C6F6),
                                          backgroundColor: Color(0xFFC1EEFD),
                                          animateFromLastPercent: true,
                                          circularStrokeCap:
                                              CircularStrokeCap.butt,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Unpaid Leave',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            width: Utility.screenWidth(context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Consumed',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '${_response?.leaveBalanceList[0]?.unpaidLeave ?? ""}',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Annual Quota',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '100',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: CircularPercentIndicator(
                                          radius: 70.0,
                                          lineWidth: 40.0,
                                          percent: 0.4,
                                          center: new Text(
                                            "40%",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          progressColor: Color(0xFFE74A2F),
                                          backgroundColor: Color(0xFFF3A597),
                                          animateFromLastPercent: true,
                                          circularStrokeCap:
                                              CircularStrokeCap.butt,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Sick Leave',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            width: Utility.screenWidth(context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Consumed',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '${_response?.leaveBalanceList[0]?.sickLeave ?? ""}',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Annual Quota',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '100',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: CircularPercentIndicator(
                                          radius: 70.0,
                                          lineWidth: 40.0,
                                          percent: 0.4,
                                          center: new Text(
                                            "40%",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          progressColor: Color(0xFFF6AB30),
                                          backgroundColor: Color(0xFFFBD598),
                                          animateFromLastPercent: true,
                                          circularStrokeCap:
                                              CircularStrokeCap.butt,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Floater Leave',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            width: Utility.screenWidth(context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Consumed',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '${_response.leaveBalanceList[0].floaterLeave}',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Annual Quota',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '100',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: CircularPercentIndicator(
                                          radius: 70.0,
                                          lineWidth: 40.0,
                                          percent: 0.4,
                                          center: new Text(
                                            "40%",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          progressColor: Colors.blue,
                                          backgroundColor: AppColors.grey,
                                          animateFromLastPercent: true,
                                          circularStrokeCap:
                                              CircularStrokeCap.butt,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Special Leave',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            width: Utility.screenWidth(context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Consumed',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '${_response?.leaveBalanceList[0]?.specialLeave ?? ""}',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Annual Quota',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '100',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: CircularPercentIndicator(
                                          radius: 70.0,
                                          lineWidth: 40.0,
                                          percent: 0.4,
                                          center: new Text(
                                            "40%",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          progressColor: Color(0xFFE74A2F),
                                          backgroundColor: Color(0xFFF3A597),
                                          animateFromLastPercent: true,
                                          circularStrokeCap:
                                              CircularStrokeCap.butt,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Maternity Leave',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            width: Utility.screenWidth(context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Consumed',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '${_response?.leaveBalanceList[0]?.maternityLeave ?? ""}',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Annual Quota',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '100',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: CircularPercentIndicator(
                                          radius: 70.0,
                                          lineWidth: 40.0,
                                          percent: 0.4,
                                          center: new Text(
                                            "40%",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          progressColor: Color(0xFF686D9F),
                                          backgroundColor: Color(0xFFB4B6CF),
                                          animateFromLastPercent: true,
                                          circularStrokeCap:
                                              CircularStrokeCap.butt,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Paternity Leave',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            width: Utility.screenWidth(context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Consumed',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '${_response.leaveBalanceList[0].paternityLeave}',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Annual Quota',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '100',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: CircularPercentIndicator(
                                          radius: 70.0,
                                          lineWidth: 40.0,
                                          percent: 0.4,
                                          center: new Text(
                                            "40%",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          progressColor: Color(0xFF30C6F6),
                                          backgroundColor: Color(0xFFC1EEFD),
                                          animateFromLastPercent: true,
                                          circularStrokeCap:
                                              CircularStrokeCap.butt,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Bereavement Leave',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            width: Utility.screenWidth(context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Consumed',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '${_response?.leaveBalanceList[0]?.bereavementLeave ?? ""}',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Annual Quota',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '100',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: CircularPercentIndicator(
                                          radius: 70.0,
                                          lineWidth: 40.0,
                                          percent: 0.4,
                                          center: new Text(
                                            "40%",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          progressColor: Color(0xFFE74A2F),
                                          backgroundColor: Color(0xFFF3A597),
                                          animateFromLastPercent: true,
                                          circularStrokeCap:
                                              CircularStrokeCap.butt,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Casual Leave',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            width: Utility.screenWidth(context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Consumed',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '${_response?.leaveBalanceList[0]?.casualLeave ?? ""}',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            color: AppColors.dropbg,
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'Annual Quota',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                Text(
                                                  '100',
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: CircularPercentIndicator(
                                          radius: 70.0,
                                          lineWidth: 40.0,
                                          percent: 0.4,
                                          center: new Text(
                                            "40%",
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          progressColor: Colors.blue,
                                          backgroundColor: AppColors.grey,
                                          animateFromLastPercent: true,
                                          circularStrokeCap:
                                              CircularStrokeCap.butt,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ])
                    : ListView(
                        children: [],
                      ),
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
          text: 'Request Leave',
          radius: 50.0,
          borderColor: AppColors.colorPrimary,
          textStyle: textStyleWhite14px600w,
          onTap: () {
            Navigator.pushNamed(context, Screens.AddLeaveRequest);
          },
        ),
      ),
    );
  }

  @override
  void onLeaveBalanceFetched(LeaveBalanceModel response) {
    _response = response;
    setState(() {});
  }
}
