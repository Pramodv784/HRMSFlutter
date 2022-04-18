import 'package:flutter/material.dart';
import 'package:hrms/res/Screens.dart';
class BaseProvider extends ChangeNotifier {
   String _currentScreen;
  String userName = "";

  double xoffSet = 0;
  double yoffSet = 0;
  double scaleFactor = 1;
  double sxoffSet = 0;
  double syoffSet = 0;
  double angle = 0;
  double sAngle = 0;

  bool isOpen = false;
  bool isPlaying = false;


  String get currentScreen =>   _currentScreen ?? Screens.kHomeScreen;

  set currentScreen(String value) {
    _currentScreen = value;
    notifyListeners();
  }

  void open() {
    xoffSet = 250;
    yoffSet = 80;
    angle = -0.2;
    scaleFactor = 1;
    isOpen = true;

    sxoffSet = 122;
    syoffSet = 110;
    sAngle = -0.275;

    notifyListeners();

  }

  void close() {
    xoffSet = 0;
    yoffSet = 0;
    angle = 0;
    scaleFactor = 1;
    isOpen = false;


    sxoffSet = 0;
    syoffSet = 0;
    sAngle = 0;
    notifyListeners();
  }
}
