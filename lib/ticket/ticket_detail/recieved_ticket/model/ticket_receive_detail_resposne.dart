/// message : "Ticket Details"
/// status : true
/// data : {"ticketId":36,"priorityType":3,"title":"dsfgsdfgdfg","ticketStatus":1,"statusName":"Pending","categoryName":"ticket demo","assignedToName":"Chandra prakash Rawat","priorityName":"High","employeeBlock":{"employeeId":10757,"employeeName":"PushPendra Sing","designation":"We Will Update Soon ..!","contactNumber":null,"location":"Indore"},"commentList":[{"createOn":"2022-04-06T12:34:39.01","commentBy":"PushPendra Sing","commentOn":"4/6/2022","message":"sdfgsdgsdfgsdf","commentType":"RECIVER"}]}

class TicketReceiveDetailResposne {
  TicketReceiveDetailResposne({
      String message, 
      bool status, 
      Data data,}){
    _message = message;
    _status = status;
    _data = data;
}

  TicketReceiveDetailResposne.fromJson(dynamic json) {
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

/// ticketId : 36
/// priorityType : 3
/// title : "dsfgsdfgdfg"
/// ticketStatus : 1
/// statusName : "Pending"
/// categoryName : "ticket demo"
/// assignedToName : "Chandra prakash Rawat"
/// priorityName : "High"
/// employeeBlock : {"employeeId":10757,"employeeName":"PushPendra Sing","designation":"We Will Update Soon ..!","contactNumber":null,"location":"Indore"}
/// commentList : [{"createOn":"2022-04-06T12:34:39.01","commentBy":"PushPendra Sing","commentOn":"4/6/2022","message":"sdfgsdgsdfgsdf","commentType":"RECIVER"}]

class Data {
  Data({
      int ticketId, 
      int priorityType, 
      String title, 
      int ticketStatus, 
      String statusName, 
      String categoryName, 
      String assignedToName, 
      String priorityName, 
      EmployeeBlock employeeBlock, 
      List<CommentDetailList> commentList,}){
    _ticketId = ticketId;
    _priorityType = priorityType;
    _title = title;
    _ticketStatus = ticketStatus;
    _statusName = statusName;
    _categoryName = categoryName;
    _assignedToName = assignedToName;
    _priorityName = priorityName;
    _employeeBlock = employeeBlock;
    _commentList = commentList;
}

  Data.fromJson(dynamic json) {
    _ticketId = json['ticketId'];
    _priorityType = json['priorityType'];
    _title = json['title'];
    _ticketStatus = json['ticketStatus'];
    _statusName = json['statusName'];
    _categoryName = json['categoryName'];
    _assignedToName = json['assignedToName'];
    _priorityName = json['priorityName'];
    _employeeBlock = json['employeeBlock'] != null ? EmployeeBlock.fromJson(json['employeeBlock']) : null;
    if (json['commentList'] != null) {
      _commentList = [];
      json['commentList'].forEach((v) {
        _commentList.add(CommentDetailList.fromJson(v));
      });
    }
  }
  int _ticketId;
  int _priorityType;
  String _title;
  int _ticketStatus;
  String _statusName;
  String _categoryName;
  String _assignedToName;
  String _priorityName;
  EmployeeBlock _employeeBlock;
  List<CommentDetailList> _commentList;

  int get ticketId => _ticketId;
  int get priorityType => _priorityType;
  String get title => _title;
  int get ticketStatus => _ticketStatus;
  String get statusName => _statusName;
  String get categoryName => _categoryName;
  String get assignedToName => _assignedToName;
  String get priorityName => _priorityName;
  EmployeeBlock get employeeBlock => _employeeBlock;
  List<CommentDetailList> get commentList => _commentList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticketId'] = _ticketId;
    map['priorityType'] = _priorityType;
    map['title'] = _title;
    map['ticketStatus'] = _ticketStatus;
    map['statusName'] = _statusName;
    map['categoryName'] = _categoryName;
    map['assignedToName'] = _assignedToName;
    map['priorityName'] = _priorityName;
    if (_employeeBlock != null) {
      map['employeeBlock'] = _employeeBlock.toJson();
    }
    if (_commentList != null) {
      map['commentList'] = _commentList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// createOn : "2022-04-06T12:34:39.01"
/// commentBy : "PushPendra Sing"
/// commentOn : "4/6/2022"
/// message : "sdfgsdgsdfgsdf"
/// commentType : "RECIVER"

class CommentDetailList {
  CommentDetailList({
      String createOn, 
      String commentBy, 
      String commentOn, 
      String message, 
      String commentType,}){
    _createOn = createOn;
    _commentBy = commentBy;
    _commentOn = commentOn;
    _message = message;
    _commentType = commentType;
}

  CommentDetailList.fromJson(dynamic json) {
    _createOn = json['createOn'];
    _commentBy = json['commentBy'];
    _commentOn = json['commentOn'];
    _message = json['message'];
    _commentType = json['commentType'];
  }
  String _createOn;
  String _commentBy;
  String _commentOn;
  String _message;
  String _commentType;

  String get createOn => _createOn;
  String get commentBy => _commentBy;
  String get commentOn => _commentOn;
  String get message => _message;
  String get commentType => _commentType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createOn'] = _createOn;
    map['commentBy'] = _commentBy;
    map['commentOn'] = _commentOn;
    map['message'] = _message;
    map['commentType'] = _commentType;
    return map;
  }

}

/// employeeId : 10757
/// employeeName : "PushPendra Sing"
/// designation : "We Will Update Soon ..!"
/// contactNumber : null
/// location : "Indore"

class EmployeeBlock {
  EmployeeBlock({
      int employeeId, 
      String employeeName, 
      String designation, 
      dynamic contactNumber, 
      String location,}){
    _employeeId = employeeId;
    _employeeName = employeeName;
    _designation = designation;
    _contactNumber = contactNumber;
    _location = location;
}

  EmployeeBlock.fromJson(dynamic json) {
    _employeeId = json['employeeId'];
    _employeeName = json['employeeName'];
    _designation = json['designation'];
    _contactNumber = json['contactNumber'];
    _location = json['location'];
  }
  int _employeeId;
  String _employeeName;
  String _designation;
  dynamic _contactNumber;
  String _location;

  int get employeeId => _employeeId;
  String get employeeName => _employeeName;
  String get designation => _designation;
  dynamic get contactNumber => _contactNumber;
  String get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employeeId'] = _employeeId;
    map['employeeName'] = _employeeName;
    map['designation'] = _designation;
    map['contactNumber'] = _contactNumber;
    map['location'] = _location;
    return map;
  }

}