/// status : "OK"
/// message : "LeaveType list Found"
/// leaves : [{"leaveTypeId":1,"leavetype":"Paid Leave","createdBy":1,"updatedBy":1,"createdOn":"2022-01-17T00:00:00","updatedOn":"2022-01-17T00:00:00","isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1},{"leaveTypeId":3,"leavetype":"Unpaid Leave","createdBy":1,"updatedBy":1,"createdOn":"2022-01-15T00:00:00","updatedOn":"2022-01-15T00:00:00","isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1},{"leaveTypeId":4,"leavetype":"Sick Leave","createdBy":156,"updatedBy":156,"createdOn":"2022-01-17T17:58:48.65","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1},{"leaveTypeId":5,"leavetype":"Floater Leave","createdBy":156,"updatedBy":156,"createdOn":"2022-01-17T18:00:02.907","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1},{"leaveTypeId":6,"leavetype":"Special Leave","createdBy":156,"updatedBy":156,"createdOn":"2022-01-17T18:00:10.967","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1},{"leaveTypeId":7,"leavetype":"Floater Leave","createdBy":156,"updatedBy":156,"createdOn":"2022-01-17T18:00:25.71","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1},{"leaveTypeId":8,"leavetype":"Casual Leave","createdBy":156,"updatedBy":156,"createdOn":"2022-01-17T18:00:34.247","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1},{"leaveTypeId":9,"leavetype":"Maternity Leave","createdBy":156,"updatedBy":156,"createdOn":"2022-01-17T18:06:35.42","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1},{"leaveTypeId":10,"leavetype":"Paternity Leave","createdBy":156,"updatedBy":156,"createdOn":"2022-01-17T18:06:54.2","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1},{"leaveTypeId":1002,"leavetype":"Paid Leave","createdBy":0,"updatedBy":0,"createdOn":"2022-01-31T13:48:13.24","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":0,"orgId":0},{"leaveTypeId":1003,"leavetype":"Paid Leave","createdBy":0,"updatedBy":0,"createdOn":"2022-01-31T13:48:44.043","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":0,"orgId":0},{"leaveTypeId":1004,"leavetype":"Unpaid Leave","createdBy":0,"updatedBy":0,"createdOn":"2022-01-31T13:49:42.527","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":0,"orgId":0},{"leaveTypeId":1005,"leavetype":"Unpaid Leave","createdBy":0,"updatedBy":0,"createdOn":"2022-01-31T13:57:24.85","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":0,"orgId":0},{"leaveTypeId":1006,"leavetype":"Unpaid Leave","createdBy":0,"updatedBy":0,"createdOn":"2022-01-31T13:58:46.143","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":0,"orgId":0},{"leaveTypeId":1007,"leavetype":"Unpaid Leave","createdBy":0,"updatedBy":0,"createdOn":"2022-01-31T14:00:58.567","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":0,"orgId":0},{"leaveTypeId":1008,"leavetype":"paid Leave","createdBy":0,"updatedBy":0,"createdOn":"2022-01-31T14:25:23.63","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":0,"orgId":0},{"leaveTypeId":1009,"leavetype":"paid Leave","createdBy":156,"updatedBy":156,"createdOn":"2022-01-31T14:49:01.337","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1}]

class LeaveTypeResponse {
  LeaveTypeResponse({
      String status, 
      String message, 
      List<Leaves> leaves,}){
    _status = status;
    _message = message;
    _leaves = leaves;
}

  LeaveTypeResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['leaves'] != null) {
      _leaves = [];
      json['leaves'].forEach((v) {
        _leaves.add(Leaves.fromJson(v));
      });
    }
  }
  String _status;
  String _message;
  List<Leaves> _leaves;

  String get status => _status;
  String get message => _message;
  List<Leaves> get leaves => _leaves;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_leaves != null) {
      map['leaves'] = _leaves.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// leaveTypeId : 1
/// leavetype : "Paid Leave"
/// createdBy : 1
/// updatedBy : 1
/// createdOn : "2022-01-17T00:00:00"
/// updatedOn : "2022-01-17T00:00:00"
/// isActive : true
/// isDeleted : false
/// message : null
/// companyId : 1
/// orgId : 1

class Leaves {
  Leaves({
      int leaveTypeId, 
      String leavetype, 
      int createdBy, 
      int updatedBy, 
      String createdOn, 
      String updatedOn, 
      bool isActive, 
      bool isDeleted, 
      dynamic message, 
      int companyId, 
      int orgId,}){
    _leaveTypeId = leaveTypeId;
    _leavetype = leavetype;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
    _isActive = isActive;
    _isDeleted = isDeleted;
    _message = message;
    _companyId = companyId;
    _orgId = orgId;
}

  Leaves.fromJson(dynamic json) {
    _leaveTypeId = json['leaveTypeId'];
    _leavetype = json['leavetype'];
    _createdBy = json['createdBy'];
    _updatedBy = json['updatedBy'];
    _createdOn = json['createdOn'];
    _updatedOn = json['updatedOn'];
    _isActive = json['isActive'];
    _isDeleted = json['isDeleted'];
    _message = json['message'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
  }
  int _leaveTypeId;
  String _leavetype;
  int _createdBy;
  int _updatedBy;
  String _createdOn;
  String _updatedOn;
  bool _isActive;
  bool _isDeleted;
  dynamic _message;
  int _companyId;
  int _orgId;

  int get leaveTypeId => _leaveTypeId;
  String get leavetype => _leavetype;
  int get createdBy => _createdBy;
  int get updatedBy => _updatedBy;
  String get createdOn => _createdOn;
  String get updatedOn => _updatedOn;
  bool get isActive => _isActive;
  bool get isDeleted => _isDeleted;
  dynamic get message => _message;
  int get companyId => _companyId;
  int get orgId => _orgId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leaveTypeId'] = _leaveTypeId;
    map['leavetype'] = _leavetype;
    map['createdBy'] = _createdBy;
    map['updatedBy'] = _updatedBy;
    map['createdOn'] = _createdOn;
    map['updatedOn'] = _updatedOn;
    map['isActive'] = _isActive;
    map['isDeleted'] = _isDeleted;
    map['message'] = _message;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    return map;
  }

}