import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/AppColors.dart';
import 'model/profile_response.dart';

class ProfileDetail extends StatefulWidget {
  List<ProfileResponse> profileList;

  ProfileDetail(this.profileList, {Key key}) : super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Personal Information',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              )),

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
                        widget.profileList.length > 0
                            ? '${widget.profileList[0]?.firstName ?? ""}'
                            : '',
                        style:
                            TextStyle(fontSize: 15, color: AppColors.SubText),
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
                        style:
                            TextStyle(fontSize: 15, color: AppColors.SubText),
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
                      Text('Last name      ', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('${widget.profileList[0]?.lastName ?? ""}  ',
                          style:
                              TextStyle(fontSize: 15, color: AppColors.SubText),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Mobile number', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        child: Text(
                            '${widget.profileList[0]?.emergencyNumber ?? ""}',
                            style: TextStyle(
                                fontSize: 15, color: AppColors.SubText)),
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
          Container(
            height: 1.0,
            color: AppColors.grey,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          ),
          Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Address',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Current Address', style: TextStyle(fontSize: 15)),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${widget.profileList[0]?.localAddress ?? ""}',
                  style: TextStyle(fontSize: 15, color: AppColors.SubText),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('PermanentAddress', style: TextStyle(fontSize: 15)),
                SizedBox(
                  height: 5.0,
                ),
                InkWell(
                  child: Text(
                    '${widget.profileList[0]?.permanentAddress ?? ""}',
                    style: TextStyle(fontSize: 15, color: AppColors.SubText),
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
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          ),

          Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Contact Detail',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Work Email', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        widget.profileList.length > 0
                            ? '${widget.profileList[0]?.email ?? ""}'
                            : '',
                        style:
                            TextStyle(fontSize: 15, color: AppColors.SubText),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Mobile Number', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        widget.profileList.length > 0
                            ? '${widget.profileList[0]?.primaryContact ?? ""}'
                            : '',
                        style:
                            TextStyle(fontSize: 15, color: AppColors.SubText),
                      ),
                      SizedBox(height: 10.0,),
                      Text('Residence phone', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        widget.profileList.length > 0
                            ? '${widget.profileList[0]?.secondaryContact ?? ""}'
                            : '',
                        style:
                        TextStyle(fontSize: 15, color: AppColors.SubText),
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
                      Text('Personal Email', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('${widget.profileList[0]?.email ?? ""}  ',
                          style:
                              TextStyle(fontSize: 15, color: AppColors.SubText),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Work phone', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        child: Text(
                            '${widget.profileList[0]?.emergencyNumber ?? ""}',
                            style: TextStyle(
                                fontSize: 15, color: AppColors.SubText)),
                        onTap: () {
                          // _showDatePicker(context,1);
                        },
                      ),
                      SizedBox(height: 10.0,),
                      Text('Skype', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        child: Text(
                            '${widget.profileList[0]?.email ?? ""}',
                            style: TextStyle(
                                fontSize: 15, color: AppColors.SubText)),
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
          Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Relations',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Father', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        child: Text(
                          '${widget.profileList[0]?.fatherName ?? ""}',
                          style:
                              TextStyle(fontSize: 15, color: AppColors.SubText),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Husband', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        child: Text(
                          '',
                          style:
                              TextStyle(fontSize: 15, color: AppColors.SubText),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Mother', style: TextStyle(fontSize: 15)),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        child: Text(
                          '${widget.profileList[0]?.motherName ?? ""}',
                          style:
                              TextStyle(fontSize: 15, color: AppColors.SubText),
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
        ],
      ),
    );
  }
}
