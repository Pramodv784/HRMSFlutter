/// status : "OK"
/// message : "WFH Request list Found"
/// workFromHomeList : [{"wfhId":1,"employeeId":0,"companyId":0,"orgId":0,"startDate":null,"endDate":null,"numberOfDays":"5","comment":"Personal Reason","notifyTo":null,"appliedBy":null,"reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-08T17:57:28.767","updatedOn":null,"wfhStatus":"Pending"},{"wfhId":2,"employeeId":0,"companyId":0,"orgId":0,"startDate":null,"endDate":"2022-02-08T00:00:00","numberOfDays":"4","comment":"Personal Reason","notifyTo":null,"appliedBy":null,"reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-08T17:59:49.893","updatedOn":null,"wfhStatus":"Pending"}]

class GetWorkFromListResponse {
  GetWorkFromListResponse({
      String status, 
      String message, 
      List<WorkFromHomeList> workFromHomeList,}){
    _status = status;
    _message = message;
    _workFromHomeList = workFromHomeList;
}

  GetWorkFromListResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['workFromHomeList'] != null) {
      _workFromHomeList = [];
      json['workFromHomeList'].forEach((v) {
        _workFromHomeList.add(WorkFromHomeList.fromJson(v));
      });
    }
  }
  String _status;
  String _message;
  List<WorkFromHomeList> _workFromHomeList;

  String get status => _status;
  String get message => _message;
  List<WorkFromHomeList> get workFromHomeList => _workFromHomeList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_workFromHomeList != null) {
      map['workFromHomeList'] = _workFromHomeList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// wfhId : 1
/// employeeId : 0
/// companyId : 0
/// orgId : 0
/// startDate : null
/// endDate : null
/// numberOfDays : "5"
/// comment : "Personal Reason"
/// notifyTo : null
/// appliedBy : null
/// reason : null
/// isActive : false
/// isDeleted : false
/// isApproved : false
/// message : null
/// createdOn : "2022-02-08T17:57:28.767"
/// updatedOn : null
/// wfhStatus : "Pending"

class WorkFromHomeList {
  WorkFromHomeList({
      int wfhId, 
      int employeeId, 
      int companyId, 
      int orgId, 
      dynamic startDate, 
      dynamic endDate, 
      String numberOfDays, 
      String comment, 
      dynamic notifyTo, 
      dynamic appliedBy, 
      dynamic reason, 
      bool isActive, 
      bool isDeleted, 
      bool isApproved, 
      dynamic message, 
      String createdOn, 
      dynamic updatedOn, 
      String wfhStatus,}){
    _wfhId = wfhId;
    _employeeId = employeeId;
    _companyId = companyId;
    _orgId = orgId;
    _startDate = startDate;
    _endDate = endDate;
    _numberOfDays = numberOfDays;
    _comment = comment;
    _notifyTo = notifyTo;
    _appliedBy = appliedBy;
    _reason = reason;
    _isActive = isActive;
    _isDeleted = isDeleted;
    _isApproved = isApproved;
    _message = message;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
    _wfhStatus = wfhStatus;
}

  WorkFromHomeList.fromJson(dynamic json) {
    _wfhId = json['wfhId'];
    _employeeId = json['employeeId'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _numberOfDays = json['numberOfDays'];
    _comment = json['comment'];
    _notifyTo = json['notifyTo'];
    _appliedBy = json['appliedBy'];
    _reason = json['reason'];
    _isActive = json['isActive'];
    _isDeleted = json['isDeleted'];
    _isApproved = json['isApproved'];
    _message = json['message'];
    _createdOn = json['createdOn'];
    _updatedOn = json['updatedOn'];
    _wfhStatus = json['wfhStatus'];
  }
  int _wfhId;
  int _employeeId;
  int _companyId;
  int _orgId;
  dynamic _startDate;
  dynamic _endDate;
  String _numberOfDays;
  String _comment;
  dynamic _notifyTo;
  dynamic _appliedBy;
  dynamic _reason;
  bool _isActive;
  bool _isDeleted;
  bool _isApproved;
  dynamic _message;
  String _createdOn;
  dynamic _updatedOn;
  String _wfhStatus;

  int get wfhId => _wfhId;
  int get employeeId => _employeeId;
  int get companyId => _companyId;
  int get orgId => _orgId;
  dynamic get startDate => _startDate;
  dynamic get endDate => _endDate;
  String get numberOfDays => _numberOfDays;
  String get comment => _comment;
  dynamic get notifyTo => _notifyTo;
  dynamic get appliedBy => _appliedBy;
  dynamic get reason => _reason;
  bool get isActive => _isActive;
  bool get isDeleted => _isDeleted;
  bool get isApproved => _isApproved;
  dynamic get message => _message;
  String get createdOn => _createdOn;
  dynamic get updatedOn => _updatedOn;
  String get wfhStatus => _wfhStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wfhId'] = _wfhId;
    map['employeeId'] = _employeeId;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['numberOfDays'] = _numberOfDays;
    map['comment'] = _comment;
    map['notifyTo'] = _notifyTo;
    map['appliedBy'] = _appliedBy;
    map['reason'] = _reason;
    map['isActive'] = _isActive;
    map['isDeleted'] = _isDeleted;
    map['isApproved'] = _isApproved;
    map['message'] = _message;
    map['createdOn'] = _createdOn;
    map['updatedOn'] = _updatedOn;
    map['wfhStatus'] = _wfhStatus;
    return map;
  }

}