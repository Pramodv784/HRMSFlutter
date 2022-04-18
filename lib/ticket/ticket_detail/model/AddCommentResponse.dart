/// message : "Comment Saved"
/// status : true
/// data : {"ticketCommentId":16,"ticketId":7,"message":"yellow","image1":null,"image2":null,"image3":null,"image4":null,"image5":null,"commentBy":"Lovely Sharma","commentOn":"3/24/2022","companyId":1,"orgId":1,"createdBy":156,"updatedBy":null,"deletedBy":null,"createdOn":"2022-03-24T17:34:44.5361773+05:30","updatedOn":null,"deletedOn":null,"isActive":true,"isDeleted":false}

class AddCommentResponse {
  AddCommentResponse({
      String message, 
      bool status, 
      Data data,}){
    _message = message;
    _status = status;
    _data = data;
}

  AddCommentResponse.fromJson(dynamic json) {
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

/// ticketCommentId : 16
/// ticketId : 7
/// message : "yellow"
/// image1 : null
/// image2 : null
/// image3 : null
/// image4 : null
/// image5 : null
/// commentBy : "Lovely Sharma"
/// commentOn : "3/24/2022"
/// companyId : 1
/// orgId : 1
/// createdBy : 156
/// updatedBy : null
/// deletedBy : null
/// createdOn : "2022-03-24T17:34:44.5361773+05:30"
/// updatedOn : null
/// deletedOn : null
/// isActive : true
/// isDeleted : false

class Data {
  Data({
      int ticketCommentId, 
      int ticketId, 
      String message, 
      dynamic image1, 
      dynamic image2, 
      dynamic image3, 
      dynamic image4, 
      dynamic image5, 
      String commentBy, 
      String commentOn, 
      int companyId, 
      int orgId, 
      int createdBy, 
      dynamic updatedBy, 
      dynamic deletedBy, 
      String createdOn, 
      dynamic updatedOn, 
      dynamic deletedOn, 
      bool isActive, 
      bool isDeleted,}){
    _ticketCommentId = ticketCommentId;
    _ticketId = ticketId;
    _message = message;
    _image1 = image1;
    _image2 = image2;
    _image3 = image3;
    _image4 = image4;
    _image5 = image5;
    _commentBy = commentBy;
    _commentOn = commentOn;
    _companyId = companyId;
    _orgId = orgId;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _deletedBy = deletedBy;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
    _deletedOn = deletedOn;
    _isActive = isActive;
    _isDeleted = isDeleted;
}

  Data.fromJson(dynamic json) {
    _ticketCommentId = json['ticketCommentId'];
    _ticketId = json['ticketId'];
    _message = json['message'];
    _image1 = json['image1'];
    _image2 = json['image2'];
    _image3 = json['image3'];
    _image4 = json['image4'];
    _image5 = json['image5'];
    _commentBy = json['commentBy'];
    _commentOn = json['commentOn'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
    _createdBy = json['createdBy'];
    _updatedBy = json['updatedBy'];
    _deletedBy = json['deletedBy'];
    _createdOn = json['createdOn'];
    _updatedOn = json['updatedOn'];
    _deletedOn = json['deletedOn'];
    _isActive = json['isActive'];
    _isDeleted = json['isDeleted'];
  }
  int _ticketCommentId;
  int _ticketId;
  String _message;
  dynamic _image1;
  dynamic _image2;
  dynamic _image3;
  dynamic _image4;
  dynamic _image5;
  String _commentBy;
  String _commentOn;
  int _companyId;
  int _orgId;
  int _createdBy;
  dynamic _updatedBy;
  dynamic _deletedBy;
  String _createdOn;
  dynamic _updatedOn;
  dynamic _deletedOn;
  bool _isActive;
  bool _isDeleted;

  int get ticketCommentId => _ticketCommentId;
  int get ticketId => _ticketId;
  String get message => _message;
  dynamic get image1 => _image1;
  dynamic get image2 => _image2;
  dynamic get image3 => _image3;
  dynamic get image4 => _image4;
  dynamic get image5 => _image5;
  String get commentBy => _commentBy;
  String get commentOn => _commentOn;
  int get companyId => _companyId;
  int get orgId => _orgId;
  int get createdBy => _createdBy;
  dynamic get updatedBy => _updatedBy;
  dynamic get deletedBy => _deletedBy;
  String get createdOn => _createdOn;
  dynamic get updatedOn => _updatedOn;
  dynamic get deletedOn => _deletedOn;
  bool get isActive => _isActive;
  bool get isDeleted => _isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticketCommentId'] = _ticketCommentId;
    map['ticketId'] = _ticketId;
    map['message'] = _message;
    map['image1'] = _image1;
    map['image2'] = _image2;
    map['image3'] = _image3;
    map['image4'] = _image4;
    map['image5'] = _image5;
    map['commentBy'] = _commentBy;
    map['commentOn'] = _commentOn;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    map['createdBy'] = _createdBy;
    map['updatedBy'] = _updatedBy;
    map['deletedBy'] = _deletedBy;
    map['createdOn'] = _createdOn;
    map['updatedOn'] = _updatedOn;
    map['deletedOn'] = _deletedOn;
    map['isActive'] = _isActive;
    map['isDeleted'] = _isDeleted;
    return map;
  }

}