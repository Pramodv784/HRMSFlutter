import 'package:flutter/material.dart';
import 'package:hrms/asset/user_asset_list.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/utility/Header.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:hrms/utility/Utility.dart';

class EmployeeAsset extends StatefulWidget {
  const EmployeeAsset({Key key}) : super(key: key);

  @override
  _EmployeeAssetState createState() => _EmployeeAssetState();
}

class _EmployeeAssetState extends State<EmployeeAsset> {
  List<Widget> assetWidgetList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Header(
                    headerText: 'Emplyee assets',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Container(
                        height: 80.0,
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
                                text: 'Emplyee assets',
                                textStyle: textStyleDark16px600w,
                                color: AppColors.white,
                                radius: 50.0,
                                borderColor: AppColors.white,
                                onTap: () async {
                                  // opendDialog();
                                },
                              ),
                            ),
                            horizontalSpace(10.0),
                            Expanded(
                              child: RevButton(
                                width: 55.0,
                                text: 'Request Asset',
                                radius: 50.0,
                                borderColor: AppColors.colorPrimary,
                                textStyle: textStyleWhite14px600w,
                                onTap: () {
                                  // Navigator.pushNamed(context, Screens.AddFeedBack );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                alignment: Alignment.center,
                                color: AppColors.grey,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Asset Name',
                                      style: textStylePrimary12px500w,
                                    ),
                                    Text(
                                      'QTY',
                                      style: textStylePrimary12px500w,
                                    ),
                                    Text(
                                      'Status',
                                      style: textStylePrimary12px500w,
                                    ),
                                    Text(
                                      'Date',
                                      style: textStylePrimary12px500w,
                                    ),
                                  ],
                                ),
                              ),
                              //CardGoal(),

                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                              UserAssetList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
