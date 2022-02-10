

import 'package:hrms/feedback/select_emp/model/employee_data.dart';
import 'package:hrms/login_screen/model/login_response.dart';





abstract class LoginView   {

  void onLoginFetch(LoginResponse response);
  void onError(String error);



}