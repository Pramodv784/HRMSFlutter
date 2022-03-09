/// message : "Holiday list found!"
/// status : true
/// holiday : [{"holidayId":16,"holidayName":"Good Friday","description":"Good Friday up1 1","isFloaterOptional":false,"imageUrl":"https://uatportalapi.moreyeahs.in/MenuImage/download (2)20220308061729PM.jfif","holidayDate":"2022-04-15T00:00:00","createdBy":156,"updatedBy":156,"createdOn":"2022-03-01T00:00:00","updatedOn":"2022-03-01T00:00:00","isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1},{"holidayId":18,"holidayName":"holii","description":"holi festival up","isFloaterOptional":true,"imageUrl":"https://uatportalapi.moreyeahs.in/MenuImage/celebration-indian-festival-holi-hai-600w-193908269220220308061447PM.jpg","holidayDate":"2022-03-17T18:30:00","createdBy":156,"updatedBy":156,"createdOn":"2022-03-04T16:50:39.337","updatedOn":"2022-03-04T16:50:39.337","isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1},{"holidayId":24,"holidayName":"Good Friday 2","description":"Description up","isFloaterOptional":true,"imageUrl":"https://uatportalapi.moreyeahs.in/uploadimage/HolidayImage/download (2)20220308064926PM.jfif","holidayDate":"2022-03-10T18:30:00","createdBy":156,"updatedBy":156,"createdOn":"2022-03-08T18:54:16.197","updatedOn":"2022-03-08T18:54:16.197","isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":1}]

class GetAllHolidaysResponse {
  GetAllHolidaysResponse({
      String message, 
      bool status, 
      List<Holiday> holiday,}){
    _message = message;
    _status = status;
    _holiday = holiday;
}

  GetAllHolidaysResponse.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    if (json['holiday'] != null) {
      _holiday = [];
      json['holiday'].forEach((v) {
        _holiday.add(Holiday.fromJson(v));
      });
    }
  }
  String _message;
  bool _status;
  List<Holiday> _holiday;

  String get message => _message;
  bool get status => _status;
  List<Holiday> get holiday => _holiday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_holiday != null) {
      map['holiday'] = _holiday.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// holidayId : 16
/// holidayName : "Good Friday"
/// description : "Good Friday up1 1"
/// isFloaterOptional : false
/// imageUrl : "https://uatportalapi.moreyeahs.in/MenuImage/download (2)20220308061729PM.jfif"
/// holidayDate : "2022-04-15T00:00:00"
/// createdBy : 156
/// updatedBy : 156
/// createdOn : "2022-03-01T00:00:00"
/// updatedOn : "2022-03-01T00:00:00"
/// isActive : true
/// isDeleted : false
/// message : null
/// companyId : 1
/// orgId : 1

class Holiday {
  Holiday({
      int holidayId, 
      String holidayName, 
      String description, 
      bool isFloaterOptional, 
      String imageUrl, 
      String holidayDate, 
      int createdBy, 
      int updatedBy, 
      String createdOn, 
      String updatedOn, 
      bool isActive, 
      bool isDeleted, 
      dynamic message, 
      int companyId, 
      int orgId,}){
    _holidayId = holidayId;
    _holidayName = holidayName;
    _description = description;
    _isFloaterOptional = isFloaterOptional;
    _imageUrl = imageUrl;
    _holidayDate = holidayDate;
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

  Holiday.fromJson(dynamic json) {
    _holidayId = json['holidayId'];
    _holidayName = json['holidayName'];
    _description = json['description'];
    _isFloaterOptional = json['isFloaterOptional'];
    _imageUrl = json['imageUrl'];
    _holidayDate = json['holidayDate'];
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
  int _holidayId;
  String _holidayName;
  String _description;
  bool _isFloaterOptional;
  String _imageUrl;
  String _holidayDate;
  int _createdBy;
  int _updatedBy;
  String _createdOn;
  String _updatedOn;
  bool _isActive;
  bool _isDeleted;
  dynamic _message;
  int _companyId;
  int _orgId;

  int get holidayId => _holidayId;
  String get holidayName => _holidayName;
  String get description => _description;
  bool get isFloaterOptional => _isFloaterOptional;
  String get imageUrl => _imageUrl;
  String get holidayDate => _holidayDate;
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
    map['holidayId'] = _holidayId;
    map['holidayName'] = _holidayName;
    map['description'] = _description;
    map['isFloaterOptional'] = _isFloaterOptional;
    map['imageUrl'] = _imageUrl;
    map['holidayDate'] = _holidayDate;
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