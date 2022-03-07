/// message : "Clock Out"
/// status : true
/// data : {"logId":37,"userName":"Lovely Sharma","isCheckIn":false,"clockInTime":"2022-03-02T11:17:56.047","clockOutTime":"2022-03-02T11:18:20.2125433+05:30","totalTime":"00:00:24","companyId":1,"orgId":1,"createdBy":156,"updatedBy":156,"deletedBy":null,"createdOn":"2022-03-02T00:00:00","updatedOn":"2022-03-02T00:00:00+05:30","deletedOn":null,"isActive":true,"isDeleted":false}

class CheckInOutResponse {
  CheckInOutResponse({
      String message, 
      bool status, 
      Data data,}){
    _message = message;
    _status = status;
    _data = data;
}

  CheckInOutResponse.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String _message;
  bool _status;
  Data _data;

  String get message => _message;
  bool get status => _status;
  Data get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data.toJson();
    }
    return map;
  }

}

/// logId : 37
/// userName : "Lovely Sharma"
/// isCheckIn : false
/// clockInTime : "2022-03-02T11:17:56.047"
/// clockOutTime : "2022-03-02T11:18:20.2125433+05:30"
/// totalTime : "00:00:24"
/// companyId : 1
/// orgId : 1
/// createdBy : 156
/// updatedBy : 156
/// deletedBy : null
/// createdOn : "2022-03-02T00:00:00"
/// updatedOn : "2022-03-02T00:00:00+05:30"
/// deletedOn : null
/// isActive : true
/// isDeleted : false

class Data {
  Data({
      int logId, 
      String userName, 
      bool isCheckIn, 
      String clockInTime, 
      String clockOutTime, 
      String totalTime, 
      int companyId, 
      int orgId, 
      int createdBy, 
      int updatedBy, 
      dynamic deletedBy, 
      String createdOn, 
      String updatedOn, 
      dynamic deletedOn, 
      bool isActive, 
      bool isDeleted,}){
    _logId = logId;
    _userName = userName;
    _isCheckIn = isCheckIn;
    _clockInTime = clockInTime;
    _clockOutTime = clockOutTime;
    _totalTime = totalTime;
    _companyId = companyId;
    _orgId = orgId;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _deletedBy = deletedBy;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
    _deletedOn = deletedOn;
    _isActive = isActive;
    _isDeleted = isDeleted;
}

  Data.fromJson(dynamic json) {
    _logId = json['logId'];
    _userName = json['userName'];
    _isCheckIn = json['isCheckIn'];
    _clockInTime = json['clockInTime'];
    _clockOutTime = json['clockOutTime'];
    _totalTime = json['totalTime'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
    _createdBy = json['createdBy'];
    _updatedBy = json['updatedBy'];
    _deletedBy = json['deletedBy'];
    _createdOn = json['createdOn'];
    _updatedOn = json['updatedOn'];
    _deletedOn = json['deletedOn'];
    _isActive = json['isActive'];
    _isDeleted = json['isDeleted'];
  }
  int _logId;
  String _userName;
  bool _isCheckIn;
  String _clockInTime;
  String _clockOutTime;
  String _totalTime;
  int _companyId;
  int _orgId;
  int _createdBy;
  int _updatedBy;
  dynamic _deletedBy;
  String _createdOn;
  String _updatedOn;
  dynamic _deletedOn;
  bool _isActive;
  bool _isDeleted;

  int get logId => _logId;
  String get userName => _userName;
  bool get isCheckIn => _isCheckIn;
  String get clockInTime => _clockInTime;
  String get clockOutTime => _clockOutTime;
  String get totalTime => _totalTime;
  int get companyId => _companyId;
  int get orgId => _orgId;
  int get createdBy => _createdBy;
  int get updatedBy => _updatedBy;
  dynamic get deletedBy => _deletedBy;
  String get createdOn => _createdOn;
  String get updatedOn => _updatedOn;
  dynamic get deletedOn => _deletedOn;
  bool get isActive => _isActive;
  bool get isDeleted => _isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['logId'] = _logId;
    map['userName'] = _userName;
    map['isCheckIn'] = _isCheckIn;
    map['clockInTime'] = _clockInTime;
    map['clockOutTime'] = _clockOutTime;
    map['totalTime'] = _totalTime;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    map['createdBy'] = _createdBy;
    map['updatedBy'] = _updatedBy;
    map['deletedBy'] = _deletedBy;
    map['createdOn'] = _createdOn;
    map['updatedOn'] = _updatedOn;
    map['deletedOn'] = _deletedOn;
    map['isActive'] = _isActive;
    map['isDeleted'] = _isDeleted;
    return map;
  }

}