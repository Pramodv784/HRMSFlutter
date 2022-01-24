import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hrms/feedback/select_emp/model/employee_data.dart';

import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../add_feedback.dart';
import 'feed_presenter.dart';
import 'feed_view.dart';
import 'model/team_data.dart';
import 'model/team_role_response.dart';

class SelectEmp extends StatefulWidget {
  const SelectEmp({Key key}) : super(key: key);

  @override
  _SelectEmpState createState() => _SelectEmpState();
}

class _SelectEmpState extends State<SelectEmp> implements FeedView {
  FeedPresenter _presenter;
  TeamRoleResponse teamRoleResponse;

  //String _selected; // Option 2

  List<DataCategory> feedTypeList = [];
  List<TeamDatas> teamList = [];
  List<TypeVMs> empList = [];

  bool empstatus = false;
  int roleId=0,selectedId=0;

  @override
  void initState() {
    _presenter = FeedPresenter(this);
    _presenter.getFeedType(context);
    _presenter.getTeamsdata(context, 156);
    // getuserId();
    super.initState();
  }

  void getuserId() async {
    var userData = await (AuthUser.getInstance()).getCurrentUser();
    int id = userData.userId;
    _presenter.getTeamsdata(context, id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(
              headerText: 'Add Feedback',
            ),
            Expanded(
                child: ListView(children: [
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'Select Feedback type ',
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
                            empstatus = true;
                          } else {
                            empstatus = false;
                          }
                        });
                      },
                      hint: Text('Feed back type'),
                      icon: new Image.asset(Images.DropIcon),
                      items:
                          //["feed back type"]
                          feedTypeList
                              .map((DataCategory label) => DropdownMenuItem(
                                    child: Text(label.categoryType),
                                    value: label.categoryType,
                                  ))
                              .toList(),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    if (empstatus) ...[
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Select Team ',
                          style: textStyleWhite12px400w,
                        ),
                        TextSpan(
                          text: '*',
                          style:
                              TextStyle(color: AppColors.red, fontSize: 16.0),
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
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: AppColors.dropbg,
                        ),
                        dropdownColor: Colors.white,
                        onChanged: (String value) {
                          setState(() {
                            //_selected = value;
                            empList.clear();
                            _presenter.getEmploydata(context, int.parse(value));

                            print('Team Id ****$value');
                          });
                        },
                        hint: Text('Team'),
                        icon: new Image.asset(Images.DropIcon),
                        items: teamList
                            .map((TeamDatas label) => DropdownMenuItem(
                                  child: Text(label.fullName),
                                  value: label.employeeId.toString(),
                                ))
                            .toList(),
                      ),
                    ],
                    SizedBox(
                      height: 20.0,
                    ),
                    if (empstatus) ...[
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Select Employee ',
                          style: textStyleWhite12px400w,
                        ),
                        TextSpan(
                          text: '*',
                          style:
                              TextStyle(color: AppColors.red, fontSize: 16.0),
                        ),
                      ])),
                      SizedBox(
                        height: 5.0,
                      ),
                      if(empList.length>0)
                        DropdownButtonFormField<TypeVMs>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: AppColors.dropbg,
                        ),
                        dropdownColor: Colors.white,
                        hint: Text('Employee name'),
                        icon: new Image.asset(Images.DropIcon),
                        items: empList != null
                            ? empList
                                .map((TypeVMs data) => DropdownMenuItem(
                                      child: Text(data.fullName),
                                      value: data
                                    ))
                                .toList()
                            : ['select employee'].map((e) => DropdownMenuItem(
                                  child: Text(
                                    e.toString(),
                                  ),
                                )),
                        onChanged: (TypeVMs value) {
                          setState(() {
                              roleId=value.roleId;
                              selectedId=value.employeeId;
                            //_selected = value;
                          });
                        },
                      ),
                    ],
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
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

                Navigator.pushNamed(context, Screens.AddEmpFeedBack,
                    arguments:[roleId,selectedId]);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onFeedTypeFecthed(TeamRoleResponse response) {
    print('response ***${response.dataCategory.length}');
    feedTypeList.clear();
    feedTypeList.addAll(response.dataCategory);
    setState(() {});
  }

  @override
  void onTeamdataFecthed(TeamData response) {
    print('response ***${response.teamDatas.length}');
    // TODO: implement onTeamdataFecthed
    teamList.clear();
    teamList.addAll(response.teamDatas);
    setState(() {});
  }

  @override
  void onEmplyoeedataFecthed(EmployeeData response) {
    print('emp response ***${response.typeVMs.length}');
    // TODO: implement onTeamdataFecthed
    empList.clear();
    empList.addAll(response.typeVMs);
    setState(() {});
    // TODO: implement onEmplyoeedataFecthed
  }
}
