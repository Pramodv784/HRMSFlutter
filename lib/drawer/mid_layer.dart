import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/Utility.dart';
import 'package:provider/provider.dart';

import 'BaseProvider.dart';

// ignore: must_be_immutable
class MidLayer extends StatefulWidget {
  @override
  _MidLayerState createState() => _MidLayerState();
}

class _MidLayerState extends State<MidLayer> {
  // String currentSelectedScreen = Screens.kResetPasswordScreen;
  String firstName = "";
  String email = "";
  String picture = "";
  String lastName = "";
  String UserEmail = "";
  String UserPassword = "";

  BaseProvider _provider;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    init();
  }

  void init() async {
    Future.delayed(const Duration(seconds: 1), () async {
      var data = (await AuthUser.getInstance().getCurrentUser());
      firstName = data?.userName;
      picture = await AuthUser.getInstance().GetProfile();
      UserEmail = await AuthUser.getInstance().GetUserEmail();
      UserPassword = await AuthUser.getInstance().GetUserPass();

      print('UserEmail $UserEmail');
      print('UserPassWord $UserPassword');

      // Here you can write your code
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<BaseProvider>(context);
    return Container(
      color: AppColors.colorPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(30.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: picture == ""
                      ? Image.asset(
                          Images.LogoIcon,
                          height: 70,
                          width: 70,
                        )
                      : Image.network(
                          picture,
                          height: 70,
                          width: 70,
                        ),
                ),
                horizontalSpace(10.0),
                verticalSpace(10.0),
                SizedBox(
                  width: 120, // hard coding child width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("$firstName $lastName",
                          style: textStyleWhite14px500w),
                      // Text("$email", style: textStyleWhite14px400w2l),
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(40.0),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 30.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  drawerRowBuilder(Images.DashIcon, 'Dashboard',
                      context: context),
                  // verticalSpace(30.0),
                  // drawerRowBuilder(Images.kIconTestHistory, Screens.kScreenTestHistory, context: context),
                  verticalSpace(30.0),
                  drawerRowBuilder(Images.EmpIcon, 'Employee feedback',
                      context: context),
                  // verticalSpace(30.0),
                  // drawerRowBuilder(Images.kIconRateUs, Screens.kScreenRateUs, context: context),
                  verticalSpace(30.0),

                  drawerRowBuilder(Images.LogoutIcon, 'My Goals',
                      context: context),
                  verticalSpace(30.0),
                  drawerRowBuilder(Images.LogoutIcon, 'Leave Request',
                      context: context),
                  // verticalSpace(30.0),
                  // drawerRowBuilder(Images.kIconReferFriend, Screens.kScreenReferFriend, context: context),

                  verticalSpace(30.0),
                  drawerRowBuilder(Images.LogoutIcon, 'Add Feedback',
                      context: context),
                  verticalSpace(30.0),
                  drawerRowBuilder(Images.LogoutIcon, 'Logout',
                      context: context),
                  verticalSpace(30.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerRowBuilder(String iconRes, String screen,
      {BuildContext context}) {
    return InkWell(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          //change here don't //worked
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              iconRes,
              width: 24,
              height: 24,
              color: AppColors.white,
            ),
            horizontalSpace(12.0),
            Text(screen, style: textStyleWhite16px500w),

            //Image.asset(Images.ArrowIcon),
          ],
        ),
      ),
      onTap: () async {
        if (_provider.isOpen) _provider.close();
        await Future.delayed(Duration(milliseconds: 300));
        //_provider.currentScreen = ui;
        switch (screen) {
          /*  case Screens.kScreenTestHistory:
            _provider.currentScreen = ui;
            break;
          case Screens.kEditProfileScreen:
            var isUpdated = await Navigator.pushNamed(context, Screens.kEditProfileScreen) ;
            print("isUpdated ${isUpdated}");
            init();
            break;
          case Screens.kScreenTnc:
            Navigator.pushNamed(context, Screens.kScreenTnc);
            break;
          case "Contact Us":
            //  Navigator.pushNamed(context, Screens.kContactScreen);
            break;*/
          case "Employee feedback":
            //Navigator.pop(context);
            _provider.close();
            Navigator.pushNamed(context, Screens.FeedbUserHistory);
            break;
          case "My Goals":
            //Navigator.pop(context);
            _provider.close();
            Navigator.pushNamed(context, Screens.GoalScreen);
            break;
          case "Leave Request":
            //Navigator.pop(context);
            _provider.close();
            Navigator.pushNamed(context, Screens.LeaveRequestDashboard);
            break;

          case "Add Feedback":
            //Navigator.pop(context);
            _provider.close();
            Navigator.pushNamed(context, Screens.AddFeedBack);
            break;

          case "Logout":
            Dialogs.showCustomDialog(context, onAccept: () async {
              AuthUser.getInstance().logout();
              //RouteTransition(widget: LoginScreen());
              Navigator.pop(context);
              Navigator.pushNamed(context, Screens.kLoginScreen);
            }, onReject: () {
              Navigator.of(context).pop();
            }, title: 'Logout', message: 'Are you sure you want to log out ?');
            break;
        }
      },
    );
  }
}
