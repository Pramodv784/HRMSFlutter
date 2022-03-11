

import '../login_screen/model/LoginResponse.dart';

class CurrentUser {
  LoginResponse _userCredentials;
  bool _isLoggedIn;
  int _userId;
  String _userName;
  String _userProfilePic;
  CurrentUser(
      {LoginResponse userCredentials,
      bool isLoggedIn,
      int userId,
      String userName,
      String userProfilePic})
      : _userCredentials = userCredentials,
        _userId = userId,
        _userName = userName,
        _isLoggedIn = isLoggedIn,
        _userProfilePic = userProfilePic;
  bool get isLoggedIn => _isLoggedIn ?? false;
  int get userId => _userId ?? 0;
  String get userProfilePic => _userProfilePic;
  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  set userProfilePic(String value) {
    _userProfilePic = value;
  }

  LoginResponse get userCredentials => _userCredentials;
  factory CurrentUser.fromMap(Map<String, dynamic> map) {
    return CurrentUser(
        userCredentials: LoginResponse.fromJson(map['_userCredentials']),
        userId: map['_userId'],
        userName: map['_userName'],
        isLoggedIn: map['isLogin'],
        userProfilePic: map['_userProfilePic']);
  }
  Map<String, dynamic> toMap() {
    return {
      '_userCredentials': this.userCredentials?.toJson(),
      '_userId': this.userId,
      '_userName': this.userName,
      'isLogin': this.isLoggedIn,
      '_userProfilePic': this.userProfilePic
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
