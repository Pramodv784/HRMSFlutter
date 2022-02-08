
import 'package:hrms/login_screen/model/login_response.dart';

class CurrentUser {
  LoginResponse _userCredentials;
  bool _isLoggedIn;
  int _userId;
  String  _userName;

  CurrentUser({
    LoginResponse userCredentials,
    bool isLoggedIn,
    int userId,
    String userName
  }) : _userCredentials = userCredentials,
        _userId=userId,
  _userName=userName,
        _isLoggedIn = isLoggedIn;
  bool get isLoggedIn => _isLoggedIn ?? false;
  int get userId => _userId ?? 0;


  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  LoginResponse get userCredentials => _userCredentials;
  factory CurrentUser.fromMap(Map<String, dynamic> map) {
    return CurrentUser(
        userCredentials: LoginResponse.fromJson(map['_userCredentials']),
        userId: map['_userId'],
        userName: map['_userName'],
        isLoggedIn: map['isLogin']);
  }
  Map<String, dynamic> toMap() {
    return {
      '_userCredentials': this.userCredentials?.toJson(),
      '_userId': this.userId,
      '_userName': this.userName,
      'isLogin': this.isLoggedIn,
    };
  }
  set userCredentials(LoginResponse value) {
    _userCredentials = value;
  }
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
  }
  set userId(int value) {
    _userId = value;
  }

}
