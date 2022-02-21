/// message : "Successfull"
/// status : true
/// attendance : {"id":2,"employeeId":156,"appliedBy":null,"date":"2022-02-21T13:53:28.413","clockIn":"01:53:28 PM","clockOut":null,"totalHours":0,"totalMinute":0,"comment":null,"isClock":true,"createdDate":"2022-02-21T13:53:28.413","modifiedDate":"2022-02-21T13:53:28.413","isActive":true,"isDeleted":false,"companyId":1,"orgId":1}

class GetMyAttendenceResponse {
  GetMyAttendenceResponse({
      String message, 
      bool status, 
      Attendance attendance,}){
    _message = message;
    _status = status;
    _attendance = attendance;
}

  GetMyAttendenceResponse.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _attendance = json['attendance'] != null ? Attendance.fromJson(json['attendance']) : null;
  }
  String _message;
  bool _status;
  Attendance _attendance;

  String get message => _message;
  bool get status => _status;
  Attendance get attendance => _attendance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_attendance != null) {
      map['attendance'] = _attendance.toJson();
    }
    return map;
  }

}

/// id : 2
/// employeeId : 156
/// appliedBy : null
/// date : "2022-02-21T13:53:28.413"
/// clockIn : "01:53:28 PM"
/// clockOut : null
/// totalHours : 0
/// totalMinute : 0
/// comment : null
/// isClock : true
/// createdDate : "2022-02-21T13:53:28.413"
/// modifiedDate : "2022-02-21T13:53:28.413"
/// isActive : true
/// isDeleted : false
/// companyId : 1
/// orgId : 1

class Attendance {
  Attendance({
      int id, 
      int employeeId, 
      dynamic appliedBy, 
      String date, 
      String clockIn, 
      dynamic clockOut, 
      int totalHours, 
      int totalMinute, 
      dynamic comment, 
      bool isClock, 
      String createdDate, 
      String modifiedDate, 
      bool isActive, 
      bool isDeleted, 
      int companyId, 
      int orgId,}){
    _id = id;
    _employeeId = employeeId;
    _appliedBy = appliedBy;
    _date = date;
    _clockIn = clockIn;
    _clockOut = clockOut;
    _totalHours = totalHours;
    _totalMinute = totalMinute;
    _comment = comment;
    _isClock = isClock;
    _createdDate = createdDate;
    _modifiedDate = modifiedDate;
    _isActive = isActive;
    _isDeleted = isDeleted;
    _companyId = companyId;
    _orgId = orgId;
}

  Attendance.fromJson(dynamic json) {
    _id = json['id'];
    _employeeId = json['employeeId'];
    _appliedBy = json['appliedBy'];
    _date = json['date'];
    _clockIn = json['clockIn'];
    _clockOut = json['clockOut'];
    _totalHours = json['totalHours'];
    _totalMinute = json['totalMinute'];
    _comment = json['comment'];
    _isClock = json['isClock'];
    _createdDate = json['createdDate'];
    _modifiedDate = json['modifiedDate'];
    _isActive = json['isActive'];
    _isDeleted = json['isDeleted'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
  }
  int _id;
  int _employeeId;
  dynamic _appliedBy;
  String _date;
  String _clockIn;
  dynamic _clockOut;
  int _totalHours;
  int _totalMinute;
  dynamic _comment;
  bool _isClock;
  String _createdDate;
  String _modifiedDate;
  bool _isActive;
  bool _isDeleted;
  int _companyId;
  int _orgId;

  int get id => _id;
  int get employeeId => _employeeId;
  dynamic get appliedBy => _appliedBy;
  String get date => _date;
  String get clockIn => _clockIn;
  dynamic get clockOut => _clockOut;
  int get totalHours => _totalHours;
  int get totalMinute => _totalMinute;
  dynamic get comment => _comment;
  bool get isClock => _isClock;
  String get createdDate => _createdDate;
  String get modifiedDate => _modifiedDate;
  bool get isActive => _isActive;
  bool get isDeleted => _isDeleted;
  int get companyId => _companyId;
  int get orgId => _orgId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['employeeId'] = _employeeId;
    map['appliedBy'] = _appliedBy;
    map['date'] = _date;
    map['clockIn'] = _clockIn;
    map['clockOut'] = _clockOut;
    map['totalHours'] = _totalHours;
    map['totalMinute'] = _totalMinute;
    map['comment'] = _comment;
    map['isClock'] = _isClock;
    map['createdDate'] = _createdDate;
    map['modifiedDate'] = _modifiedDate;
    map['isActive'] = _isActive;
    map['isDeleted'] = _isDeleted;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    return map;
  }

}