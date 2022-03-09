import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utility/Header.dart';
import 'model/employee_list_response.dart';

class EmployeeDetail extends StatefulWidget {
  EmployeeDataList _data;
  EmployeeDetail(this._data,{Key key}) : super(key: key);

  @override
  _EmployeeDetailState createState() => _EmployeeDetailState();
}

class _EmployeeDetailState extends State<EmployeeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(headerText: 'User Profile',),
            Expanded(child: ListView(
              children: [


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
                              Hero(
                                tag:'${widget._data.employeeId}',
                                child: ClipRRect(
                                  child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.0),
                                      color: AppColors.orange,
                                    ),
                                    child: Stack(children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(widget._data?.fullName!=null&& widget._data?.fullName!=''?
                                        '${widget._data?.fullName.substring(0, 1) + widget._data?.fullName.split(" ").last.substring(0, 1)}'.toUpperCase():'',
                                            style: TextStyle(color: AppColors.white,fontSize: 30.0)),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('${widget._data.fullName}'),
                                  Text('${widget._data.roleType}'),

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
                        ],
                      ),
                    ),
                  ),
                ),
            Padding(
            padding: const EdgeInsets.all(8.0),
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                    Text('${
                                        widget?._data?.firstName ?? ""}',
                                      style:
                                      TextStyle(fontSize: 15, color: AppColors.SubText),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                      SizedBox(height: 10.0,),
                                      Text('Marital Status', style: TextStyle(fontSize: 15)),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text('${
                                        widget?._data?.maritalStatus ?? ""}',
                                      style:
                                      TextStyle(fontSize: 15, color: AppColors.SubText),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
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
                                    Text('${widget._data?.lastName ?? ""}  ',
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
                                          '${widget._data?.emergencyNumber ?? ""}',
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
                                '${widget._data?.localAddress ?? ""}',
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
                                  '${widget._data?.permanentAddress ?? ""}',
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

                                      '${widget._data?.email ?? ""}',
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
                                      '${widget._data?.primaryContact ?? ""}'
                                      ,
                                      style:
                                      TextStyle(fontSize: 15, color: AppColors.SubText),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text('Residence phone', style: TextStyle(fontSize: 15)),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(

                                      '${widget._data?.secondaryContact ?? ""}'
                                      ,
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
                                    Text('${widget._data?.email ?? ""}  ',
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
                                          '${widget._data?.emergencyNumber ?? ""}',
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
                                          '${widget._data?.email ?? ""}',
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
                                        '${widget._data?.fatherName ?? ""}',
                                        style:
                                        TextStyle(fontSize: 15, color: AppColors.SubText),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
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
                                        '${widget._data?.motherName ?? ""}',
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
                  ))
            )],
        ),
      )
    ])
    ));
  }
  void CallNumber() async {
    if (await canLaunch('tel:${widget._data.primaryContact}')) {
      await launch('tel:${widget._data.primaryContact}');
    } else {
      throw 'could not launch';
    }
  }

  void sendMail() async {
    var url = 'mailto:${widget._data?.email}?subject=&body=';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void addressMap() async {
    var res = await MapsLauncher.launchQuery(widget._data.localAddress);
  }
}
