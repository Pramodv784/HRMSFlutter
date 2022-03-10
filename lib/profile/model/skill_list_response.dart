/// message : "skillroup List"
/// status : true
/// data : [{"skillId":1,"skillName":"hiii","description":"hiii"},{"skillId":2,"skillName":"0","description":"0"},{"skillId":3,"skillName":" adfsad","description":" asasdad"},{"skillId":4,"skillName":"dfsfds","description":"sdfsdfds"},{"skillId":5,"skillName":"fdfgsd","description":"gfsdfgsdfg"},{"skillId":6,"skillName":"asdasa","description":"dadsads"},{"skillId":7,"skillName":"asda","description":"dsasdasda"},{"skillId":8,"skillName":"asdasd","description":"asdasda"},{"skillId":9,"skillName":"angular","description":"dfhaslk "},{"skillId":10,"skillName":".net","description":"khasdgflja"}]

class SkillListResponse {
  SkillListResponse({
      String message, 
      bool status, 
      List<SkillData> data,}){
    _message = message;
    _status = status;
    _data = data;
}

  SkillListResponse.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(SkillData.fromJson(v));
      });
    }
  }
  String _message;
  bool _status;
  List<SkillData> _data;

  String get message => _message;
  bool get status => _status;
  List<SkillData> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// skillId : 1
/// skillName : "hiii"
/// description : "hiii"

class SkillData {
  SkillData({
      int skillId, 
      String skillName, 
      String description,}){
    _skillId = skillId;
    _skillName = skillName;
    _description = description;
}

  SkillData.fromJson(dynamic json) {
    _skillId = json['skillId'];
    _skillName = json['skillName'];
    _description = json['description'];
  }
  int _skillId;
  String _skillName;
  String _description;

  int get skillId => _skillId;
  String get skillName => _skillName;
  String get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['skillId'] = _skillId;
    map['skillName'] = _skillName;
    map['description'] = _description;
    return map;
  }

}