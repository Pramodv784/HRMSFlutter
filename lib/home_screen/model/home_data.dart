/// status : "OK"
/// message : "menu list Found"
/// menuList : [{"menuId":1,"tittle":"Leave and attandance","menuIcon":"http://localhost:59822/MenuImage/ic_leaveatt.svg","companyId":1,"orgId":1},{"menuId":2,"tittle":"Covid-19 care","menuIcon":"http://localhost:59822/MenuImage/ic_covid.svg","companyId":1,"orgId":1},{"menuId":3,"tittle":"Payroll","menuIcon":"http://localhost:59822/MenuImage/ic_payroll.svg","companyId":1,"orgId":1},null]

class HomeData {
  HomeData({
      String status, 
      String message, 
      List<MenuList> menuList,}){
    _status = status;
    _message = message;
    _menuList = menuList;
}

  HomeData.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['menuList'] != null) {
      _menuList = [];
      json['menuList'].forEach((v) {
        _menuList.add(MenuList.fromJson(v));
      });
    }
  }
  String _status;
  String _message;
  List<MenuList> _menuList;

  String get status => _status;
  String get message => _message;
  List<MenuList> get menuList => _menuList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_menuList != null) {
      map['menuList'] = _menuList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// menuId : 1
/// tittle : "Leave and attandance"
/// menuIcon : "http://localhost:59822/MenuImage/ic_leaveatt.svg"
/// companyId : 1
/// orgId : 1

class MenuList {
  MenuList({
      int menuId, 
      String tittle, 
      String menuIcon, 
      int companyId, 
      int orgId,}){
    _menuId = menuId;
    _tittle = tittle;
    _menuIcon = menuIcon;
    _companyId = companyId;
    _orgId = orgId;
}

  MenuList.fromJson(dynamic json) {
    _menuId = json['menuId'];
    _tittle = json['tittle'];
    _menuIcon = json['menuIcon'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
  }
  int _menuId;
  String _tittle;
  String _menuIcon;
  int _companyId;
  int _orgId;

  int get menuId => _menuId;
  String get tittle => _tittle;
  String get menuIcon => _menuIcon;
  int get companyId => _companyId;
  int get orgId => _orgId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['menuId'] = _menuId;
    map['tittle'] = _tittle;
    map['menuIcon'] = _menuIcon;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    return map;
  }

}