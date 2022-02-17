/// status : "OK"
/// message : "Data Found"
/// empList : [{"employeeId":156,"fullName":"Lovely Sharma"}]

class TodayLeaveResponse {
  TodayLeaveResponse({
      String status, 
      String message, 
      List<EmpList> empList,}){
    _status = status;
    _message = message;
    _empList = empList;
}

  TodayLeaveResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['empList'] != null) {
      _empList = [];
      json['empList'].forEach((v) {
        _empList.add(EmpList.fromJson(v));
      });
    }
  }
  String _status;
  String _message;
  List<EmpList> _empList;

  String get status => _status;
  String get message => _message;
  List<EmpList> get empList => _empList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_empList != null) {
      map['empList'] = _empList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// employeeId : 156
/// fullName : "Lovely Sharma"

class EmpList {
  EmpList({
      int employeeId, 
      String fullName,}){
    _employeeId = employeeId;
    _fullName = fullName;
}

  EmpList.fromJson(dynamic json) {
    _employeeId = json['employeeId'];
    _fullName = json['fullName'];
  }
  int _employeeId;
  String _fullName;

  int get employeeId => _employeeId;
  String get fullName => _fullName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employeeId'] = _employeeId;
    map['fullName'] = _fullName;
    return map;
  }

}