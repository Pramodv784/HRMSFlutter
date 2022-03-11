

import 'package:hrms/feedback/select_emp/model/employee_data.dart';

import 'model/LoginResponse.dart';





abstract class LoginView   {

  void onLoginFetch(LoginResponse response);
  void onError(String error);



}