import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hrms/api_provider/api_repository.dart';
import 'package:hrms/home_screen/home_screen.dart';
import 'package:hrms/login_screen/login_screen.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/RouteTransition.dart';
import 'package:hrms/res/Screens.dart';
import 'package:provider/provider.dart';
import 'drawer/BaseProvider.dart';
import 'drawer/rev_drawer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

Dio dio = Dio();
ApiRepository repository = ApiRepository();

class MyApp extends StatefulWidget {
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          primarySwatch: Colors.amber),
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Screens.kHomeScreen:
            return RouteTransition(widget: const HomeScreen());
            break;
          case Screens.kBaseScreen:
            return RouteTransition(
              widget: ChangeNotifierProvider<BaseProvider>(
                create: (context) => BaseProvider(),
                child: RevDrawer(),
              ),
            );
            break;
          case Screens.kLoginScreen:
            return RouteTransition(
              widget: ChangeNotifierProvider<BaseProvider>(
                create: (context) => BaseProvider(),
                child: const LoginScreen(),
              ),
            );
            break;
        }
      },
      home: ChangeNotifierProvider<BaseProvider>(
        create: (context) => BaseProvider(),
       // child: RevDrawer(),
        child: LoginScreen(),
        // child: RevDrawer(),
      ),
    );
  }
}
