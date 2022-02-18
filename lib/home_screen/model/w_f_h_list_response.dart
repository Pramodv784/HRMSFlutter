/// status : "OK"
/// message : "Work from home Request list Found"
/// workFromHomeList : [{"wfhId":4,"employeeId":38,"companyId":1,"orgId":1,"startDate":"2022-02-09T00:00:00","endDate":"2022-02-12T00:00:00","numberOfDays":"4","comment":"navinas request impo","notifyTo":"2","appliedBy":"Navina  Dhami","reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-09T19:08:32.947","updatedOn":null,"wfhStatus":"Pending"},{"wfhId":6,"employeeId":156,"companyId":1,"orgId":1,"startDate":"2022-02-09T13:00:00","endDate":"2022-02-17T13:00:00","numberOfDays":null,"comment":null,"notifyTo":"","appliedBy":"Lovely Sharma","reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-10T12:26:30.607","updatedOn":null,"wfhStatus":"Pending"},{"wfhId":8,"employeeId":156,"companyId":1,"orgId":1,"startDate":"2022-02-07T18:30:00","endDate":"2022-02-16T18:30:00","numberOfDays":null,"comment":null,"notifyTo":"","appliedBy":"Lovely Sharma","reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-11T10:55:33.033","updatedOn":null,"wfhStatus":"Approved"},{"wfhId":10,"employeeId":38,"companyId":1,"orgId":1,"startDate":"2022-02-10T00:00:00","endDate":"2022-02-26T00:00:00","numberOfDays":"17","comment":"specail occassion ","notifyTo":"","appliedBy":"Navina  Dhami","reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-11T16:43:57.363","updatedOn":null,"wfhStatus":"Pending"},{"wfhId":11,"employeeId":156,"companyId":1,"orgId":1,"startDate":"2022-02-11T18:30:00","endDate":"2022-02-27T18:30:00","numberOfDays":null,"comment":null,"notifyTo":"Ramakant  Gurjar","appliedBy":"Lovely Sharma","reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-15T10:39:44.253","updatedOn":null,"wfhStatus":"Pending"},{"wfhId":12,"employeeId":156,"companyId":1,"orgId":1,"startDate":"2022-02-14T18:30:00","endDate":"2022-02-23T18:30:00","numberOfDays":null,"comment":null,"notifyTo":"","appliedBy":"Lovely Sharma","reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-15T12:26:18.17","updatedOn":null,"wfhStatus":"Pending"},{"wfhId":13,"employeeId":156,"companyId":1,"orgId":1,"startDate":"2022-02-22T00:00:00","endDate":"2022-02-28T00:00:00","numberOfDays":null,"comment":null,"notifyTo":null,"appliedBy":null,"reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-15T14:27:34.277","updatedOn":null,"wfhStatus":null},{"wfhId":14,"employeeId":156,"companyId":1,"orgId":1,"startDate":"2022-02-16T18:30:00","endDate":"2022-02-23T18:30:00","numberOfDays":null,"comment":null,"notifyTo":"Govind  Chouksey","appliedBy":"Lovely Sharma","reason":"kyu batau bata duga","isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-16T10:04:24.157","updatedOn":null,"wfhStatus":"Pending"},{"wfhId":15,"employeeId":9831,"companyId":1,"orgId":1,"startDate":"2022-02-17T00:00:00","endDate":"2022-02-21T00:00:00","numberOfDays":"5","comment":"ainwai","notifyTo":"Devesh Rashinkar","appliedBy":"Devesh Rashnikar","reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-16T15:59:15.287","updatedOn":null,"wfhStatus":"Pending"},{"wfhId":18,"employeeId":156,"companyId":1,"orgId":1,"startDate":null,"endDate":null,"numberOfDays":"0","comment":null,"notifyTo":"","appliedBy":"Lovely Sharma","reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-16T16:16:10.797","updatedOn":null,"wfhStatus":"Pending"},{"wfhId":19,"employeeId":156,"companyId":1,"orgId":1,"startDate":"2022-02-17T00:00:00","endDate":"2022-02-24T00:00:00","numberOfDays":"8","comment":"per","notifyTo":"Govind  Chouksey","appliedBy":"Lovely Sharma","reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-16T16:37:02.147","updatedOn":null,"wfhStatus":"Approved"},{"wfhId":22,"employeeId":156,"companyId":1,"orgId":1,"startDate":"2022-02-25T00:00:00","endDate":"2022-02-28T00:00:00","numberOfDays":"4","comment":"test reason","notifyTo":"","appliedBy":"Lovely Sharma","reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-17T18:43:12.717","updatedOn":null,"wfhStatus":"Pending"},{"wfhId":23,"employeeId":156,"companyId":1,"orgId":1,"startDate":"2022-02-17T18:30:00","endDate":"2022-02-18T18:30:00","numberOfDays":null,"comment":null,"notifyTo":"Pradnya Bhosale","appliedBy":"Lovely Sharma","reason":null,"isActive":false,"isDeleted":false,"isApproved":false,"message":null,"createdOn":"2022-02-17T18:46:13.497","updatedOn":null,"wfhStatus":"Pending"}]

class WFHListResponse {
  WFHListResponse({
      String status, 
      String message, 
      List<WorkFromHomeList> workFromHomeList,}){
    _status = status;
    _message = message;
    _workFromHomeList = workFromHomeList;
}

  WFHListResponse.fromJson(dynamic json) {
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

/// wfhId : 4
/// employeeId : 38
/// companyId : 1
/// orgId : 1
/// startDate : "2022-02-09T00:00:00"
/// endDate : "2022-02-12T00:00:00"
/// numberOfDays : "4"
/// comment : "navinas request impo"
/// notifyTo : "2"
/// appliedBy : "Navina  Dhami"
/// reason : null
/// isActive : false
/// isDeleted : false
/// isApproved : false
/// message : null
/// createdOn : "2022-02-09T19:08:32.947"
/// updatedOn : null
/// wfhStatus : "Pending"

class WorkFromHomeList {
  WorkFromHomeList({
      int wfhId, 
      int employeeId, 
      int companyId, 
      int orgId, 
      String startDate, 
      String endDate, 
      String numberOfDays, 
      String comment, 
      String notifyTo, 
      String appliedBy, 
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
  String _startDate;
  String _endDate;
  String _numberOfDays;
  String _comment;
  String _notifyTo;
  String _appliedBy;
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
  String get startDate => _startDate;
  String get endDate => _endDate;
  String get numberOfDays => _numberOfDays;
  String get comment => _comment;
  String get notifyTo => _notifyTo;
  String get appliedBy => _appliedBy;
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