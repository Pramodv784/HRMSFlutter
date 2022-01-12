import 'package:flutter/material.dart';
import 'package:hrms/home/drawer/BaseProvider.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/utility/RevButton.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BaseProvider>(builder: (_, baseprovider, __) {
      return Container(
       child: Column(
         children: [
           header(baseprovider),
         ],
       ),
      );
    });
  }
  Card header(BaseProvider baseProvider) {
    return
      Card(
        color: AppColors.black,
       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0))),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RevButton(
              width: 40.0,
              height: 40.0,
              radius: 8.0,
              color: AppColors.black,
              borderColor: AppColors.black,
              child: Center(
                child: Image.asset(Images.DrawerIcon, width: 32, height: 32, color: AppColors.white),
              ),
              onTap: () {
                if (baseProvider.isOpen)
                  baseProvider.close();
                else
                  baseProvider.open();
              },
            ),
            Image.asset(Images.LogoIcon, height: 52.0),
           /* RevButton(
              width: 40.0,
              color: AppColors.white,
              text: "",
              borderColor: AppColors.white,
            ),*/
            Image.asset(Images.UserIcon, height: 52.0),

          ],
        ),
      );
  }
}