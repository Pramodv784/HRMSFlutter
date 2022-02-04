
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hrms/profile/profile_presenter.dart';

import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:image_picker/image_picker.dart';
import 'model/profile_response.dart';
import 'model/upload_image_response.dart';
import 'profile_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>implements ProfileView {
  final picker = ImagePicker();
  ProfilePresenter _presenter;
  File _FileImage;
  ProfileResponse _response;

  @override
  void initState() {
  _presenter=ProfilePresenter(this);
  getuserId();
    super.initState();
  }
  void getuserId() async{
    var userData = await (AuthUser.getInstance()).getCurrentUser();
    _presenter.getProfile(context,userData.userId);

    print('login Data****${AuthUser.getInstance().getCurrentUser().toString()}');



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(children: [
            Header(
              headerText: 'Profile',
            ),
            Expanded(
              child: ListView(
                children: [
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
                          Container(
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                '-Personal Information',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )),
                          Row(
                            children: [
                              _FileImage == null
                                  ? Image.asset(Images.ProfileUserIcon)
                                  : Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        image: DecorationImage(
                                          image: FileImage(_FileImage),
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      RevButton(
                                        height: 30.0,
                                        text: 'Upload  profile Picture',
                                        textStyle: textStyleWhite14px600w,
                                        color: AppColors.colorPrimary,
                                        borderColor: AppColors.colorPrimary,
                                        radius: 50.0,
                                        padding: EdgeInsets.all(3.0),
                                        onTap: () {
                                          _modalBottomSheetMenu();
                                        },
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      RevButton(
                                        height: 30.0,
                                        text: 'Delete',
                                        textStyle: textStyleDark16px600w,
                                        color: AppColors.white,
                                        borderColor: AppColors.colorPrimary,
                                        radius: 50.0,
                                        onTap: () async {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('First name',
                                          style: TextStyle(fontSize: 15)),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Lovely',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.SubText),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text('Gender',
                                          style: TextStyle(fontSize: 15)),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        'Female ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.SubText),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Last name      ',
                                          style: TextStyle(fontSize: 15)),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text('sharma  ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.SubText),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text('Mobile number',
                                          style: TextStyle(fontSize: 15)),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      InkWell(
                                        child: Text('+91 9876543210',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.SubText)),
                                        onTap: () {
                                          // _showDatePicker(context,1);
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('E-mail  ',
                                    style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'lsharma@moreyeas.com',
                                  style: TextStyle(
                                      fontSize: 15, color: AppColors.SubText),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('Address', style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  height: 5.0,
                                ),
                                InkWell(
                                  child: Text(
                                    '111, exp street, exp nagar, Indore, MP ',
                                    style: TextStyle(
                                        fontSize: 15, color: AppColors.SubText),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1.0,
                            color: AppColors.grey,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                          ),
                          Container(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                '-Official Details',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Designation',
                                          style: TextStyle(fontSize: 15)),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      InkWell(
                                        child: Text(
                                          'Human Resource Manager',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.SubText),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        onTap: () {},
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text('Joining date',
                                          style: TextStyle(fontSize: 15)),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      InkWell(
                                        child: Text(
                                          '22 Jan 2016',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.SubText),
                                        ),
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Company name',
                                          style: TextStyle(fontSize: 15)),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      InkWell(
                                        child: Text(
                                          'MoreYeahs IT Technologies Pvt Ltd',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.SubText),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        onTap: () {
                                          // _showDatePicker(context,1);
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RevButton(
                            height: 44.0,
                            text: 'Change Password',
                            textStyle: textStyleWhite14px600w,
                            color: AppColors.colorPrimary,
                            borderColor: AppColors.colorPrimary,
                            radius: 50.0,
                            padding: EdgeInsets.all(8.0),
                            onTap: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
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
  void onImageUpload(UploadImageResponse response) {
    print('Response **** ${response}');
    // TODO: implement onImageUpload
  }

  @override
  void onProfileFetch(ProfileResponse response) {
    print('Profile ****** ${_response.firstName}');
    _response=response;
    setState(() {

    });
  }
  
}
