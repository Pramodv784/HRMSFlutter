/// EmployeeId : "156"
/// CompanyId : "2"
/// OrgId : "2"
/// Startdate : "2022-01-31"
/// EndDate : "2022-02-05"
/// NumberOfDays : "5"
/// LeaveTypeId : "2"
/// LeaveType : "Paid Leave"
/// NotifyTo : "Roopesh Mandloi"
/// AppliedBy : "Lovely Sharma"

class LeaveRequest {
  LeaveRequest({
      String employeeId, 
      String companyId, 
      String orgId, 
      String startdate, 
      String endDate, 
      String numberOfDays, 
      String leaveTypeId, 
      String leaveType, 
      String notifyTo,
      String comment,

      String appliedBy,}){
    _employeeId = employeeId;
    _companyId = companyId;
    _orgId = orgId;
    _startdate = startdate;
    _endDate = endDate;
    _numberOfDays = numberOfDays;
    _leaveTypeId = leaveTypeId;
    _leaveType = leaveType;
    _notifyTo = notifyTo;
    _appliedBy = appliedBy;
}

  LeaveRequest.fromJson(dynamic json) {
    _employeeId = json['EmployeeId'];
    _companyId = json['CompanyId'];
    _orgId = json['OrgId'];
    _startdate = json['Startdate'];
    _endDate = json['EndDate'];
    _numberOfDays = json['NumberOfDays'];
    _leaveTypeId = json['LeaveTypeId'];
    _leaveType = json['LeaveType'];
    _notifyTo = json['NotifyTo'];
    _appliedBy = json['AppliedBy'];
  }
  String _employeeId;
  String _companyId;
  String _orgId;
  String _startdate;
  String _endDate;
  String _numberOfDays;
  String _leaveTypeId;
  String _leaveType;
  String _notifyTo;
  String _appliedBy;
  String _comment;


  String get comment => _comment;

  set comment(String value) {
    _comment = value;
  }

  String get employeeId => _employeeId;
  String get companyId => _companyId;
  String get orgId => _orgId;
  String get startdate => _startdate;
  String get endDate => _endDate;
  String get numberOfDays => _numberOfDays;
  String get leaveTypeId => _leaveTypeId;
  String get leaveType => _leaveType;
  String get notifyTo => _notifyTo;
  String get appliedBy => _appliedBy;


  set employeeId(String value) {
    _employeeId = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['EmployeeId'] = _employeeId;
    map['CompanyId'] = _companyId;
    map['OrgId'] = _orgId;
    map['Startdate'] = _startdate;
    map['EndDate'] = _endDate;
    map['NumberOfDays'] = _numberOfDays;
    map['LeaveTypeId'] = _leaveTypeId;
    map['LeaveType'] = _leaveType;
    map['NotifyTo'] = _notifyTo;
    map['AppliedBy'] = _appliedBy;
    map['Comment'] = _comment;
    return map;
  }

  set companyId(String value) {
    _companyId = value;
  }

  set orgId(String value) {
    _orgId = value;
  }

  set startdate(String value) {
    _startdate = value;
  }

  set endDate(String value) {
    _endDate = value;
  }

  set numberOfDays(String value) {
    _numberOfDays = value;
  }

  set leaveTypeId(String value) {
    _leaveTypeId = value;
  }

  set leaveType(String value) {
    _leaveType = value;
  }

  set notifyTo(String value) {
    _notifyTo = value;
  }

  set appliedBy(String value) {
    _appliedBy = value;
  }
}