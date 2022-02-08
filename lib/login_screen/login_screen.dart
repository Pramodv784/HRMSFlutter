import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrms/drawer/rev_drawer.dart';

import 'package:hrms/login_screen/login_presenter.dart';
import 'package:hrms/login_screen/login_view.dart';
import 'package:hrms/login_screen/model/login_response.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/user/CurrentUser.dart';
import 'package:hrms/utility/Dialogs.dart';
import 'package:hrms/utility/InputField.dart';
import 'package:hrms/utility/Utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginView {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _password ="Moreyeahs@123";
  var _email ="abhandari@moreyeahs.co";
  LoginPresenter _presenter;

  @override
  void initState() {
  _presenter=LoginPresenter(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.28,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "assets/image/login_trangle.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: SizedBox(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Image.asset(
                            "assets/image/logo.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .80,
              child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Email ',
                        style: textStyleWhite12px400w,
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors.red, fontSize: 16.0),
                      ),
                    ])
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .80,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: InputField(
                    leftIcon: 'assets/image/ic_email.svg',
                    placeHolderText: 'Enter Email',
                    errorMessage: 'Please Enter Valid email',
                    text: 'abhandari@moreyeahs.co',
                    onTextChange: (String val) => _email = val,

                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .80,
                child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Password ',
                        style: textStyleWhite12px400w,
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors.red, fontSize: 16.0),
                      ),
                    ])
                ),
              ),
              SizedBox(height: 5.0,),
              SizedBox(
                width: MediaQuery.of(context).size.width * .80,


                child: InputField(
                  leftIcon: 'assets/image/ic_password.svg',
                  placeHolderText: 'Enter Password',
                  errorMessage: 'Please Enter Valid Password',
                  isPassword: true,
                  text: 'Moreyeahs@123',
                  rightIcon:  Images.PasswordEyeClose,
                  onTextChange: (String val) => _password = val,
                  inputType: InputType.PASSWORD,

                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .80,
                child: const Center(
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Map input = HashMap();
                  input["UserName"] = _email.toString();
                  input["Password"] = _password.toString();

                  if (_email.isNotEmpty &&
                      _password.isNotEmpty) {
                    _presenter.login(context, input);
                   // loginBloc.add(UserLoginEvent(input: input));
                  } else {
                    Fluttertoast.showToast(msg: "Fields cant't be empty");
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: const BorderSide(color: Colors.black87),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.black87),
                  fixedSize: MaterialStateProperty.all(
                    const Size(175, 30),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/image/login_y_cut.png",
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onLoginFetch(LoginResponse response) {
    log("Login Response +++++++++++ " + response.message);
    var currentUser = CurrentUser()..userCredentials = response;
    currentUser.isLoggedIn = true;
    currentUser.userId=response.userDataList[0].employeeId;
    currentUser.userName=response.userDataList[0].fullName;
    AuthUser.getInstance().login(currentUser);
    Navigator.of(context).pushNamedAndRemoveUntil(Screens.kBaseScreen, ModalRoute.withName('/'));
  }
}
