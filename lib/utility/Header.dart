import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';


import 'RevButton.dart';
import 'Utility.dart';

/// Created by Pratik Kataria on 04-03-2021.

class Header extends StatelessWidget {
  final String headerText;
  final EdgeInsets padding;
  final Widget rightWidget;
  final Widget leftWidget;
  final VoidCallback onBackPressed;
  final bool isBackButtonDisable;


  Header(
      {this.headerText,
      this.padding,
      this.rightWidget,
      this.onBackPressed,
      this.leftWidget,
      this.isBackButtonDisable});

  @override
  Widget build(BuildContext context) {
    return Container(
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
      //elevation: 10,
      color: AppColors.colorPrimary,
      child: Container(
        height: 50.0,
        padding: padding,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              leftWidget == null
                  ? RevButton(
                      width: 40.0,
                      height: 40.0,
                      color: Colors.transparent,
                      radius: 8.0,
                      borderColor: AppColors.colorPrimary,

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SvgPicture.asset(
                            Images.BackIcon,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      onTap: onBackPressed ??
                          () {
                            if (!(isBackButtonDisable ?? false)) Navigator.pop(context, true);
                          },
                    )
                  : leftWidget,
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 45.0,
                    child: Center(
                        child: Text(
                      '$headerText',
                      style: textStyleRegular16px600px,
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
              ),
              if (rightWidget != null) rightWidget,
              if (rightWidget == null) horizontalSpace(50.0)
            ],
          ),
        ),
      ),
    );
  }
}
