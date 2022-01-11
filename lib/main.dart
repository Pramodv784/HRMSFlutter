import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hrms/api_provider/api_repository.dart';
import 'package:hrms/login_screen/home_screen.dart';


void main() {
  runApp(const MyApp());
}

ApiRepository repository = ApiRepository();
Dio dio = Dio();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen()
    );
  }
}

