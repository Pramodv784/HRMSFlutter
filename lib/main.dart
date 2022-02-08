import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hrms/api_provider/api_repository.dart';
import 'package:hrms/attendence/attendance_dashboard.dart';
import 'package:hrms/common_page.dart';
import 'package:hrms/expense/employe_expense.dart';
import 'package:hrms/feedback_history/feedback_history_user_page.dart';
import 'package:hrms/home_screen/home_screen.dart';
import 'package:hrms/login_screen/login_screen.dart';
import 'package:hrms/profile/profile_page.dart';
import 'package:hrms/profile/profile_page.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/RouteTransition.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/ticket/chat_page.dart';

import 'package:hrms/user/AuthUser.dart';
import 'package:provider/provider.dart';
import 'add_leave_request/add_leave_request_page.dart';
import 'add_leave_request/add_leave_request_page2.dart';
import 'drawer/BaseProvider.dart';
import 'drawer/rev_drawer.dart';

import 'expense/employee_advances.dart';
import 'feedback/add_feedback.dart';
import 'feedback/empfeedback/emp_feed_back.dart';
import 'feedback/feedback_remark.dart';
import 'feedback/select_emp/select_emp.dart';
import 'feedback_history/feedback_history_page.dart';
import 'goal/GoalPage.dart';
import 'feedback_dashboard/feedback_dashboard_page.dart';
import 'leave_request/leave_balance/leave_balance_page.dart';
import 'leave_request/leave_request_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool authResult = await (AuthUser.getInstance()).isLoggedIn();
  Future.delayed(Duration(seconds: 2)).whenComplete(() => {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          // navigation bar color
          statusBarColor: AppColors.colorPrimary,
        )),
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
            primarySwatch: Colors.grey),
        // ignore: missing_return
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case Screens.kHomeScreen:
              return RouteTransition(widget: HomeScreen());
              break;
            case Screens.HomeScreen2:
              return RouteTransition(widget: FeedBackDashboardPage());
              break;
            case Screens.AddFeedBack:
              return RouteTransition(widget: SelectEmp());
              break;
            case Screens.AddEmpFeedRemark:
              return RouteTransition(
                  widget: FeedbackRemark(settings.arguments));
              break;
            case Screens.Profile:
              return RouteTransition(widget: ProfilePage());
              break;
            case Screens.GoalScreen:
              return RouteTransition(widget: GoalPage());
              break;
            case Screens.FeedbcakHistory:
              List<dynamic> args = settings.arguments;
              return RouteTransition(widget: FeedbackHistory(args[0]));
              break;

            case Screens.FeedbUserHistory:
              return RouteTransition(widget: FeedbackUserHistory());
              break;

            case Screens.LeaveRequestDashboard:
              return RouteTransition(widget: LeaveRequestDashboard());
              break;
            case Screens.LeaveBalancePage:
              return RouteTransition(widget: LeaveBalancePage());
              break;
            case Screens.AttendencePage:
              return RouteTransition(widget: AttendanceDasboard());
              break;

            case Screens.AddLeaveRequest:
              return RouteTransition(widget: AddLeaveRequest());
              break;
            case Screens.AddLeaveRequest2:
              return RouteTransition(widget: AddLeaveRequest2());
              break;
            case Screens.AddExpense:
              return RouteTransition(widget: EmployeeAdvances());
              break;
            case Screens.CommonPage:
              String title=settings.arguments;
              return RouteTransition(widget: CommonPage(title));
              break;

            case Screens.AddEmpFeedBack:
              List<dynamic> args = settings.arguments;
              return RouteTransition(widget: AddFeedback(args[0], args[1]));
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
              return RouteTransition(widget: LoginScreen());
              break;
          }
        },
        home:
        //checkAuthUser(widget?.isLoggedIn)
       ChatePage()
        //AddFeedback()
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
