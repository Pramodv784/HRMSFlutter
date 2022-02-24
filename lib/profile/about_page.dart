import 'package:flutter/material.dart';
import 'package:hrms/res/Fonts.dart';

import '../res/AppColors.dart';
import 'model/profile_response.dart';

class AboutPage extends StatefulWidget {
  List<ProfileResponse> profileList;
  AboutPage(this.profileList,{Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          child: ListView(
            children: [
              Text(
                'Primary Details',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('First name', style: TextStyle(fontSize: 15)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            widget?.profileList?.length > 0
                                ? '${widget.profileList[0]?.firstName ?? ""}'
                                : ''
                            '',
                            style: TextStyle(
                                fontSize: 15, color: AppColors.SubText),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Gender', style: TextStyle(fontSize: 15)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Female ',
                            style: TextStyle(
                                fontSize: 15, color: AppColors.SubText),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Marital Status',
                              style: TextStyle(fontSize: 15)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            widget?.profileList?.length > 0
                                ? '${widget?.profileList[0]?.maritalStatus ?? ""}'
                                : '',
                            style: TextStyle(
                                fontSize: 15, color: AppColors.SubText),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Last name      ',
                              style: TextStyle(fontSize: 15)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(widget?.profileList.length > 0
                              ? '${widget?.profileList[0]?.lastName ?? ""}'
                              : '',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.SubText),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Date of Birth',
                              style: TextStyle(fontSize: 15)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(widget?.profileList?.length > 0
                              ? '${widget?.profileList[0]?.dob ?? ""}'
                              : '',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.SubText)),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text('Physical handicapped',
                              style: TextStyle(fontSize: 15)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('No',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.SubText)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  height: 2.0,
                  color: AppColors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text('About',
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(
                            color: Colors.black,
                            width: 1.5,
                            style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Add your response',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 0.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Text('What I love about my job?',
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(
                            color: Colors.black,
                            width: 1.5,
                            style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Add your response',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 0.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Text('My interest and hobbies',
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(
                            color: Colors.black,
                            width: 1.5,
                            style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Add your response',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 0.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),

    );
  }
}
