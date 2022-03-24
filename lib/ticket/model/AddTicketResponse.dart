/// message : "Ticket Created"
/// status : true
/// data : {"ticketId":6,"ticketCategoryId":4,"categoryName":"Account HelpDesk","title":"title","ticketStatus":1,"priorityType":3,"priorityName":"High","ticketPriorityId":13,"assignedToId":0,"assignedToName":null,"ticketClosedOn":null,"companyId":1,"orgId":1,"createdBy":156,"updatedBy":null,"deletedBy":null,"createdOn":"2022-03-24T12:36:17.2927729+05:30","updatedOn":null,"deletedOn":null,"isActive":true,"isDeleted":false}

class AddTicketResponse {
  AddTicketResponse({
      String message, 
      bool status, 
      Data data,}){
    _message = message;
    _status = status;
    _data = data;
}

  AddTicketResponse.fromJson(dynamic json) {
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

/// ticketId : 6
/// ticketCategoryId : 4
/// categoryName : "Account HelpDesk"
/// title : "title"
/// ticketStatus : 1
/// priorityType : 3
/// priorityName : "High"
/// ticketPriorityId : 13
/// assignedToId : 0
/// assignedToName : null
/// ticketClosedOn : null
/// companyId : 1
/// orgId : 1
/// createdBy : 156
/// updatedBy : null
/// deletedBy : null
/// createdOn : "2022-03-24T12:36:17.2927729+05:30"
/// updatedOn : null
/// deletedOn : null
/// isActive : true
/// isDeleted : false

class Data {
  Data({
      int ticketId, 
      int ticketCategoryId, 
      String categoryName, 
      String title, 
      int ticketStatus, 
      int priorityType, 
      String priorityName, 
      int ticketPriorityId, 
      int assignedToId, 
      dynamic assignedToName, 
      dynamic ticketClosedOn, 
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
    _ticketId = ticketId;
    _ticketCategoryId = ticketCategoryId;
    _categoryName = categoryName;
    _title = title;
    _ticketStatus = ticketStatus;
    _priorityType = priorityType;
    _priorityName = priorityName;
    _ticketPriorityId = ticketPriorityId;
    _assignedToId = assignedToId;
    _assignedToName = assignedToName;
    _ticketClosedOn = ticketClosedOn;
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
    _ticketId = json['ticketId'];
    _ticketCategoryId = json['ticketCategoryId'];
    _categoryName = json['categoryName'];
    _title = json['title'];
    _ticketStatus = json['ticketStatus'];
    _priorityType = json['priorityType'];
    _priorityName = json['priorityName'];
    _ticketPriorityId = json['ticketPriorityId'];
    _assignedToId = json['assignedToId'];
    _assignedToName = json['assignedToName'];
    _ticketClosedOn = json['ticketClosedOn'];
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
  int _ticketId;
  int _ticketCategoryId;
  String _categoryName;
  String _title;
  int _ticketStatus;
  int _priorityType;
  String _priorityName;
  int _ticketPriorityId;
  int _assignedToId;
  dynamic _assignedToName;
  dynamic _ticketClosedOn;
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

  int get ticketId => _ticketId;
  int get ticketCategoryId => _ticketCategoryId;
  String get categoryName => _categoryName;
  String get title => _title;
  int get ticketStatus => _ticketStatus;
  int get priorityType => _priorityType;
  String get priorityName => _priorityName;
  int get ticketPriorityId => _ticketPriorityId;
  int get assignedToId => _assignedToId;
  dynamic get assignedToName => _assignedToName;
  dynamic get ticketClosedOn => _ticketClosedOn;
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
    map['ticketId'] = _ticketId;
    map['ticketCategoryId'] = _ticketCategoryId;
    map['categoryName'] = _categoryName;
    map['title'] = _title;
    map['ticketStatus'] = _ticketStatus;
    map['priorityType'] = _priorityType;
    map['priorityName'] = _priorityName;
    map['ticketPriorityId'] = _ticketPriorityId;
    map['assignedToId'] = _assignedToId;
    map['assignedToName'] = _assignedToName;
    map['ticketClosedOn'] = _ticketClosedOn;
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