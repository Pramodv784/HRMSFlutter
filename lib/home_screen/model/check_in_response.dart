/// message : "Successful"
/// status : true
/// attendance : {"id":9,"employeeId":156,"date":"2022-11-02T00:00:00","clockIn":"09:30","clockOut":"07:00","totalTime":"09:30","comment":"XYZ","createdDate":"2022-02-11T11:14:19.9053886+05:30","modifiedDate":"2022-02-11T11:14:19.9053886+05:30","isActive":true,"isDeleted":false,"companyId":1,"orgId":1}

class CheckInResponse {
  CheckInResponse({
      String message, 
      bool status, 
      Attendance attendance,}){
    _message = message;
    _status = status;
    _attendance = attendance;
}

  CheckInResponse.fromJson(dynamic json) {
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

/// id : 9
/// employeeId : 156
/// date : "2022-11-02T00:00:00"
/// clockIn : "09:30"
/// clockOut : "07:00"
/// totalTime : "09:30"
/// comment : "XYZ"
/// createdDate : "2022-02-11T11:14:19.9053886+05:30"
/// modifiedDate : "2022-02-11T11:14:19.9053886+05:30"
/// isActive : true
/// isDeleted : false
/// companyId : 1
/// orgId : 1

class Attendance {
  Attendance({
      int id, 
      int employeeId, 
      String date, 
      String clockIn, 
      String clockOut, 
      String totalTime, 
      String comment, 
      String createdDate, 
      String modifiedDate, 
      bool isActive, 
      bool isDeleted, 
      int companyId, 
      int orgId,}){
    _id = id;
    _employeeId = employeeId;
    _date = date;
    _clockIn = clockIn;
    _clockOut = clockOut;
    _totalTime = totalTime;
    _comment = comment;
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
    _date = json['date'];
    _clockIn = json['clockIn'];
    _clockOut = json['clockOut'];
    _totalTime = json['totalTime'];
    _comment = json['comment'];
    _createdDate = json['createdDate'];
    _modifiedDate = json['modifiedDate'];
    _isActive = json['isActive'];
    _isDeleted = json['isDeleted'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
  }
  int _id;
  int _employeeId;
  String _date;
  String _clockIn;
  String _clockOut;
  String _totalTime;
  String _comment;
  String _createdDate;
  String _modifiedDate;
  bool _isActive;
  bool _isDeleted;
  int _companyId;
  int _orgId;

  int get id => _id;
  int get employeeId => _employeeId;
  String get date => _date;
  String get clockIn => _clockIn;
  String get clockOut => _clockOut;
  String get totalTime => _totalTime;
  String get comment => _comment;
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
    map['date'] = _date;
    map['clockIn'] = _clockIn;
    map['clockOut'] = _clockOut;
    map['totalTime'] = _totalTime;
    map['comment'] = _comment;
    map['createdDate'] = _createdDate;
    map['modifiedDate'] = _modifiedDate;
    map['isActive'] = _isActive;
    map['isDeleted'] = _isDeleted;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    return map;
  }

}