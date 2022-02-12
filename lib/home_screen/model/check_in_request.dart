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

class CheckInRequest {
  CheckInRequest({
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

  CheckInRequest.fromJson(dynamic json) {
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


  set employeeId(int value) {
    _employeeId = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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

  set date(String value) {
    _date = value;
  }

  set clockIn(String value) {
    _clockIn = value;
  }

  set clockOut(String value) {
    _clockOut = value;
  }

  set totalTime(String value) {
    _totalTime = value;
  }

  set comment(String value) {
    _comment = value;
  }

  set createdDate(String value) {
    _createdDate = value;
  }

  set modifiedDate(String value) {
    _modifiedDate = value;
  }

  set isActive(bool value) {
    _isActive = value;
  }

  set isDeleted(bool value) {
    _isDeleted = value;
  }

  set companyId(int value) {
    _companyId = value;
  }

  set orgId(int value) {
    _orgId = value;
  }
}