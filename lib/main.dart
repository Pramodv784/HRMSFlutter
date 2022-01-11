import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hrms/api_provider/api_repository.dart';
import 'package:hrms/login_screen/home_screen.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/RouteTransition.dart';
import 'package:hrms/res/Screens.dart';
import 'package:provider/provider.dart';

import 'home/drawer/BaseProvider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  final bool isLoggedIn;



  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<MyApp> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Demo',
        theme: ThemeData(scaffoldBackgroundColor: AppColors.white,primarySwatch: Colors.amber),
        onGenerateRoute: (RouteSettings settings)
        {
          switch(settings.name)
          {
            case Screens.kHomeScreen:
              return RouteTransition(widget:HomePage());
              break;
            case Screens.kBaseScreen:
              return RouteTransition(
                widget: ChangeNotifierProvider<BaseProvider>(
                  create: (context) => BaseProvider(),
                  child: RevDrawer(),
                ),
              );
              break;


          }
        },
        home:   ChangeNotifierProvider<BaseProvider>(
        create: (context) => BaseProvider(),
    child: RevDrawer(),
    )

    );
  }


}

