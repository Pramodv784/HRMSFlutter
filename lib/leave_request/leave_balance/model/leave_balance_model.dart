/// status : "OK"
/// message : "Leave Balance list Found"
/// leaveBalanceList : [{"id":154,"employeeId":156,"employeeCode":null,"monthYear":"2022-01-02T00:00:00","sickLeave":5,"paidLeave":8,"unpaidLeave":5,"floaterLeave":1,"specialLeave":2,"maternityLeave":72,"paternityLeave":0,"bereavementLeave":12,"casualLeave":7,"compOffs":0,"createdBy":1,"updatedBy":1,"createdOn":"2022-01-07T18:39:49.313","updatedOn":"2022-01-07T18:39:49.313","isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1}]

class LeaveBalanceModel {
  LeaveBalanceModel({
      String status, 
      String message, 
      List<LeaveBalanceList> leaveBalanceList,}){
    _status = status;
    _message = message;
    _leaveBalanceList = leaveBalanceList;
}

  LeaveBalanceModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['leaveBalanceList'] != null) {
      _leaveBalanceList = [];
      json['leaveBalanceList'].forEach((v) {
        _leaveBalanceList.add(LeaveBalanceList.fromJson(v));
      });
    }
  }
  String _status;
  String _message;
  List<LeaveBalanceList> _leaveBalanceList;

  String get status => _status;
  String get message => _message;
  List<LeaveBalanceList> get leaveBalanceList => _leaveBalanceList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_leaveBalanceList != null) {
      map['leaveBalanceList'] = _leaveBalanceList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 154
/// employeeId : 156
/// employeeCode : null
/// monthYear : "2022-01-02T00:00:00"
/// sickLeave : 5
/// paidLeave : 8
/// unpaidLeave : 5
/// floaterLeave : 1
/// specialLeave : 2
/// maternityLeave : 72
/// paternityLeave : 0
/// bereavementLeave : 12
/// casualLeave : 7
/// compOffs : 0
/// createdBy : 1
/// updatedBy : 1
/// createdOn : "2022-01-07T18:39:49.313"
/// updatedOn : "2022-01-07T18:39:49.313"
/// isActive : true
/// isDeleted : false
/// message : null
/// companyId : 1
/// orgId : 1

class LeaveBalanceList {
  LeaveBalanceList({
      int id, 
      int employeeId, 
      dynamic employeeCode, 
      String monthYear, 
      int sickLeave, 
      int paidLeave, 
      int unpaidLeave, 
      int floaterLeave, 
      int specialLeave, 
      int maternityLeave, 
      int paternityLeave, 
      int bereavementLeave, 
      int casualLeave, 
      int compOffs, 
      int createdBy, 
      int updatedBy, 
      String createdOn, 
      String updatedOn, 
      bool isActive, 
      bool isDeleted, 
      dynamic message, 
      int companyId, 
      int orgId,}){
    _id = id;
    _employeeId = employeeId;
    _employeeCode = employeeCode;
    _monthYear = monthYear;
    _sickLeave = sickLeave;
    _paidLeave = paidLeave;
    _unpaidLeave = unpaidLeave;
    _floaterLeave = floaterLeave;
    _specialLeave = specialLeave;
    _maternityLeave = maternityLeave;
    _paternityLeave = paternityLeave;
    _bereavementLeave = bereavementLeave;
    _casualLeave = casualLeave;
    _compOffs = compOffs;
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

  LeaveBalanceList.fromJson(dynamic json) {
    _id = json['id'];
    _employeeId = json['employeeId'];
    _employeeCode = json['employeeCode'];
    _monthYear = json['monthYear'];
    _sickLeave = json['sickLeave'];
    _paidLeave = json['paidLeave'];
    _unpaidLeave = json['unpaidLeave'];
    _floaterLeave = json['floaterLeave'];
    _specialLeave = json['specialLeave'];
    _maternityLeave = json['maternityLeave'];
    _paternityLeave = json['paternityLeave'];
    _bereavementLeave = json['bereavementLeave'];
    _casualLeave = json['casualLeave'];
    _compOffs = json['compOffs'];
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
  int _id;
  int _employeeId;
  dynamic _employeeCode;
  String _monthYear;
  int _sickLeave;
  int _paidLeave;
  int _unpaidLeave;
  int _floaterLeave;
  int _specialLeave;
  int _maternityLeave;
  int _paternityLeave;
  int _bereavementLeave;
  int _casualLeave;
  int _compOffs;
  int _createdBy;
  int _updatedBy;
  String _createdOn;
  String _updatedOn;
  bool _isActive;
  bool _isDeleted;
  dynamic _message;
  int _companyId;
  int _orgId;

  int get id => _id;
  int get employeeId => _employeeId;
  dynamic get employeeCode => _employeeCode;
  String get monthYear => _monthYear;
  int get sickLeave => _sickLeave;
  int get paidLeave => _paidLeave;
  int get unpaidLeave => _unpaidLeave;
  int get floaterLeave => _floaterLeave;
  int get specialLeave => _specialLeave;
  int get maternityLeave => _maternityLeave;
  int get paternityLeave => _paternityLeave;
  int get bereavementLeave => _bereavementLeave;
  int get casualLeave => _casualLeave;
  int get compOffs => _compOffs;
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
    map['id'] = _id;
    map['employeeId'] = _employeeId;
    map['employeeCode'] = _employeeCode;
    map['monthYear'] = _monthYear;
    map['sickLeave'] = _sickLeave;
    map['paidLeave'] = _paidLeave;
    map['unpaidLeave'] = _unpaidLeave;
    map['floaterLeave'] = _floaterLeave;
    map['specialLeave'] = _specialLeave;
    map['maternityLeave'] = _maternityLeave;
    map['paternityLeave'] = _paternityLeave;
    map['bereavementLeave'] = _bereavementLeave;
    map['casualLeave'] = _casualLeave;
    map['compOffs'] = _compOffs;
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