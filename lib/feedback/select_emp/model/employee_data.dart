/// typeVMs : [{"teamTypeId":0,"teamLeadId":51,"teamName":"Ctaitanya Team","isActive":false,"isDeleted":false,"createdDate":"0001-01-01T00:00:00","updatedDate":"0001-01-01T00:00:00","teamMemberArray":null,"teamLeadName":null,"fullName":"Kajal Gupta","employeeId":142,"roleId":121},{"teamTypeId":0,"teamLeadId":51,"teamName":"Ctaitanya Team","isActive":false,"isDeleted":false,"createdDate":"0001-01-01T00:00:00","updatedDate":"0001-01-01T00:00:00","teamMemberArray":null,"teamLeadName":null,"fullName":"Aarya Garg","employeeId":162,"roleId":30},{"teamTypeId":0,"teamLeadId":51,"teamName":"Ctaitanya Team","isActive":false,"isDeleted":false,"createdDate":"0001-01-01T00:00:00","updatedDate":"0001-01-01T00:00:00","teamMemberArray":null,"teamLeadName":null,"fullName":"Bhagyashree Mukharjee","employeeId":220,"roleId":30}]

class EmployeeData {
  EmployeeData({
      List<TypeVMs> typeVMs,}){
    _typeVMs = typeVMs;
}

  EmployeeData.fromJson(dynamic json) {
    if (json['typeVMs'] != null) {
      _typeVMs = [];
      json['typeVMs'].forEach((v) {
        _typeVMs.add(TypeVMs.fromJson(v));
      });
    }
  }
  List<TypeVMs> _typeVMs;

  List<TypeVMs> get typeVMs => _typeVMs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_typeVMs != null) {
      map['typeVMs'] = _typeVMs.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// teamTypeId : 0
/// teamLeadId : 51
/// teamName : "Ctaitanya Team"
/// isActive : false
/// isDeleted : false
/// createdDate : "0001-01-01T00:00:00"
/// updatedDate : "0001-01-01T00:00:00"
/// teamMemberArray : null
/// teamLeadName : null
/// fullName : "Kajal Gupta"
/// employeeId : 142
/// roleId : 121

class TypeVMs {
  TypeVMs({
      int teamTypeId, 
      int teamLeadId, 
      String teamName, 
      bool isActive, 
      bool isDeleted, 
      String createdDate, 
      String updatedDate, 
      dynamic teamMemberArray, 
      dynamic teamLeadName, 
      String fullName, 
      int employeeId, 
      int roleId,}){
    _teamTypeId = teamTypeId;
    _teamLeadId = teamLeadId;
    _teamName = teamName;
    _isActive = isActive;
    _isDeleted = isDeleted;
    _createdDate = createdDate;
    _updatedDate = updatedDate;
    _teamMemberArray = teamMemberArray;
    _teamLeadName = teamLeadName;
    _fullName = fullName;
    _employeeId = employeeId;
    _roleId = roleId;
}

  TypeVMs.fromJson(dynamic json) {
    _teamTypeId = json['teamTypeId'];
    _teamLeadId = json['teamLeadId'];
    _teamName = json['teamName'];
    _isActive = json['isActive'];
    _isDeleted = json['isDeleted'];
    _createdDate = json['createdDate'];
    _updatedDate = json['updatedDate'];
    _teamMemberArray = json['teamMemberArray'];
    _teamLeadName = json['teamLeadName'];
    _fullName = json['fullName'];
    _employeeId = json['employeeId'];
    _roleId = json['roleId'];
  }
  int _teamTypeId;
  int _teamLeadId;
  String _teamName;
  bool _isActive;
  bool _isDeleted;
  String _createdDate;
  String _updatedDate;
  dynamic _teamMemberArray;
  dynamic _teamLeadName;
  String _fullName;
  int _employeeId;
  int _roleId;

  int get teamTypeId => _teamTypeId;
  int get teamLeadId => _teamLeadId;
  String get teamName => _teamName;
  bool get isActive => _isActive;
  bool get isDeleted => _isDeleted;
  String get createdDate => _createdDate;
  String get updatedDate => _updatedDate;
  dynamic get teamMemberArray => _teamMemberArray;
  dynamic get teamLeadName => _teamLeadName;
  String get fullName => _fullName;
  int get employeeId => _employeeId;
  int get roleId => _roleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['teamTypeId'] = _teamTypeId;
    map['teamLeadId'] = _teamLeadId;
    map['teamName'] = _teamName;
    map['isActive'] = _isActive;
    map['isDeleted'] = _isDeleted;
    map['createdDate'] = _createdDate;
    map['updatedDate'] = _updatedDate;
    map['teamMemberArray'] = _teamMemberArray;
    map['teamLeadName'] = _teamLeadName;
    map['fullName'] = _fullName;
    map['employeeId'] = _employeeId;
    map['roleId'] = _roleId;
    return map;
  }

}