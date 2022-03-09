/// holidayId : 16
/// holidayName : "Good Friday"
/// description : "Good Friday up1 1"
/// isFloaterOptional : false
/// imageUrl : null
/// holidayDate : "2022-04-15T00:00:00"
/// createdBy : 0
/// updatedBy : 0
/// createdOn : null
/// updatedOn : null
/// isActive : false
/// isDeleted : false
/// message : null
/// companyId : 0
/// orgId : 0

class GetAllHolidaysResponse {
  GetAllHolidaysResponse({
      int holidayId, 
      String holidayName, 
      String description, 
      bool isFloaterOptional, 
      dynamic imageUrl, 
      String holidayDate, 
      int createdBy, 
      int updatedBy, 
      dynamic createdOn, 
      dynamic updatedOn, 
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

  GetAllHolidaysResponse.fromJson(dynamic json) {
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
  dynamic _imageUrl;
  String _holidayDate;
  int _createdBy;
  int _updatedBy;
  dynamic _createdOn;
  dynamic _updatedOn;
  bool _isActive;
  bool _isDeleted;
  dynamic _message;
  int _companyId;
  int _orgId;

  int get holidayId => _holidayId;
  String get holidayName => _holidayName;
  String get description => _description;
  bool get isFloaterOptional => _isFloaterOptional;
  dynamic get imageUrl => _imageUrl;
  String get holidayDate => _holidayDate;
  int get createdBy => _createdBy;
  int get updatedBy => _updatedBy;
  dynamic get createdOn => _createdOn;
  dynamic get updatedOn => _updatedOn;
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