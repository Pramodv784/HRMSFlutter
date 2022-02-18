import 'dart:convert';

import 'package:hrms/utility/Keys.dart';
import 'package:hrms/utility/SharedManager.dart';
import 'package:hrms/utility/Utility.dart';

import 'CurrentUser.dart';

class AuthUser {
  var tag = 'AuthUser';
  static AuthUser _instance = AuthUser.internal();

  AuthUser.internal();

  factory AuthUser() {
    return _instance;
  }

  static AuthUser getInstance() {
    if (_instance == null) {
      _instance = AuthUser.internal();
    }
    return _instance;
  }

  void loginUser(String response) {}

  Future<void> login(CurrentUser userModel) async {
    userModel.isLoggedIn = true;
    Utility.log("user", userModel.toMap());
    await SharedManager.setStringPreference(
        SharedPrefsKeys.kUserModel, json.encode(userModel.toMap()));
  }

  Future<void> saveToken(CurrentUser userModel) async {
    Utility.log("user", userModel.toMap());
    await SharedManager.setStringPreference(
        SharedPrefsKeys.kUserModel, json.encode(userModel.toMap()));
  }

  Future<void> updateUser(CurrentUser currentUser) async {
    await SharedManager.setStringPreference(
        SharedPrefsKeys.kUserModel, json.encode(currentUser.toMap()));
  }

  Future<CurrentUser> getCurrentUser() async {
    String userModel =
        await SharedManager.getStringPreference(SharedPrefsKeys.kUserModel);
    Utility.log('AuthUser current user', userModel);
    if (userModel.isNotEmpty) {
      CurrentUser user = CurrentUser.fromMap(jsonDecode(userModel));
      return user;
    }
    return null;
  }

  Future<bool> isLoggedIn() async {
    CurrentUser userModel = await getCurrentUser();
    if (userModel != null) {
      print('insize not null');
      Utility.log('check login', userModel.toMap());
      return userModel?.isLoggedIn ?? false;
    }
    return false;
  }

  Future<String> token() async {
    CurrentUser userModel = await getCurrentUser();
    var token = userModel?.userCredentials?.accesToken;
    print('token $token');
    return 'Bearer $token';
  }

  Future<void> SetProfilePic(String image) async {
    await SharedManager.setStringPreference(SharedPrefsKeys.kProfilePic, image);
  }

  Future<void> setEmail(String email) async {
    await SharedManager.setStringPreference(SharedPrefsKeys.kUserEmail, email);
  }

  Future<void> setPassword(String password) async {
    await SharedManager.setStringPreference(
        SharedPrefsKeys.kUserPass, password);
  }

  Future<String> GetProfile() async {
    String pic =
        await SharedManager.getStringPreference(SharedPrefsKeys.kProfilePic);
    print('picture $pic');
    return pic?.toString();
  }

  Future<String> GetUserEmail() async {
    String email =
        await SharedManager.getStringPreference(SharedPrefsKeys.kUserEmail);
    print('email $email');
    return email?.toString();
  }

  Future<String> GetUserPass() async {
    String password =
        await SharedManager.getStringPreference(SharedPrefsKeys.kUserPass);
    print('password $password');
    return password?.toString();
  }

  Future<void> logout() async {
    await SharedManager.setStringPreference(SharedPrefsKeys.kUserModel, "");
  }
}
