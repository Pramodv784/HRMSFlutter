
import 'package:hrms/login_screen/model/login_response.dart';

class CurrentUser {
  LoginResponse _userCredentials;
  bool _isLoggedIn;
  int _userId;

  CurrentUser({
    LoginResponse userCredentials,
    bool isLoggedIn,
    int userId,
  }) : _userCredentials = userCredentials,
        _userId=userId,
        _isLoggedIn = isLoggedIn;
  bool get isLoggedIn => _isLoggedIn ?? false;
  int get userId => _userId ?? 0;


  LoginResponse get userCredentials => _userCredentials;
  factory CurrentUser.fromMap(Map<String, dynamic> map) {
    return CurrentUser(
        userCredentials: LoginResponse.fromJson(map['_userCredentials']),
        userId: map['_userId'],
        isLoggedIn: map['isLogin']);
  }
  Map<String, dynamic> toMap() {
    return {
      '_userCredentials': this.userCredentials?.toJson(),
      '_userId': this.userId,
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
