/// status : "OK"
/// message : "Leave Request list Found"
/// leaveRequestList : [{"leaveRequestId":9,"createdOn":"2022-02-18T12:41:47.513","startdate":"2022-02-19T00:00:00","leaveTypeId":2,"leaveType":"Unpaid Leave","endDate":"2022-02-25T00:00:00","appliedBy":"Lovely Sharma","employeeId":156,"notifyTo":"Ramakant  Gurjar,Govind  Chouksey","stateCode":null,"isApproved":false,"editLeaveRequest":null,"approvalByHr":false,"numberOfDays":7,"isDeleted":false,"leaveStatus":"Pending","comment":null,"companyId":1,"orgId":1},{"leaveRequestId":14,"createdOn":"2022-02-18T15:48:16.397","startdate":"2022-02-18T18:30:00","leaveTypeId":2,"leaveType":"Unpaid Leave","endDate":"2022-02-20T18:30:00","appliedBy":"Lovely Sharma","employeeId":156,"notifyTo":"Govind  Chouksey","stateCode":null,"isApproved":false,"editLeaveRequest":null,"approvalByHr":false,"numberOfDays":3,"isDeleted":false,"leaveStatus":null,"comment":null,"companyId":1,"orgId":1}]

class LeaveRequestHistoryResponse {
  LeaveRequestHistoryResponse({
      String status, 
      String message, 
      List<LeaveRequestList> leaveRequestList,}){
    _status = status;
    _message = message;
    _leaveRequestList = leaveRequestList;
}

  LeaveRequestHistoryResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['leaveRequestList'] != null) {
      _leaveRequestList = [];
      json['leaveRequestList'].forEach((v) {
        _leaveRequestList.add(LeaveRequestList.fromJson(v));
      });
    }
  }
  String _status;
  String _message;
  List<LeaveRequestList> _leaveRequestList;

  String get status => _status;
  String get message => _message;
  List<LeaveRequestList> get leaveRequestList => _leaveRequestList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_leaveRequestList != null) {
      map['leaveRequestList'] = _leaveRequestList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// leaveRequestId : 9
/// createdOn : "2022-02-18T12:41:47.513"
/// startdate : "2022-02-19T00:00:00"
/// leaveTypeId : 2
/// leaveType : "Unpaid Leave"
/// endDate : "2022-02-25T00:00:00"
/// appliedBy : "Lovely Sharma"
/// employeeId : 156
/// notifyTo : "Ramakant  Gurjar,Govind  Chouksey"
/// stateCode : null
/// isApproved : false
/// editLeaveRequest : null
/// approvalByHr : false
/// numberOfDays : 7
/// isDeleted : false
/// leaveStatus : "Pending"
/// comment : null
/// companyId : 1
/// orgId : 1

class LeaveRequestList {
  LeaveRequestList({
      int leaveRequestId, 
      String createdOn, 
      String startdate, 
      int leaveTypeId, 
      String leaveType, 
      String endDate, 
      String appliedBy, 
      int employeeId, 
      String notifyTo, 
      dynamic stateCode, 
      bool isApproved, 
      dynamic editLeaveRequest, 
      bool approvalByHr, 
      int numberOfDays, 
      bool isDeleted, 
      String leaveStatus, 
      dynamic comment, 
      int companyId, 
      int orgId,}){
    _leaveRequestId = leaveRequestId;
    _createdOn = createdOn;
    _startdate = startdate;
    _leaveTypeId = leaveTypeId;
    _leaveType = leaveType;
    _endDate = endDate;
    _appliedBy = appliedBy;
    _employeeId = employeeId;
    _notifyTo = notifyTo;
    _stateCode = stateCode;
    _isApproved = isApproved;
    _editLeaveRequest = editLeaveRequest;
    _approvalByHr = approvalByHr;
    _numberOfDays = numberOfDays;
    _isDeleted = isDeleted;
    _leaveStatus = leaveStatus;
    _comment = comment;
    _companyId = companyId;
    _orgId = orgId;
}

  LeaveRequestList.fromJson(dynamic json) {
    _leaveRequestId = json['leaveRequestId'];
    _createdOn = json['createdOn'];
    _startdate = json['startdate'];
    _leaveTypeId = json['leaveTypeId'];
    _leaveType = json['leaveType'];
    _endDate = json['endDate'];
    _appliedBy = json['appliedBy'];
    _employeeId = json['employeeId'];
    _notifyTo = json['notifyTo'];
    _stateCode = json['stateCode'];
    _isApproved = json['isApproved'];
    _editLeaveRequest = json['editLeaveRequest'];
    _approvalByHr = json['approvalByHr'];
    _numberOfDays = json['numberOfDays'];
    _isDeleted = json['isDeleted'];
    _leaveStatus = json['leaveStatus'];
    _comment = json['comment'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
  }
  int _leaveRequestId;
  String _createdOn;
  String _startdate;
  int _leaveTypeId;
  String _leaveType;
  String _endDate;
  String _appliedBy;
  int _employeeId;
  String _notifyTo;
  dynamic _stateCode;
  bool _isApproved;
  dynamic _editLeaveRequest;
  bool _approvalByHr;
  int _numberOfDays;
  bool _isDeleted;
  String _leaveStatus;
  dynamic _comment;
  int _companyId;
  int _orgId;

  int get leaveRequestId => _leaveRequestId;
  String get createdOn => _createdOn;
  String get startdate => _startdate;
  int get leaveTypeId => _leaveTypeId;
  String get leaveType => _leaveType;
  String get endDate => _endDate;
  String get appliedBy => _appliedBy;
  int get employeeId => _employeeId;
  String get notifyTo => _notifyTo;
  dynamic get stateCode => _stateCode;
  bool get isApproved => _isApproved;
  dynamic get editLeaveRequest => _editLeaveRequest;
  bool get approvalByHr => _approvalByHr;
  int get numberOfDays => _numberOfDays;
  bool get isDeleted => _isDeleted;
  String get leaveStatus => _leaveStatus;
  dynamic get comment => _comment;
  int get companyId => _companyId;
  int get orgId => _orgId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leaveRequestId'] = _leaveRequestId;
    map['createdOn'] = _createdOn;
    map['startdate'] = _startdate;
    map['leaveTypeId'] = _leaveTypeId;
    map['leaveType'] = _leaveType;
    map['endDate'] = _endDate;
    map['appliedBy'] = _appliedBy;
    map['employeeId'] = _employeeId;
    map['notifyTo'] = _notifyTo;
    map['stateCode'] = _stateCode;
    map['isApproved'] = _isApproved;
    map['editLeaveRequest'] = _editLeaveRequest;
    map['approvalByHr'] = _approvalByHr;
    map['numberOfDays'] = _numberOfDays;
    map['isDeleted'] = _isDeleted;
    map['leaveStatus'] = _leaveStatus;
    map['comment'] = _comment;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    return map;
  }

}