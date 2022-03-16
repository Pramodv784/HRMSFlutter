import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms/expense/expense_view.dart';
import 'package:hrms/expense/model/add_expense_request.dart';
import 'package:hrms/expense/model/add_expense_response.dart';
import 'package:hrms/expense/model/expense_history_response.dart';
import 'package:hrms/expense/model/get_project_list_response.dart';
import 'package:hrms/profile/model/upload_image_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/InputField.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:image_picker/image_picker.dart';

import '../res/Screens.dart';
import '../utility/Dialogs.dart';
import 'expense_presenter.dart';
import 'model/expense_category_response.dart';

class EmployeeAdvances extends StatefulWidget {
  const EmployeeAdvances({Key key}) : super(key: key);

  @override
  _EmployeeAdvancesState createState() => _EmployeeAdvancesState();
}

class _EmployeeAdvancesState extends State<EmployeeAdvances>
    implements ExpenseView {
  String description = '';
  final picker = ImagePicker();
  File _FileImage;
  DateTime _expense_date;
  AddExpenseRequest _request = AddExpenseRequest();
  var text = 0;
  ExpensePresenter _presenter;
  List<ExpenseCategoryList> expcateList = [];
  List<ProjectdataList> projectList=[];
  int userId = 0;
  String userName="";

  @override
  void initState() {
    _presenter = ExpensePresenter(this);
    _presenter.getExpenseCategory(context);
    _presenter.getProjectList(context);
    getuserId();
    super.initState();
  }

  void getuserId() async {
    var userData = await (AuthUser.getInstance()).getCurrentUser();
    print(
        'login Data****${AuthUser.getInstance().getCurrentUser().toString()}');
    userId = userData.userId;
    userName=userData.userName;
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
                headerText: 'Add Expenses',
              ),
              Expanded(
                  child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Expenses Category ',
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
                            DropdownButtonFormField<ExpenseCategoryList>(
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
                              onChanged: (ExpenseCategoryList value) {
                                setState(() {
                                  _request.categoryId = value.categoryId;
                                });
                              },
                              hint: Text('Expenses Category*'),
                              icon: new Image.asset(Images.DropIcon),
                              items:
                                  //["feed back type"]
                                  expcateList
                                      .map((ExpenseCategoryList label) =>
                                          DropdownMenuItem(
                                            child: Text(label.categoryName),
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
                                text: 'Project/Cost Center ',
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
                            DropdownButtonFormField<ProjectdataList>(
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
                                      BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: AppColors.dropbg,
                              ),
                              dropdownColor: Colors.white,
                              onChanged: (ProjectdataList value) {
                                _request.projectId=value.id;
                                setState(() {});
                              },
                              hint: Text('Project/Cost Center*'),
                              icon: new Image.asset(Images.DropIcon),
                              items:
                                //["feed back type"]
                                projectList
                                    .map((ProjectdataList label) => DropdownMenuItem(
                                  child: Text(label.projectName),
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
                                text: 'Name of the expense ',
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
                                placeHolderText: 'Name of the expense',
                                errorMessage: 'Please Enter Name of the expense*',
                                inputType: InputType.ONLY_WORDS,
                                onTextChange: (value) {
                                  _request.expenseTitle = value;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Merchant name ',
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
                                placeHolderText: 'Merchant name',
                                errorMessage: 'Please Enter Merchant name*',
                                inputType: InputType.ONLY_WORDS,
                                onTextChange: (value) {
                                  // value=title;
                                  _request.merchantName = value;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Amount ',
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
                                placeHolderText: 'Amount*',
                                errorMessage: 'Please Enter Amount**',
                                inputType: InputType.MOBILE,

                                onTextChange: (value) {
                                  // value=title;
                                  print('amount $value');
                                  _request.expenseAmount = double.parse(value);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Invoice number ',
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
                                placeHolderText: 'Invoice number',
                                errorMessage: 'Please Enter Invoice number*',
                                inputType: InputType.ONLY_WORDS,
                                onTextChange: (value) {
                                  // value=title;
                                  _request.billNumber = value;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'Expenses Date ',
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
                            InkWell(
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  width: Utility.screenWidth(context),
                                  height: 52.0,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.0),
                                    color: AppColors.dropbg,
                                    border: Border.all(
                                      width: 1,
                                      color: AppColors.grey,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: Text(
                                    _expense_date != null
                                        ? Utility.formatDate(
                                            _expense_date.toString())
                                        : 'dd/mm/yyyy',
                                    style: TextStyle(fontSize: 15),
                                  )),
                              onTap: () {
                                _expense_date = DateTime.now();
                                _showDatePicker(context);
                              },
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
                                  _request.comment = vale;
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                    hintText:
                                        'Please enter reason for applying leave',
                                    hintStyle:
                                        TextStyle(color: AppColors.greyNew),
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
                            InkWell(
                              child: Row(
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
                                    ),*/ /* Text('${text}/200 words',
                                      style: textStyleWhite12px400w,
                                    ),*/
                                ],
                              ),
                              onTap: () {
                                _modalBottomSheetMenu();
                              },
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              bottomButton()
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePicker(ctx) {
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
                          _expense_date = val;
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
                addExpense();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (builder) {
          return Wrap(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0),
                    )),
                child: Column(
                  children: [
                    Container(
                      width: 60.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: AppColors.lineColorGrey,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    verticalSpace(20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                pickImage(ImageSource.camera);
                              },
                              child: Container(
                                  width: 90,
                                  height: 90,
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.colorPrimaryLight,
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Image.asset(Images.CameraIcon)),
                            ),
                            verticalSpace(4.0),
                            Text(
                              'Camera',
                              style: textStyle12px600w,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                pickImage(ImageSource.gallery);
                              },
                              child: Container(
                                  width: 90,
                                  height: 90,
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.colorPrimaryLight,
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Image.asset(Images.GalleryIcon)),
                            ),
                            verticalSpace(4.0),
                            Text(
                              'Gallery',
                              style: textStyle12px600w,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }

  Future pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source, imageQuality: 80);

    if (pickedFile != null) {
      _FileImage = File(pickedFile.path);
      _presenter.uploadImage(context, _FileImage);
      setState(() {});
      print('file path****${_FileImage}');
    }
  }

  @override
  void onExpenseCateFecthed(ExpenseCategoryResponse response) {
    expcateList.clear();
    expcateList.addAll(response.expenseCategoryList);
    setState(() {

    });
  }

  @override
  void onImageFecthed(UploadImageResponse response) {
    print('image upload **** ${response.data.filepath}');
    _request.imageUrl = response.data.fileurl;
    Utility.showErrorToast(context, response.message);
    setState(() {

    });
  }

  @override
  void onAddExpenseFecthed(AddExpenseResponse response) {
    print('Add Expense Response **** ${response.message}');
    Dialogs.showMsgCustomDialog(context,onok:  (){
      Navigator.pop(context);
      Navigator.of(context).pushNamedAndRemoveUntil(Screens.kBaseScreen, ModalRoute.withName('/'));
    },message: '',title: response.message);
  }

  void addExpense() {
    try{
      _request.expenseDate = Utility.formatDate(_expense_date?.toString()?? "");
    }
    catch(Exception)
    {
      print("");
    }

    _request.employeeId = userId;
    _request.appliedBy=userName;
    if (_request.categoryId == null) {
      Utility.showErrorToast(context, 'please select expense category');
    } else if (_request.expenseTitle == null) {
      Utility.showErrorToast(context, 'please enter expense name');
    } else if (_request.merchantName == null) {
      Utility.showErrorToast(context, 'please enter merchant name');
    } else if (_request.expenseAmount == null) {
      Utility.showErrorToast(context, 'please enter amount ');
    } else if (_request.billNumber == null) {
      Utility.showErrorToast(context, 'please enter invoice number ');
    } else if (_request.expenseDate == null) {
      Utility.showErrorToast(context, 'please pick expense date');
    } else if (_request.comment == null) {
      Utility.showErrorToast(context, 'please enter comment');
    } else {
      _presenter.AddExpense(context, _request);
    }
  }

  @override
  void onExpenseHistoryFecthed(ExpenseHistoryResponse response) {
  }

  @override
  onError(String message) {
   Utility.showErrorToast(context, message);
  }

  @override
  void onProjectListFecthed(GetProjectListResponse response) {
     projectList.clear();
     projectList.addAll(response.projectdataList);
     setState(() {

     });
  }
}
