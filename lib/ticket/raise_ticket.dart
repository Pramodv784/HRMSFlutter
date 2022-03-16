import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/ticket/model/add_ticket_response.dart';
import 'package:hrms/ticket/model/ticket_type_response.dart';
import 'package:hrms/ticket/ticket_presenter.dart';
import 'package:hrms/ticket/ticket_view.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/InputField.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';

import '../res/Screens.dart';
import '../user/AuthUser.dart';
import '../utility/Dialogs.dart';
import 'model/add_ticket_request.dart';
import 'model/get_all_emp_response.dart';

class RaiseTicket extends StatefulWidget {
  const RaiseTicket({Key key}) : super(key: key);

  @override
  _RaiseTicketState createState() => _RaiseTicketState();
}

class _RaiseTicketState extends State<RaiseTicket> implements TicketView {
  String description = '';
  var text = 0;
  TicketPresenter _presenter;
  List<CaseTypesData> ticketTypeList = [];
  AddTicketRequest _request = AddTicketRequest();
  int userId = 0, orgId, cmpId = 0;
  List<GetAllEmpResponse> empList = [];

  @override
  void initState() {
    _presenter = TicketPresenter(this);
    _presenter.getTicketType(context);
    getuserId();
    getTicketList();
    super.initState();
  }

  void getTicketList() async {
    empList = await _presenter.getAllEmp();
    print('Emp listResponse ${empList.length}');
    setState(() {});
  }

  void getuserId() async {
    var userData = await (AuthUser.getInstance()).getCurrentUser();
    userId = userData.userId;
    orgId = userData.userCredentials.orgId;
    cmpId = userData.userCredentials.companyId;
    print(
        'login Data****${AuthUser.getInstance().getCurrentUser().toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: Column(
            children: [
              Header(
                headerText: 'Raise Ticket',
              ),
              Expanded(
                  child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
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
                              text: 'I need help regarding ',
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
                          DropdownButtonFormField<CaseTypesData>(
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
                            onChanged: (CaseTypesData value) {
                              setState(() {
                                _request.caseTypeId = value.caseTypeId.toString();
                                print('Valuse....${value}');
                                if (value == 'EMPLOYEE') {
                                  // empstatus = true;
                                } else {
                                  //   empstatus = false;
                                }
                              });
                            },
                            hint: Text('Select Category'),
                            icon: new Image.asset(Images.DropIcon),
                            items:
                                //["feed back type"]
                                ticketTypeList
                                    .map(
                                        (CaseTypesData label) => DropdownMenuItem(
                                              child: Text(label.caseType),
                                              value: label,
                                            ))
                                    .toList(),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: 'AssignTo ',
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
                          DropdownButtonFormField<GetAllEmpResponse>(
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
                            onChanged: (GetAllEmpResponse value) {
                              setState(() {
                                // _request.caseTypeId=value.caseTypeId.toString();
                                print('Valuse....${value}');
                                _request.assignedToId =
                                    value.employeeId.toString();
                              });
                            },
                            hint: Text('Select Category'),
                            icon: new Image.asset(Images.DropIcon),
                            items:
                                //["feed back type"]
                                empList
                                    .map((GetAllEmpResponse label) =>
                                        DropdownMenuItem(
                                          child: Text(label.fullName),
                                          value: label,
                                        ))
                                    .toList(),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: 'Title ',
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
                          SizedBox(
                            width: Utility.screenWidth(context),
                            child: InputField(
                              placeHolderText: 'Enter Title',
                              errorMessage: 'Please Enter Title**',
                              inputType: InputType.EMAIL,
                              onTextChange: (value) {
                                _request.caseTitle = value;
                              },
                            ),
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
                                  text: 'Description',
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
                                  hintText: 'Enter Description',
                                  hintStyle: TextStyle(color: AppColors.greyNew),
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
                              border:
                                  Border.all(width: 1.0, color: AppColors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          /*   Row(
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

                                        */ /* TextSpan(
                                          text: '*',
                                          style: TextStyle(color: AppColors.red, fontSize: 16.0),
                                        ),*/ /*
                                      ])),
                                  */ /* Text('${text}/200 words',
                                    style: textStyleWhite12px400w,
                                  ),*/ /**/ /* Text('${text}/200 words',
                                    style: textStyleWhite12px400w,
                                  ),*/ /*
                                ],
                              ),*/
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
                Navigator.pop(context);
              },
            ),
          ),
          horizontalSpace(10.0),
          Expanded(
            child: RevButton(
              width: 55.0,
              text: 'Save',
              radius: 50.0,
              borderColor: AppColors.colorPrimary,
              textStyle: textStyleWhite14px600w,
              onTap: () {
                addTicket();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  onError(String message) {
    Utility.showErrorToast(context, message);
  }

  @override
  void onTicketTypeFecthed(TicketTypeResponse response) {
    ticketTypeList.clear();
    ticketTypeList.addAll(response.caseTypesData);
    setState(() {});
  }

  void addTicket() {
    _request.comment = description;
    _request.caseCreatedById = userId.toString();
    _request.orgId = orgId.toString();
    _request.companyId = cmpId.toString();
    _request.assignedToId = '210';
    print('Request *** ${_request.toString()}');

    if (_request.caseTypeId == null) {
      Utility.showErrorToast(context, 'please select category type');
    } else if (_request.assignedToId == null) {
      Utility.showErrorToast(context, 'please select assign to');
    } else if (_request.caseTitle == null) {
      Utility.showErrorToast(context, 'please enter title');
    } else if (description.isEmpty) {
      Utility.showErrorToast(context, 'please enter description');
    } else {
      _presenter.AddTicket(context, _request);
    }
  }

  @override
  void onTicketAddedFecthed(AddTicketResponse response) {
    print('ticket add response ****  ${response.message}');
    Dialogs.showMsgCustomDialog(context, onok: () {
      Navigator.pop(context);
      Navigator.of(context).pushNamedAndRemoveUntil(
          Screens.kBaseScreen, ModalRoute.withName('/'));
    }, message: '', title: response.message);
  }
}
