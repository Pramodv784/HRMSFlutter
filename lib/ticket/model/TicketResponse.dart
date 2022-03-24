/// message : "Ticket List"
/// status : true
/// data : {"openTicket":[{"ticketId":2,"ticketNumber":"#2","priorityType":1,"priorityName":"Low","title":"system not working","createdOn":"2022-03-23T18:43:25.603","categoryName":"IT HelpDesk","assignedTo":"Not Assigned Yet!","ticketStatus":"Pending","lastUpdated":"2022-03-23T18:43:25.603"},{"ticketId":1,"ticketNumber":"#1","priorityType":1,"priorityName":"Low","title":"Demo Ticket","createdOn":"2022-03-23T16:35:56.633","categoryName":"IT HelpDesk","assignedTo":"Not Assigned Yet!","ticketStatus":"Pending","lastUpdated":"2022-03-23T16:35:56.633"}],"closeTicket":[{"ticketId":3,"ticketNumber":"#3","title":"keyboard","createdOn":"2022-03-24T11:20:14.4","categoryName":"Account HelpDesk","closedBy":"ABCD","closedOn":"2022-03-25T11:20:14.4"}]}

class TicketResponse {
  TicketResponse({
      String message, 
      bool status, 
      Data data,}){
    _message = message;
    _status = status;
    _data = data;
}

  TicketResponse.fromJson(dynamic json) {
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

/// openTicket : [{"ticketId":2,"ticketNumber":"#2","priorityType":1,"priorityName":"Low","title":"system not working","createdOn":"2022-03-23T18:43:25.603","categoryName":"IT HelpDesk","assignedTo":"Not Assigned Yet!","ticketStatus":"Pending","lastUpdated":"2022-03-23T18:43:25.603"},{"ticketId":1,"ticketNumber":"#1","priorityType":1,"priorityName":"Low","title":"Demo Ticket","createdOn":"2022-03-23T16:35:56.633","categoryName":"IT HelpDesk","assignedTo":"Not Assigned Yet!","ticketStatus":"Pending","lastUpdated":"2022-03-23T16:35:56.633"}]
/// closeTicket : [{"ticketId":3,"ticketNumber":"#3","title":"keyboard","createdOn":"2022-03-24T11:20:14.4","categoryName":"Account HelpDesk","closedBy":"ABCD","closedOn":"2022-03-25T11:20:14.4"}]

class Data {
  Data({
      List<OpenTicket> openTicket, 
      List<CloseTicket> closeTicket,}){
    _openTicket = openTicket;
    _closeTicket = closeTicket;
}

  Data.fromJson(dynamic json) {
    if (json['openTicket'] != null) {
      _openTicket = [];
      json['openTicket'].forEach((v) {
        _openTicket.add(OpenTicket.fromJson(v));
      });
    }
    if (json['closeTicket'] != null) {
      _closeTicket = [];
      json['closeTicket'].forEach((v) {
        _closeTicket.add(CloseTicket.fromJson(v));
      });
    }
  }
  List<OpenTicket> _openTicket;
  List<CloseTicket> _closeTicket;

  List<OpenTicket> get openTicket => _openTicket;
  List<CloseTicket> get closeTicket => _closeTicket;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_openTicket != null) {
      map['openTicket'] = _openTicket.map((v) => v.toJson()).toList();
    }
    if (_closeTicket != null) {
      map['closeTicket'] = _closeTicket.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ticketId : 3
/// ticketNumber : "#3"
/// title : "keyboard"
/// createdOn : "2022-03-24T11:20:14.4"
/// categoryName : "Account HelpDesk"
/// closedBy : "ABCD"
/// closedOn : "2022-03-25T11:20:14.4"

class CloseTicket {
  CloseTicket({
      int ticketId, 
      String ticketNumber, 
      String title, 
      String createdOn, 
      String categoryName, 
      String closedBy, 
      String closedOn,}){
    _ticketId = ticketId;
    _ticketNumber = ticketNumber;
    _title = title;
    _createdOn = createdOn;
    _categoryName = categoryName;
    _closedBy = closedBy;
    _closedOn = closedOn;
}

  CloseTicket.fromJson(dynamic json) {
    _ticketId = json['ticketId'];
    _ticketNumber = json['ticketNumber'];
    _title = json['title'];
    _createdOn = json['createdOn'];
    _categoryName = json['categoryName'];
    _closedBy = json['closedBy'];
    _closedOn = json['closedOn'];
  }
  int _ticketId;
  String _ticketNumber;
  String _title;
  String _createdOn;
  String _categoryName;
  String _closedBy;
  String _closedOn;

  int get ticketId => _ticketId;
  String get ticketNumber => _ticketNumber;
  String get title => _title;
  String get createdOn => _createdOn;
  String get categoryName => _categoryName;
  String get closedBy => _closedBy;
  String get closedOn => _closedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticketId'] = _ticketId;
    map['ticketNumber'] = _ticketNumber;
    map['title'] = _title;
    map['createdOn'] = _createdOn;
    map['categoryName'] = _categoryName;
    map['closedBy'] = _closedBy;
    map['closedOn'] = _closedOn;
    return map;
  }

}

/// ticketId : 2
/// ticketNumber : "#2"
/// priorityType : 1
/// priorityName : "Low"
/// title : "system not working"
/// createdOn : "2022-03-23T18:43:25.603"
/// categoryName : "IT HelpDesk"
/// assignedTo : "Not Assigned Yet!"
/// ticketStatus : "Pending"
/// lastUpdated : "2022-03-23T18:43:25.603"

class OpenTicket {
  OpenTicket({
      int ticketId, 
      String ticketNumber, 
      int priorityType, 
      String priorityName, 
      String title, 
      String createdOn, 
      String categoryName, 
      String assignedTo, 
      String ticketStatus, 
      String lastUpdated,}){
    _ticketId = ticketId;
    _ticketNumber = ticketNumber;
    _priorityType = priorityType;
    _priorityName = priorityName;
    _title = title;
    _createdOn = createdOn;
    _categoryName = categoryName;
    _assignedTo = assignedTo;
    _ticketStatus = ticketStatus;
    _lastUpdated = lastUpdated;
}

  OpenTicket.fromJson(dynamic json) {
    _ticketId = json['ticketId'];
    _ticketNumber = json['ticketNumber'];
    _priorityType = json['priorityType'];
    _priorityName = json['priorityName'];
    _title = json['title'];
    _createdOn = json['createdOn'];
    _categoryName = json['categoryName'];
    _assignedTo = json['assignedTo'];
    _ticketStatus = json['ticketStatus'];
    _lastUpdated = json['lastUpdated'];
  }
  int _ticketId;
  String _ticketNumber;
  int _priorityType;
  String _priorityName;
  String _title;
  String _createdOn;
  String _categoryName;
  String _assignedTo;
  String _ticketStatus;
  String _lastUpdated;

  int get ticketId => _ticketId;
  String get ticketNumber => _ticketNumber;
  int get priorityType => _priorityType;
  String get priorityName => _priorityName;
  String get title => _title;
  String get createdOn => _createdOn;
  String get categoryName => _categoryName;
  String get assignedTo => _assignedTo;
  String get ticketStatus => _ticketStatus;
  String get lastUpdated => _lastUpdated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticketId'] = _ticketId;
    map['ticketNumber'] = _ticketNumber;
    map['priorityType'] = _priorityType;
    map['priorityName'] = _priorityName;
    map['title'] = _title;
    map['createdOn'] = _createdOn;
    map['categoryName'] = _categoryName;
    map['assignedTo'] = _assignedTo;
    map['ticketStatus'] = _ticketStatus;
    map['lastUpdated'] = _lastUpdated;
    return map;
  }

}