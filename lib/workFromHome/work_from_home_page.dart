import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:hrms/add_leave_request/model/emp_key_response.dart';
import 'package:hrms/add_leave_request/model/leave_type_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:hrms/workFromHome/model/get_work_from_list_response.dart';
import 'package:hrms/workFromHome/model/w_f_h_request.dart';
import 'package:hrms/workFromHome/model/w_f_h_response.dart';
import 'package:hrms/workFromHome/presenter/wfh_presenter.dart';
import 'package:hrms/workFromHome/work_from_home_view.dart';

class WorkFromHomePage extends StatefulWidget {
  WorkFromHomePage({Key key}) : super(key: key);
  WFHRequest _request = WFHRequest();

  @override
  _WorkFromHomePageState createState() => _WorkFromHomePageState();
}

class _WorkFromHomePageState extends State<WorkFromHomePage>
    implements WorkFromHomeView {
  DateTime _end_date, _start_date;
  var text = 0;

  WFHPresenter _presenter;

  List<Leaves> leaveTypeList = [];
  List<EmployeeDataList> emplist = [];

  String title = "";
  String userId = '';
  String notify = "";

  String description = '';

  @override
  void initState() {
    _presenter = WFHPresenter(this);
    getuserId();
    super.initState();
  }

  void getuserId() async {
    var userData = await (AuthUser.getInstance()).getCurrentUser();
    userId = userData.userId.toString();
    print('Id ***** ${userData.userId}');
  }

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
                    headerText: 'Work From Home Request',
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
                            const Text(
                              'Request Details',
                              style: textStyleWhite12px400w,
                            ),
                            const SizedBox(
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
                                          text: const TextSpan(children: [
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
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      InkWell(
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
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
                                                  : 'dd/mm/yyyy',
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            )),
                                        onTap: () {
                                          _start_date = DateTime.now();
                                          _showDatePicker(context, 0);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: const TextSpan(children: [
                                        const TextSpan(
                                          text: 'To Date ',
                                          style: textStyleWhite12px400w,
                                        ),
                                        const TextSpan(
                                          text: '*',
                                          style: const TextStyle(
                                              color: AppColors.red,
                                              fontSize: 16.0),
                                        ),
                                      ])),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      InkWell(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
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
                                              style: const TextStyle(
                                                  fontSize: 15)),
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
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              width: Utility.screenWidth(context),
                              height: 52.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: const Color(0xFF616576),
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
                                  style: const TextStyle(
                                      fontSize: 15, color: AppColors.white)),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              'Notify ',
                              style: textStyleWhite12px400w,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              width: Utility.screenWidth(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.0),
                                color: AppColors.dropbg,
                                border: Border.all(
                                    width: 1.0, color: AppColors.grey),
                              ),
                              child: ChipsInput<EmployeeDataList>(
                                decoration: const InputDecoration(
                                    border: InputBorder.none, hintText: ''),
                                findSuggestions: getList,
                                onChanged: _onChanged,
                                chipBuilder: (BuildContext context,
                                    ChipsInputState<EmployeeDataList> state,
                                    EmployeeDataList profile) {
                                  return InputChip(
                                    label: Text(profile.fullName),
                                    onDeleted: () => state.deleteChip(profile),
                                    onSelected: (_) => _onChipTapped(profile),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  );
                                },
                                suggestionBuilder: (BuildContext context,
                                    ChipsInputState<EmployeeDataList> state,
                                    EmployeeDataList profile) {
                                  return ListTile(
                                    key: ObjectKey(profile),
                                    title: Text(profile.fullName),
                                    onTap: () =>
                                        state.selectSuggestion(profile),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: const TextSpan(children: [
                                  TextSpan(
                                    text: 'Reason',
                                    style: textStyleWhite12px400w,
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        color: AppColors.red, fontSize: 16.0),
                                  ),
                                ])),
                                Text(
                                  '$text/200 words',
                                  style: textStyleWhite12px400w,
                                ),
                              ],
                            ),
                            const SizedBox(
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
                                decoration: const InputDecoration(
                                    hintText:
                                        'Please enter reason for applying leave',
                                    hintStyle: TextStyle(color: AppColors.grey),
                                    border: InputBorder.none,
                                    counterStyle: const TextStyle(
                                      height: double.minPositive,
                                    ),
                                    counterText: ""),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
            offset: const Offset(0, -6),
          )
        ],
      ),
      child: Expanded(
        child: RevButton(
          width: 55.0,
          text: 'Request Work From Home',
          radius: 50.0,
          borderColor: AppColors.colorPrimary,
          textStyle: textStyleWhite14px600w,
          onTap: () {
            widget._request.startDate =
                Utility.formatDate(_start_date.toString());
            widget._request.endDate = Utility.formatDate(_end_date.toString());
            widget._request.employeeId = 5;
            widget._request.numberOfDays = daysBetween(_start_date, _end_date);
            widget._request.comment = description;

            _presenter.addWorkFromHomeRequest(context, widget._request);
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
              color: const Color.fromARGB(255, 255, 255, 255),
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
                    child: const Text('OK'),
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
    if (query.isNotEmpty) {
      //_presenter.getEmpKey(context, query);
      /*   return leaveTypeList.where((element) {
          return element.f.contains(query);
        }).toList(growable:false);*/
      return emplist.where((element) {
        return element.fullName.contains(query);
      }).toList(growable: false);
    } else {
      return const <EmployeeDataList>[];
    }
  }

  void _onChanged(List<EmployeeDataList> data) {
    print('onChanged $data');
    notify = "";
    for (int i = 0; i < data.length; i++) {
      if (notify.isEmpty) {
        notify = data[i].fullName;
      } else {
        notify = notify + "," + data[i].fullName;
      }
    }
    print('Notify Data $notify');
  }

  void _onChipTapped(EmployeeDataList profile) {
    print('$profile');
  //  widget._request?.notifyTo = profile.fullName;
  }

  @override
  void onAddWFHRequest(WFHResponse response) {
      Dialogs.showMsgCustomDialog(context, onok: () {
        Navigator.pop(context);
        Navigator.of(context).pushNamedAndRemoveUntil(
            Screens.kBaseScreen, ModalRoute.withName('/'));
      }, message: '', title: response.message);

  }

  @override
  onError(String message) {
    // TODO: implement onError
    throw UnimplementedError();
  }

  @override
  void onGetFHList(GetWorkFromListResponse response) {
    // TODO: implement onGetFHList
  }
}
