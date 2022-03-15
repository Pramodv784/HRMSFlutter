/// message : "Employee List"
/// status : true
/// data : {"onLeave":[{"employeeId":156,"employeeName":"Lovely Sharma"}],"notOnLeave":null,"onTeam":[{"employeeId":156,"employeeName":"Lovely Sharma"},{"employeeId":9831,"employeeName":"Devesh Rashnikar"},{"employeeId":9840,"employeeName":"Altamash sk Shaikh"}]}

class GetMyTeamResposne {
  GetMyTeamResposne({
      String message, 
      bool status, 
      Data data,}){
    _message = message;
    _status = status;
    _data = data;
}

  GetMyTeamResposne.fromJson(dynamic json) {
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

/// onLeave : [{"employeeId":156,"employeeName":"Lovely Sharma"}]
/// notOnLeave : null
/// onTeam : [{"employeeId":156,"employeeName":"Lovely Sharma"},{"employeeId":9831,"employeeName":"Devesh Rashnikar"},{"employeeId":9840,"employeeName":"Altamash sk Shaikh"}]

class Data {
  Data({
      List<OnLeave> onLeave, 
      dynamic notOnLeave, 
      List<OnTeam> onTeam,}){
    _onLeave = onLeave;
    _notOnLeave = notOnLeave;
    _onTeam = onTeam;
}

  Data.fromJson(dynamic json) {
    if (json['onLeave'] != null) {
      _onLeave = [];
      json['onLeave'].forEach((v) {
        _onLeave.add(OnLeave.fromJson(v));
      });
    }
    _notOnLeave = json['notOnLeave'];
    if (json['onTeam'] != null) {
      _onTeam = [];
      json['onTeam'].forEach((v) {
        _onTeam.add(OnTeam.fromJson(v));
      });
    }
  }
  List<OnLeave> _onLeave;
  dynamic _notOnLeave;
  List<OnTeam> _onTeam;

  List<OnLeave> get onLeave => _onLeave;
  dynamic get notOnLeave => _notOnLeave;
  List<OnTeam> get onTeam => _onTeam;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_onLeave != null) {
      map['onLeave'] = _onLeave.map((v) => v.toJson()).toList();
    }
    map['notOnLeave'] = _notOnLeave;
    if (_onTeam != null) {
      map['onTeam'] = _onTeam.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// employeeId : 156
/// employeeName : "Lovely Sharma"

class OnTeam {
  OnTeam({
      int employeeId, 
      String employeeName,}){
    _employeeId = employeeId;
    _employeeName = employeeName;
}

  OnTeam.fromJson(dynamic json) {
    _employeeId = json['employeeId'];
    _employeeName = json['employeeName'];
  }
  int _employeeId;
  String _employeeName;

  int get employeeId => _employeeId;
  String get employeeName => _employeeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employeeId'] = _employeeId;
    map['employeeName'] = _employeeName;
    return map;
  }

}

/// employeeId : 156
/// employeeName : "Lovely Sharma"

class OnLeave {
  OnLeave({
      int employeeId, 
      String employeeName,}){
    _employeeId = employeeId;
    _employeeName = employeeName;
}

  OnLeave.fromJson(dynamic json) {
    _employeeId = json['employeeId'];
    _employeeName = json['employeeName'];
  }
  int _employeeId;
  String _employeeName;

  int get employeeId => _employeeId;
  String get employeeName => _employeeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employeeId'] = _employeeId;
    map['employeeName'] = _employeeName;
    return map;
  }

}