import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrms/login_screen/login_presenter.dart';
import 'package:hrms/login_screen/login_view.dart';
import 'package:hrms/res/AppColors.dart';
import 'package:hrms/res/Fonts.dart';
import 'package:hrms/res/Images.dart';
import 'package:hrms/res/Screens.dart';
import 'package:hrms/user/AuthUser.dart';
import 'package:hrms/user/CurrentUser.dart';
import 'package:hrms/utility/InputField.dart';
import 'package:hrms/utility/Utility.dart';

import 'model/LoginResponse.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginView {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _password = "";
  var _email = "";
  LoginPresenter _presenter;
  bool buttonColor=false;

  @override
  void initState() {
    _presenter = LoginPresenter(this);
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
                ])),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .80,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: InputField(
                    leftIcon: 'assets/image/ic_email.svg',
                    placeHolderText: 'Enter Email',
                    errorMessage: 'Please Enter Valid email',
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
                ])),
              ),
              SizedBox(
                height: 5.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .80,
                child: InputField(
                  leftIcon: 'assets/image/ic_password.svg',
                  placeHolderText: 'Enter Password',
                  errorMessage: 'Please Enter Valid Password',
                  isPassword: true,
                  rightIcon: Images.PasswordEyeClose,
                  onTextChange: (String val) {
                    _password = val;
                    if(val.length>0)
                      {
                        buttonColor=true;
                        setState(() {

                        });
                      }
                    else{
                      buttonColor=false;
                      setState(() {

                      });
                    }
                  },
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


                  if (_email.isEmpty) {
                    Utility.showErrorToast(context,"Please enter email");
                  }
                  else if (_password.isEmpty) {
                    Utility.showErrorToast(context,"Please enter password");
                  }
                 /* else if(!_email.contains('@')&&!_email.contains('.com')|| !_email.contains('.in'))
                    {
                      Utility.showErrorToast(context, 'Invalid email id');
                    }*/
                  else {
                    print('login press');
                    _presenter.login(context, input);
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side:  BorderSide(color: buttonColor?Colors.black87:Colors.black26),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(buttonColor?Colors.black87:Colors.black26),
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
    currentUser.userId = response.userId;
    currentUser.userName = response.fullName;

    AuthUser.getInstance().login(currentUser);
    AuthUser.getInstance().setEmail(_email.toString());
    AuthUser.getInstance().setPassword(_password.toString());
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Screens.kBaseScreen, ModalRoute.withName('/'));
  }

  @override
  void onError(String error) {
    print('error ** $error');
    Utility.showErrorToast(context, error);
    // TODO: implement onError
  }
}
