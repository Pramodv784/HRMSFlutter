import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/utility/Utility.dart';

import 'package:provider/provider.dart';

import 'BaseProvider.dart';


class RevBottomNavigation extends StatelessWidget {
  String currentSelected = Screens.kHomeScreen;
  BaseProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<BaseProvider>(context, listen: false);
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Container(
        height: 70.0,
              child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navigationButton(Screens.kHomeScreen, Images.UserIcon, Images.UserIcon),
            navigationButton(Screens.kHomeScreen, Images.UserIcon, Images.UserIcon, context: context),
            navigationButton(Screens.kHomeScreen, Images.UserIcon, Images.UserIcon, context: context),

            // navigationButton(Screens.kProfileScreen, Images.kProfile, Images.kPersonFilled),
          ],
        ),
      ),
    );
  }

  navigationButton(String incomingScreen, String icon, String inActiveIcon, {BuildContext context}) {
    return Consumer<BaseProvider>(builder: (_, baseProver, __) {
      return InkWell(
        onTap: () {
          /*  if (incomingScreen == Screens.kCartScreen)
                Navigator.pushNamed(context, Screens.kCartScreen);
              else*/
          provider.currentScreen = incomingScreen;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                icon,
                color: provider.currentScreen == incomingScreen ? AppColors.colorPrimary : AppColors.lineColorGrey,
                width: 22.0,
                height: 22.0,
              ),
            ),
            verticalSpace(8.0),

            if(provider.currentScreen==incomingScreen)...[
              Text('$incomingScreen'
                  , style: textStyleWhite12px400w),
            ]
            else...[
              Text('$incomingScreen', style: textStyleWhiteUnSelect12px400w),
            ]

          ],
        ),
      );
    });
  }
}
