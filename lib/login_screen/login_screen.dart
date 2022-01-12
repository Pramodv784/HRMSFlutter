import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrms/drawer/rev_drawer.dart';
import 'package:hrms/login_screen/bloc/login_bloc.dart';
import 'package:hrms/login_screen/bloc/login_event.dart';
import 'package:hrms/login_screen/bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc = LoginBloc();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc,
      child: BlocListener<LoginBloc, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            log("Login Response +++++++++++ " + state.response.message);
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> RevDrawer()));
            
          }
        },
        child: Scaffold(
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
                    child: const Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .80,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon:
                                Image.asset("assets/image/login_mail.png"),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 0.5),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 0.5),
                            ),
                            fillColor: const Color(0x00f8fbff),
                            filled: true),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .80,
                    child: const Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .80,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Image.asset("assets/image/login_show.png"),
                              Image.asset("assets/image/login_circle.png"),
                            ],
                          ),
                          hintText: "Password",
                          prefixIcon:
                              Image.asset("assets/image/login_mail.png"),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                          ),
                          fillColor: const Color(0x00f8fbff),
                          filled: true,
                        ),
                      ),
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
                      input["UserName"] = emailController.text;
                      input["Password"] = passwordController.text;

                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        loginBloc.add(UserLoginEvent(input: input));
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
        ),
      ),
    );
  }
}
