import 'dart:io';

import 'package:chips_input/chips_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hrms/add_leave_request/leave_view.dart';
import 'package:hrms/add_leave_request/model/add_leave_request.dart';
import 'package:hrms/add_leave_request/model/emp_key_response.dart';
import 'package:hrms/add_leave_request/model/leave_type_response.dart';
import 'package:hrms/add_leave_request/presenter/leave_presenter.dart';
import 'package:hrms/leave_request/model/ProfileModel.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/InputField.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'model/add_leave_response.dart';

class AddLeaveRequest extends StatefulWidget {
  AddLeaveRequest({Key key}) : super(key: key);
  LeaveRequest _request = LeaveRequest();

  @override
  _AddLeaveRequest createState() => _AddLeaveRequest();
}

class _AddLeaveRequest extends State<AddLeaveRequest> implements LeaveView {
  DateTime _end_date, _start_date;
  var text = 0;
  LeavePresenter _presenter;
  List<Leaves> leaveTypeList = [];
  List<EmployeeDataList> emplist = [];

  String title = '';
  String userId = '';
  String userName = '';
  String notify = "";
  String compId;
  String orgId = '';

  String description = '';
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _presenter = LeavePresenter(this);
    _presenter.getLeaveType(context);
    getuserId();

    super.initState();
  }

  void getuserId() async {
    var userData = await (AuthUser.getInstance()).getCurrentUser();
    userId = userData.userId.toString();
    userName = userData.userName.toString();
    print('Id ***** ${userData.userId}');
    compId = userData.userCredentials.companyId.toString();
    orgId = userData.userCredentials.orgId.toString();

    //print('login Data****${AuthUser.getInstance().getCurrentUser().toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(children: [
                    Header(
                      headerText: 'Add Leave Rquest',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                            text: 'From Date ',
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
                                              width:
                                                  Utility.screenWidth(context),
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
                                                    : 'dd/mm/yyyy',
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
                                            text: 'To Date ',
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
                                                    : 'dd/mm/yyyy',
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
                                        : '0 days',
                                    style: TextStyle(
                                        fontSize: 15, color: AppColors.white)),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: 'Leave Title ',
                                  style: textStyleWhite12px400w,
                                ),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                      color: AppColors.red, fontSize: 16.0),
                                ),
                              ])),
                              SizedBox(
                                height: 5.0,
                              ),
                              SizedBox(
                                width: Utility.screenWidth(context),
                                child: InputField(
                                  placeHolderText: 'Enter leave title',
                                  errorMessage: 'Please Enter leave  title',
                                  inputType: InputType.ONLY_WORDS,
                                  textCapitalization: TextCapitalization.words,
                                  onTextChange: (value) {
                                    value = title;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: 'Select Available Leave Type',
                                  style: textStyleWhite12px400w,
                                ),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                      color: AppColors.red, fontSize: 16.0),
                                ),
                              ])),
                              SizedBox(
                                height: 5.0,
                              ),
                              if (leaveTypeList?.length > 0)
                                DropdownButtonFormField<Leaves>(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.grey, width: 1),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: AppColors.dropbg,
                                    ),
                                    dropdownColor: Colors.white,
                                    onChanged: (Leaves value) {
                                      setState(() {
                                        //_selected = value;
                                        widget?._request?.leaveTypeId =
                                            value.leaveTypeId.toString();
                                        widget?._request?.leaveType =
                                            value.leavetype;
                                      });
                                    },
                                    hint: Text('Available leave type'),
                                    icon: new Image.asset(Images.DropIcon),
                                    items: leaveTypeList != null
                                        ? leaveTypeList
                                            .map((Leaves label) =>
                                                DropdownMenuItem(
                                                    child:
                                                        Text(label.leavetype),
                                                    value: label))
                                            .toList()
                                        : ['select leave type']
                                            .map((e) => DropdownMenuItem(
                                                  child: Text(
                                                    e.toString(),
                                                  ),
                                                ))),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Notify ',
                                style: textStyleWhite12px400w,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                width: Utility.screenWidth(context),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.0),
                                  color: AppColors.dropbg,
                                  border: Border.all(
                                      width: 1.0, color: AppColors.grey),
                                ),
                                child: ChipsInput(
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Notify'),
                                  maxChips: 10,
                                  // remove, if you like infinity number of chips

                                  findSuggestions: getList,
                                  onChanged: (data) {
                                   _onChanged(data);
                                  },
                                  chipBuilder: (context, state,
                                      EmployeeDataList profile) {
                                    return InputChip(
                                      key: ObjectKey(profile),
                                      label: Text(profile.fullName),
                                      avatar: CircleAvatar(
                                        child: Icon(Icons.account_circle),
                                      ),
                                      onDeleted: () =>
                                          state.deleteChip(profile),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    );
                                  },
                                  suggestionBuilder:
                                      (context, EmployeeDataList profile) {
                                    return ListTile(
                                      key: ObjectKey(profile),
                                      leading: CircleAvatar(
                                        child: Icon(Icons.account_circle),
                                      ),
                                      title: Text(profile.fullName),
                                      subtitle: Text(profile.email),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      hintStyle:
                                          TextStyle(color: AppColors.grey),
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
            addLeaveRequest();
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

  Future<List<EmployeeDataList>> getList(String query) async {
    if (query.length != 0) {
      _presenter.getEmpKey(context, query);
      /*   return leaveTypeList.where((element) {
          return element.f.contains(query);
        }).toList(growable:false);*/
      return emplist.where((element) {
        setState(() {});
        return element.firstName.toLowerCase().contains(query.toLowerCase());
      }).toList(growable: false);
    } else {
      setState(() {});
      return const <EmployeeDataList>[];
    }
  }

  void _onChanged(List<EmployeeDataList> data) {
    print('onChanged $data');
    notify = "";
    for (int i = 0; i < data.length; i++) {
      if (notify.length == 0) {
        notify = data[i].fullName;
      } else {
        notify = notify + "," + data[i].fullName;
      }
    }
    print('Notify Data ${notify}');
  }

  void _onChipTapped(EmployeeDataList profile) {
    print('$profile');
    widget._request?.notifyTo = profile.fullName;
  }

  @override
  void onLeaveFecthed(LeaveTypeResponse response) {
    leaveTypeList.clear();
    leaveTypeList.addAll(response.leaves);
    setState(() {});
  }

  @override
  void onAddLeaveFecthed(AddLeaveResponse response) {
    print('leave add response ****  ${response.message}');
    Dialogs.showMsgCustomDialog(context, onok: () {
      Navigator.pop(context);
      Navigator.of(context).pushNamedAndRemoveUntil(
          Screens.kBaseScreen, ModalRoute.withName('/'));
    }, message: '', title: response.message);
  }

  @override
  void onEmpkeyFecthed(EmpKeyResponse response) {
    print('Empkey response **********${response.employeeDataList.length}');
    emplist.clear();
    emplist.addAll(response.employeeDataList);
    setState(() {});
    // TODO: implement onEmpkeyFecthed
  }

  void addLeaveRequest() {
    widget._request.employeeId = userId;
    try {
      widget._request.startdate = Utility.formatDate(_start_date.toString());
      widget._request.endDate = Utility.formatDate(_end_date.toString());
      widget._request.numberOfDays =
          daysBetween(_start_date, _end_date).toString();
    } catch (Exception) {
      print("");
    }

    widget._request.companyId = compId;
    widget._request.orgId = orgId;
    widget._request.appliedBy = userName;

    widget._request.notifyTo = notify;
    widget._request.comment = title;

    if (widget._request.startdate == null) {
      Utility.showErrorToast(context, 'please pick start date');
    } else if (widget._request.endDate == null) {
      Utility.showErrorToast(context, 'please pick end date');
    } else if (widget._request.comment == null) {
      Utility.showErrorToast(context, 'please enter title');
    } else if (widget._request.leaveType == null) {
      Utility.showErrorToast(context, 'please select leave type');
    } else if (widget._request.notifyTo == null) {
      Utility.showErrorToast(context, 'please enter notify ');
    } else {
      _presenter.AddLeave(context, widget._request);
    }
  }
}
