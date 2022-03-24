import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms/profile/model/upload_image_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/ticket/model/AddTicketRequest.dart';
import 'package:hrms/ticket/model/AddTicketResponse.dart';
import 'package:hrms/ticket/model/GetAllUser.dart';
import 'package:hrms/ticket/model/GetMyCaseResponse.dart';
import 'package:hrms/ticket/model/TicketCategoryResponse.dart';
import 'package:hrms/ticket/model/TicketPriorityResponse.dart';

import 'package:hrms/ticket/model/TicketResponse.dart';
import 'package:hrms/ticket/model/add_ticket_response.dart';
import 'package:hrms/ticket/model/ticket_type_response.dart';
import 'package:hrms/ticket/ticket_presenter.dart';
import 'package:hrms/ticket/ticket_view.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/InputField.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:image_picker/image_picker.dart';
import '../res/Screens.dart';
import '../user/AuthUser.dart';
import '../utility/Dialogs.dart';
import 'model/image_model.dart';

class RaiseTicket extends StatefulWidget {
  CaseDataList _data;

  RaiseTicket(this._data, {Key key}) : super(key: key);

  @override
  _RaiseTicketState createState() => _RaiseTicketState();
}

class _RaiseTicketState extends State<RaiseTicket> implements TicketView {
  String description = '';
  var text = 0;
  TicketPresenter _presenter;

  AddTicketRequest _request = AddTicketRequest();
  int userId = 0, orgId, cmpId = 0;
  List<EmployeeData> empList = [];
  final picker = ImagePicker();
  File _FileImage;
  List<TicketCatData> _ticketCategoryList = [];
  List<PriorityData> _priorityList = [];
  List<ImageModel> imageList = [];
  int imagecount=0;

  @override
  void initState() {
    _presenter = TicketPresenter(this);
      _presenter.getTicketCategory(context);

    super.initState();
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
                              style: TextStyle(
                                  color: AppColors.red, fontSize: 16.0),
                            ),
                          ])),
                          SizedBox(
                            height: 5.0,
                          ),
                          DropdownButtonFormField<TicketCatData>(
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
                            onChanged: (TicketCatData value) {
                              setState(() {
                                _request.ticketCategoryId =
                                    value.ticketCategoryId;
                                _presenter.getPriority(
                                    context, value.ticketCategoryId);
                                print('Valuse....${value}');
                              });
                            },
                            hint: Text('Select Category'),
                            icon: new Image.asset(Images.DropIcon),
                            items:
                                //["feed back type"]
                                _ticketCategoryList
                                    .map((TicketCatData label) =>
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
                              text: 'Priority ',
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
                          DropdownButtonFormField<PriorityData>(
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
                            onChanged: (PriorityData value) {
                              setState(() {
                                // _request.caseTypeId=value.caseTypeId.toString();
                                print('Valuse....${value}');
                                _request.ticketPriorityId = value.ticPriorityId;
                              });
                            },
                            hint: Text('Select Priority'),
                            icon: new Image.asset(Images.DropIcon),
                            items:
                                //["feed back type"]
                                _priorityList
                                    .map((PriorityData label) =>
                                        DropdownMenuItem(
                                          child: Text('${label.priorityName}'),
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
                              placeHolderText: 'Enter Title',
                              errorMessage: 'Please Enter Title**',
                              inputType: InputType.EMAIL,
                              onTextChange: (value) {
                                _request.title = value;
                              },
                              text: widget?._data?.caseTitle ?? "",
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
                              initialValue:
                                  '${widget?._data?.caseDescription ?? ''}',
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
                                Text('Attach File'),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Icon(Icons.error)
                              ],
                            ),
                            onTap: () {
                              imageList.length<=5?
                              _modalBottomSheetMenu():
                              Utility.showErrorToast(context, 'Only 5 image can upload');
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          if (imageList.isNotEmpty)
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: imageList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 5.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: AppColors.grey),
                                      child: FittedBox(
                                          child: Text('${imageList[index].imageName}')),
                                    ),
                                    trailing: InkWell(
                                      child: Icon(Icons.cancel),
                                      onTap: () {
                                        imageList.remove(imageList[index]);
                                        setState(() {});
                                      },
                                    ),
                                  );
                                }),
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
               // Navigator.pop(context);
                Navigator.pushNamed(context, Screens.MyChat);
              },
            ),
          ),
          horizontalSpace(10.0),
          Expanded(
            child: RevButton(
              width: 55.0,
              text: widget?._data != null ? 'Update' : 'Save',
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
                                pickImage(ImageSource.camera,imageList.length);
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
                                pickImage(ImageSource.gallery,imageList.length);
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

  Future pickImage(ImageSource source,int count) async {
    final pickedFile = await picker.getImage(source: source, imageQuality: 80);
    imagecount=count;
    if (pickedFile != null) {
      _FileImage = File(pickedFile.path);

      String fileName1 = _FileImage.uri.pathSegments.last;
      imageList.add(ImageModel(fileName1, ''));
      _presenter.uploadImage(context, _FileImage);
      setState(() {});
      print('file path****${_FileImage}');
    }
  }

  @override
  onError(String message) {
    Utility.showErrorToast(context, message);
  }

  void addTicket() {
    _request.message = description;
    print('Request *** ${_request.toString()}');
  /*  if (imageList.length==1) {
      _request.image1 = imageList[0].imageUrl;
    } else if (imageList.length==2) {
      _request.image1 = imageList[0].imageUrl;
      _request.image2 = imageList[1].imageUrl;
    } else if (imageList.length==3) {
      _request.image1 = imageList[0].imageUrl;
      _request.image2 = imageList[1].imageUrl;
      _request.image3 = imageList[2].imageUrl;
    }else if (imageList.length==4) {
      _request.image1 = imageList[0].imageUrl;
      _request.image2 = imageList[1].imageUrl;
      _request.image3 = imageList[2].imageUrl;
      _request.image4 = imageList[3].imageUrl;
    } else if (imageList.length==5) {
      _request.image1 = imageList[0].imageUrl;
      _request.image2 = imageList[1].imageUrl;
      _request.image3 = imageList[2].imageUrl;
      _request.image4 = imageList[3].imageUrl;
      _request.image5 = imageList[4].imageUrl;
    }*/


    if (_request.ticketCategoryId == null) {
      Utility.showErrorToast(context, 'please select Ticket category ');
    } else if (_request.ticketPriorityId == null) {
      Utility.showErrorToast(context, 'please select priority');
    } else if (_request.title == null) {
      Utility.showErrorToast(context, 'please enter title');
    } else if (description.isEmpty) {
      Utility.showErrorToast(context, 'please enter description');
    } else {
      /*widget?._data!=null?
      //update
      _presenter.update(context, _request):
      _presenter.AddTicket(context,_request);*/
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

  @override
  void onUserByDepartmentFecthed(GetAllUser response) {
    empList.clear();
    empList.addAll(response.employeeData);
    setState(() {});
  }

  @override
  void onGetMyCaseFecthed(GetMyCaseResponse response) {}

  @override
  void onImageFecthed(UploadImageResponse response) {
      switch(imagecount)
      {
        case 0:
          _request.image1=response.data.fileurl;
          break;
        case 1:
          _request.image2=response.data.fileurl;
          break;
           case 2:
          _request.image3=response.data.fileurl;
          break;
           case 3:
          _request.image4=response.data.fileurl;
          break;
           case 4:
          _request.image5=response.data.fileurl;
          break;

      }
    setState(() {});
  }

  @override
  void onTicketPriorityFecthed(TicketPriorityResponse response) {
    _priorityList.clear();
    _priorityList.addAll(response.data);
    setState(() {

    });
  }

  @override
  void onTicketcateFecthed(TicketCategoryResponse response) {
    _ticketCategoryList.clear();
    _ticketCategoryList.addAll(response.data);
    setState(() {

    });
  }

  @override
  void onGetMyTicketFecthed(TicketResponse response) {
    // TODO: implement onGetMyTicketFecthed
  }
}
