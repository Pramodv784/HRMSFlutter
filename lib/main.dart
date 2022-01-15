import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrms/add_feedback/AddFeedBack.dart';
import 'package:hrms/api_provider/api_repository.dart';
import 'package:hrms/home_screen/home_screen.dart';
import 'package:hrms/login_screen/login_screen.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/RouteTransition.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:provider/provider.dart';
import 'drawer/BaseProvider.dart';
import 'drawer/rev_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool authResult = await (AuthUser.getInstance()).isLoggedIn();
  Future.delayed(Duration(seconds: 2)).whenComplete(() => {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle( // navigation bar color
        statusBarColor: AppColors.colorPrimary, )),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]).then((value) => runApp(MyApp(isLoggedIn: authResult)))
  });

}

Dio dio = Dio();
ApiRepository repository = ApiRepository();

class MyApp extends StatefulWidget {
  final bool isLoggedIn;

  MyApp({this.isLoggedIn});
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
          case Screens.AddFeedBack:
            return RouteTransition(widget: const AddFeedBack());
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
            return RouteTransition(widget:LoginScreen());
            break;
        }
      },
      home: checkAuthUser(widget?.isLoggedIn)
    );
  }
  checkAuthUser(isLoggedIn) {
    if (isLoggedIn) {
      return ChangeNotifierProvider<BaseProvider>(
        create: (context) => BaseProvider(),
        child: RevDrawer(),
      );
    } else {
      return LoginScreen();
      //return ResetPasswordScreen(null);
    }
  }
}
