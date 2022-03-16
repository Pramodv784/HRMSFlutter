import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrms/api_provider/api_repository.dart';

import 'package:hrms/attendence/attendance_dashboard.dart';
import 'package:hrms/common_page.dart';
import 'package:hrms/expense/expense_history.dart';
import 'package:hrms/feedback_history/feedback_history_user_page.dart';
import 'package:hrms/home_screen/home_screen.dart';
import 'package:hrms/leave_request/leave_balanace_history/balance_history_dashboard.dart';
import 'package:hrms/leave_request/leave_balanace_history/leave_history/leave_history_request.dart';
import 'package:hrms/login_screen/login_screen.dart';
import 'package:hrms/myteam/myteam_page.dart';
import 'package:hrms/profile/image_view_page.dart';
import 'package:hrms/profile/profile_page.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/RouteTransition.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/ticket/my_tickets_dashboard.dart';
import 'package:hrms/ticket/raise_ticket.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/workFromHome/work_from_home_page.dart';
import 'package:provider/provider.dart';

import 'add_leave_request/add_leave_request_page.dart';
import 'asset/employee_asset.dart';
import 'attendence/attendance_leave_request_detail.dart';
import 'drawer/BaseProvider.dart';
import 'drawer/rev_drawer.dart';
import 'employee/Employee_page.dart';
import 'employee/employee_detail.dart';
import 'expense/employee_advances.dart';
import 'feedback/add_feedback.dart';
import 'feedback/feedback_remark.dart';
import 'feedback/select_emp/select_emp.dart';
import 'feedback_dashboard/feedback_dashboard_page.dart';
import 'feedback_history/feedback_history_page.dart';
import 'goal/GoalPage.dart';
import 'holidays/holiday_page.dart';
import 'leave_request/leave_request_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool authResult = await (AuthUser.getInstance()).isLoggedIn();
  Future.delayed(Duration(seconds: 2)).whenComplete(() => {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
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
  String picture = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
        ThemeData(
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
            case Screens.ExpenseHistory:
              return RouteTransition(widget: ExpenseHistory());
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
               case Screens.EmpPage:
              return RouteTransition(widget: EmployeePage());
              break;
                case Screens.EmpDetail:
              return RouteTransition(widget: EmployeeDetail(settings.arguments));
              break;
            case Screens.WorkFromHomePageDetail:
              return RouteTransition(
                  widget: AttendanceLeaveRequestDetail(settings.arguments));
              break;
               case Screens.MyTeam:
              return RouteTransition(
                  widget: MyTeamPage());
              break;


            case Screens.LeaveHistory:
              return RouteTransition(widget: LeaveHistoryRequest());
              break;

            case Screens.FeedbcakHistory:
              List<dynamic> args = settings.arguments;
              return RouteTransition(widget: FeedbackHistory(args[0]));
              break;
            case Screens.ImageView:
              List<dynamic> args = settings.arguments;
              return RouteTransition(widget: ImageViewPage(args[0]));
              break;

            case Screens.FeedbUserHistory:
              return RouteTransition(widget: FeedbackUserHistory());
              break;
            case Screens.MyAsset:
              return RouteTransition(widget: EmployeeAsset());
              break;

            case Screens.LeaveRequestDashboard:
              return RouteTransition(widget: LeaveRequestDashboard());
              break;
            case Screens.LeaveBalancePage:
              return RouteTransition(widget: BalanceHistoryDashboard());
              break;
            case Screens.AttendencePage:
              return RouteTransition(widget: AttendanceDasboard());
              break;

            case Screens.AddLeaveRequest:
              return RouteTransition(widget: AddLeaveRequest());
              break;

            case Screens.AddExpense:
              return RouteTransition(widget: EmployeeAdvances());
              break;
            case Screens.RaiseTicket:
              return RouteTransition(widget: RaiseTicket());
              break;
            case Screens.TicketDashBoard:
              return RouteTransition(widget: MyTicketDashBoard());
              break;
            case Screens.WorkFromHomePage:
              return RouteTransition(widget: WorkFromHomePage());
              break;
                case Screens.HolidayPage:
              return RouteTransition(widget: HolidayPage());
              break;

            case Screens.CommonPage:
              String title = settings.arguments;
              return RouteTransition(widget: CommonPage(title));
              break;

            case Screens.AddEmpFeedBack:
              List<dynamic> args = settings.arguments;
              return RouteTransition(widget: AddFeedback(args[0], args[1],args[2]));
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
        checkAuthUser(widget?.isLoggedIn)
        //HolidayPage()

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
