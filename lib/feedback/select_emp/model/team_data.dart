/// teamDatas : [{"employeeId":180,"fullName":"Ajay Baheti","roleId":0,"roleType":null},{"employeeId":51,"fullName":"Chaitanya  Kardile","roleId":0,"roleType":null},{"employeeId":43,"fullName":"Nilesh  Vyas","roleId":0,"roleType":null},{"employeeId":73,"fullName":"Rohit Jain","roleId":0,"roleType":null},{"employeeId":19,"fullName":"Vanshaj  Upadhyay","roleId":0,"roleType":null},{"employeeId":157,"fullName":"Yashobhit  Singh Bhadoriya","roleId":0,"roleType":null}]

class TeamData {
  TeamData({
      List<TeamDatas> teamDatas,}){
    _teamDatas = teamDatas;
}

  TeamData.fromJson(dynamic json) {
    if (json['teamDatas'] != null) {
      _teamDatas = [];
      json['teamDatas'].forEach((v) {
        _teamDatas.add(TeamDatas.fromJson(v));
      });
    }
  }
  List<TeamDatas> _teamDatas;

  List<TeamDatas> get teamDatas => _teamDatas;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_teamDatas != null) {
      map['teamDatas'] = _teamDatas.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// employeeId : 180
/// fullName : "Ajay Baheti"
/// roleId : 0
/// roleType : null

class TeamDatas {
  TeamDatas({
      int employeeId, 
      String fullName, 
      int roleId, 
      dynamic roleType,}){
    _employeeId = employeeId;
    _fullName = fullName;
    _roleId = roleId;
    _roleType = roleType;
}

  TeamDatas.fromJson(dynamic json) {
    _employeeId = json['employeeId'];
    _fullName = json['fullName'];
    _roleId = json['roleId'];
    _roleType = json['roleType'];
  }
  int _employeeId;
  String _fullName;
  int _roleId;
  dynamic _roleType;

  int get employeeId => _employeeId;
  String get fullName => _fullName;
  int get roleId => _roleId;
  dynamic get roleType => _roleType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employeeId'] = _employeeId;
    map['fullName'] = _fullName;
    map['roleId'] = _roleId;
    map['roleType'] = _roleType;
    return map;
  }

}