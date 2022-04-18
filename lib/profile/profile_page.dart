import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms/leave_request/model/ProfileModel.dart';
import 'package:hrms/profile/model/skill_list_response.dart';
import 'package:hrms/profile/profile_detail_page.dart';
import 'package:hrms/profile/profile_presenter.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../res/Screens.dart';
import 'about_page.dart';
import 'employee_asset_page.dart';
import 'model/profile_response.dart';
import 'model/upload_image_response.dart';
import 'profile_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin
    implements ProfileView {
  final picker = ImagePicker();
  ProfilePresenter _presenter;
  File _FileImage;
  TabController _tabController;
  ProfileResponse _response;
  List<SkillData> skillList=[];


  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    _presenter = ProfilePresenter(this);
    _presenter.getSkill(context);
    getuserId();
    super.initState();
  }

  void getuserId() async {
    var userData = await (AuthUser.getInstance()).getCurrentUser();
    _presenter.getProfile(context, userData.userId);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child:_response!=null?
          Column(children: [
                  Header(
                    headerText: 'Profile',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 14.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.10),
                              blurRadius: 20.0,
                              spreadRadius: 5.0,
                              offset: const Offset(0, -6),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _FileImage == null
                                    ? _response?.profile==null
                                        ? Image.asset(Images.ProfileUserIcon)
                                        : InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, Screens.ImageView,
                                                  arguments: [
                                                    _response?.profile
                                                  ]);
                                            },
                                            child: Hero(
                                              tag: 'image',
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                child: Image.network(
                                                  _response?.profile,
                                                  height: 80,
                                                  width: 100,
                                                ),
                                              ),
                                            ),
                                          )
                                    : Container(
                                        height: 100,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          image: DecorationImage(
                                            image: FileImage(_FileImage),
                                            fit: BoxFit.fill,
                                          ),
                                        )),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${_response?.firstName} ${_response?.lastName}',
                                      style: textStyleRegular18pxW600,
                                    ),
                                    Text(
                                      '${_response?.roleType.toString()}',
                                      style: textStyleRegular12pxGrey,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              sendMail();
                                            },
                                            icon: const Icon(
                                              Icons.email,
                                              color: AppColors.greyNew,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              addressMap();
                                            },
                                            icon: const Icon(
                                              Icons.location_on,
                                              color: AppColors.greyNew,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              CallNumber();
                                            },
                                            icon: const Icon(
                                              Icons.call,
                                              color: AppColors.greyNew,
                                            )),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      const TextSpan(
                                          text: 'Department: ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.SubText)),
                                      TextSpan(
                                          text: _response?.roleType ?? "",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: AppColors.SubText))
                                    ])),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                  /*  RichText(
                                        text: const TextSpan(children: [
                                      TextSpan(
                                          text: 'Reporting to:',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.SubText)),
                                      TextSpan(
                                          text: ' Akhilesh Gandhi',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: AppColors.SubText))
                                    ])),*/
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: const TextSpan(children: [
                                      TextSpan(
                                          text: 'Business Unit: -',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.SubText)),
                                      TextSpan(
                                          text: '',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.SubText))
                                    ])),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                   /* RichText(
                                        text: const TextSpan(children: [
                                      TextSpan(
                                          text: 'Emp no.:',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.SubText)),
                                      TextSpan(
                                          text: '000',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: AppColors.SubText))
                                    ])),*/
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [
                          TabBar(
                            controller: _tabController,
                            isScrollable: true,
                            labelColor: AppColors.black,
                            indicatorSize: TabBarIndicatorSize.tab,
                            unselectedLabelColor: const Color(0xFF616576),
                            indicatorColor: AppColors.red,
                            tabs: const [
                              // first tab [you can add an icon using the icon property]
                              Tab(
                                child: Text(
                                  'About',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              // second tab [you can add an icon using the icon property]
                              Tab(
                                child: Text(
                                  'Profile',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Job',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Skill',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Assets',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                              child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                Container(
                                  color: AppColors.white,
                                  child: AboutPage(_response),
                                ),
                                Container(
                                  color: AppColors.white,
                                  child: ProfileDetail(_response),
                                ),
                                Container(
                                  color: AppColors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(5.0),
                                          child: const Text(
                                            'Job Details',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text('Employer number',
                                                      style: const TextStyle(
                                                          fontSize: 15)),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  InkWell(
                                                    child: Text(
                                                      '${_response.employeeTypeID ?? ""}',
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors
                                                              .SubText),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    onTap: () {},
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  const Text(
                                                      'Job title Primary',
                                                      style: TextStyle(
                                                          fontSize: 15)),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  InkWell(
                                                    child: const Text(
                                                      'HR-Manager',
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors
                                                              .SubText),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text('Date of Joining',
                                                      style: const TextStyle(
                                                          fontSize: 15)),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  InkWell(
                                                    child: Text(
                                                      '${_response.joiningDate ?? ""}',
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors
                                                              .SubText),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    onTap: () {
                                                      // _showDatePicker(context,1);
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  const Text(
                                                      'Job Title Secondary',
                                                      style: const TextStyle(
                                                          fontSize: 15)),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  InkWell(
                                                    child: const Text(
                                                      'HR-Head',
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color: AppColors
                                                              .SubText),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                    ],
                                  ),
                                ),
                                Container(

                                    child:_skillUI()
                                    ),
                                Container(
                                  color: AppColors.white,
                                  child: const EmployeeAssetPage(),
                                ),
                              ])),
                        ],
                      ),
                    ),
                  ))
                ]):Column(
            children: [],
          )

        ));
  }

  Widget _skillUI()
  {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          DropdownButtonFormField<SkillData>(
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
              onChanged: (SkillData value) {
                setState(() {
                  //_selected = value;

                });
              },
              hint: Text('Select skill'),
              icon: new Image.asset(Images.DropIcon),
              items: skillList != null
                  ? skillList
                  .map((SkillData label) =>
                  DropdownMenuItem(
                      child: Text(label.skillName),
                      value: label))
                  .toList()
                  : ['select skill']
                  .map((e) => DropdownMenuItem(
                child: Text(
                  e.toString(),
                ),
              ))),
          SizedBox(height: 10.0,),
          MaterialButton(onPressed: (){},child: Text('ADD',style: TextStyle(color: AppColors.white),),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          color: AppColors.red,)
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
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
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
                            const Text(
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
                            const Text(
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
    _response = response;
    print("Profile Response ****${response.toString()}");
    setState(() {});

  }



  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void CallNumber() async {
    if (await canLaunch('tel:${_response.primaryContact}')) {
      await launch('tel:${_response.primaryContact}');
    } else {
      throw 'could not launch';
    }
  }

  void sendMail() async {
    var url = 'mailto:${_response.email}?subject=&body=';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void addressMap() async {
    var res = await MapsLauncher.launchQuery(_response.localAddress);
  }

  @override
  onError(String message) {
    Utility.showErrorToast(context, message);
  }

  @override
  void onSkillFetch(SkillListResponse response) {
    print('data skill ***${response.message}');
    skillList.clear();
    skillList.addAll(response.data);
    setState(() {

    });
  }
}
