/// message : "Ticket Details"
/// status : true
/// data : {"ticketId":7,"priorityType":3,"title":"titljg","ticketStatus":1,"categoryName":"Account HelpDesk","assignedToName":"Not Assigned Yet!","priorityName":"High","commentList":[{"createOn":"2022-03-24T12:52:36.567","commentBy":null,"commentOn":null,"message":"vgh","commentType":"SENDER"}]}

class TicketDetailResposne {
  TicketDetailResposne({
      String message, 
      bool status, 
      Data data,}){
    _message = message;
    _status = status;
    _data = data;
}

  TicketDetailResposne.fromJson(dynamic json) {
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

/// ticketId : 7
/// priorityType : 3
/// title : "titljg"
/// ticketStatus : 1
/// categoryName : "Account HelpDesk"
/// assignedToName : "Not Assigned Yet!"
/// priorityName : "High"
/// commentList : [{"createOn":"2022-03-24T12:52:36.567","commentBy":null,"commentOn":null,"message":"vgh","commentType":"SENDER"}]

class Data {
  Data({
      int ticketId, 
      int priorityType, 
      String title, 
      int ticketStatus, 
      String categoryName, 
      String assignedToName, 
      String priorityName, 
      List<CommentList> commentList,}){
    _ticketId = ticketId;
    _priorityType = priorityType;
    _title = title;
    _ticketStatus = ticketStatus;
    _categoryName = categoryName;
    _assignedToName = assignedToName;
    _priorityName = priorityName;
    _commentList = commentList;
}

  Data.fromJson(dynamic json) {
    _ticketId = json['ticketId'];
    _priorityType = json['priorityType'];
    _title = json['title'];
    _ticketStatus = json['ticketStatus'];
    _categoryName = json['categoryName'];
    _assignedToName = json['assignedToName'];
    _priorityName = json['priorityName'];
    if (json['commentList'] != null) {
      _commentList = [];
      json['commentList'].forEach((v) {
        _commentList.add(CommentList.fromJson(v));
      });
    }
  }
  int _ticketId;
  int _priorityType;
  String _title;
  int _ticketStatus;
  String _categoryName;
  String _assignedToName;
  String _priorityName;
  List<CommentList> _commentList;

  int get ticketId => _ticketId;
  int get priorityType => _priorityType;
  String get title => _title;
  int get ticketStatus => _ticketStatus;
  String get categoryName => _categoryName;
  String get assignedToName => _assignedToName;
  String get priorityName => _priorityName;
  List<CommentList> get commentList => _commentList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticketId'] = _ticketId;
    map['priorityType'] = _priorityType;
    map['title'] = _title;
    map['ticketStatus'] = _ticketStatus;
    map['categoryName'] = _categoryName;
    map['assignedToName'] = _assignedToName;
    map['priorityName'] = _priorityName;
    if (_commentList != null) {
      map['commentList'] = _commentList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// createOn : "2022-03-24T12:52:36.567"
/// commentBy : null
/// commentOn : null
/// message : "vgh"
/// commentType : "SENDER"

class CommentList {
  CommentList({
      String createOn, 
      dynamic commentBy, 
      dynamic commentOn, 
      String message, 
      String commentType,}){
    _createOn = createOn;
    _commentBy = commentBy;
    _commentOn = commentOn;
    _message = message;
    _commentType = commentType;
}

  CommentList.fromJson(dynamic json) {
    _createOn = json['createOn'];
    _commentBy = json['commentBy'];
    _commentOn = json['commentOn'];
    _message = json['message'];
    _commentType = json['commentType'];
  }
  String _createOn;
  dynamic _commentBy;
  dynamic _commentOn;
  String _message;
  String _commentType;

  String get createOn => _createOn;
  dynamic get commentBy => _commentBy;
  dynamic get commentOn => _commentOn;
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