
import 'package:flutter/material.dart';


import 'package:hrms/res/Screens.dart';
import 'package:hrms/utility/Utility.dart';

import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:provider/provider.dart';


import 'BaseProvider.dart';


// ignore: must_be_immutable
class Base extends StatelessWidget {
  late Map<String, Widget> allDestinations;
  late BuildContext context;
  late BaseProvider provider;

  /*Base() {
    initState();
  }*/

 /* void initState() async {
    allDestinations = {
      Screens.kHomeScreen: HomePage(),
      Screens.kTotalCarWash: TotalCarWash(),
      Screens.AddLEAD: AddLead(),
    };
  }
*/
  @override
  Widget build(BuildContext context) {
    if (this.context == null) {
      this.context = context;
      provider = Provider.of<BaseProvider>(context);
      provider.addListener(onSideNavigationClicked);
    }
    return Consumer<BaseProvider>(builder: (_, baseProvider, __) {
      return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: baseProvider.xoffSet)
            .scale(baseProvider.scaleFactor, origin: Offset(0, Utility.screenHeight(context) / 2))
            .matrix4,
        duration: Duration(milliseconds: 250),
        child: WillPopScope(
            onWillPop: () {
              if (baseProvider.isOpen) baseProvider.close();
              if (baseProvider.currentScreen != Screens.kHomeScreen)
                baseProvider.currentScreen = Screens.kHomeScreen;
              return;
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(baseProvider.isOpen ? 12.0 :0.0),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                //bottomNavigationBar: RevBottomNavigation(),
                body: SafeArea(
                  child: IndexedStack(
                    index:
                    allDestinations.values.toList().indexOf(allDestinations[baseProvider.currentScreen]!!),
                    children: allDestinations.values.toList(),
                  ),
                ),
              ),
            )),
      );
    });
  }

  void onSideNavigationClicked() {
    if (Screens.kHomeScreen == provider.currentScreen ) {
      print(provider.currentScreen);
    }
  }
}
