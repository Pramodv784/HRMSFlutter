/// message : "Ticket List"
/// status : true
/// data : {"openTicket":[{"ticketId":36,"ticketNumber":"#36","priorityType":3,"priorityName":"High","title":"dsfgsdfgdfg","createdOn":"2022-04-06T12:34:39.01","categoryName":"ticket demo","assignedTo":"Chandra prakash Rawat","ticketStatus":"Pending","lastUpdated":"2022-04-07T16:03:22.083"},{"ticketId":34,"ticketNumber":"#34","priorityType":3,"priorityName":"High","title":"sdfzsdgsdfg","createdOn":"2022-04-06T12:34:22.047","categoryName":"ticket demo","assignedTo":"Chandra prakash Rawat","ticketStatus":"Pending","lastUpdated":"2022-04-06T16:32:04.033"},{"ticketId":42,"ticketNumber":"#42","priorityType":3,"priorityName":"High","title":"zdfgdsfgsd","createdOn":"2022-04-06T14:12:15.243","categoryName":"ticket demo","assignedTo":"Chandra prakash Rawat","ticketStatus":"Pending","lastUpdated":"2022-04-06T16:31:17.377"},{"ticketId":35,"ticketNumber":"#35","priorityType":3,"priorityName":"High","title":"sdfgsdgsd","createdOn":"2022-04-06T12:34:30.443","categoryName":"ticket demo","assignedTo":"Not Assigned Yet!","ticketStatus":"Pending","lastUpdated":"2022-04-06T12:34:30.443"}],"closeTicket":[{"ticketId":31,"ticketNumber":"#31","title":"EWerw","createdOn":"2022-04-06T11:08:02.167","categoryName":"ticket demo","closedBy":"Chandra prakash Rawat","closedOn":"2022-04-06T16:31:48.163"},{"ticketId":32,"ticketNumber":"#32","title":"afasdfs","createdOn":"2022-04-06T11:08:10.7","categoryName":"ticket demo","closedBy":"Chandra prakash Rawat","closedOn":"2022-04-06T12:23:49.053"},{"ticketId":33,"ticketNumber":"#33","title":"DFasfdasf","createdOn":"2022-04-06T11:08:19.713","categoryName":"ticket demo","closedBy":"Chandra prakash Rawat","closedOn":"2022-04-06T11:30:41.707"},{"ticketId":27,"ticketNumber":"#27","title":"sdfgasdf","createdOn":"2022-04-05T18:56:52.263","categoryName":"ticket demo","closedBy":"Chandra prakash Rawat","closedOn":"2022-04-06T11:20:33.633"},{"ticketId":23,"ticketNumber":"#23","title":"sdfasf","createdOn":"2022-04-05T14:10:25.287","categoryName":null,"closedBy":"Chandra prakash Rawat","closedOn":"2022-04-05T19:19:25.033"},{"ticketId":24,"ticketNumber":"#24","title":"sdfasdfgsd","createdOn":"2022-04-05T18:44:10.463","categoryName":null,"closedBy":null,"closedOn":null},{"ticketId":25,"ticketNumber":"#25","title":"dfasddfasdf","createdOn":"2022-04-05T18:54:07","categoryName":null,"closedBy":null,"closedOn":null},{"ticketId":26,"ticketNumber":"#26","title":"sdfasfas","createdOn":"2022-04-05T18:56:41.23","categoryName":null,"closedBy":"Chandra prakash Rawat","closedOn":null},{"ticketId":28,"ticketNumber":"#28","title":"sdfasdfASDF","createdOn":"2022-04-05T18:57:07.077","categoryName":null,"closedBy":null,"closedOn":null},{"ticketId":29,"ticketNumber":"#29","title":"sdfasdfASDF","createdOn":"2022-04-05T18:57:07.187","categoryName":null,"closedBy":null,"closedOn":null},{"ticketId":30,"ticketNumber":"#30","title":"SADFAsdF","createdOn":"2022-04-05T18:57:19.337","categoryName":null,"closedBy":null,"closedOn":null}]}

class RecievedTicketResponse {
  RecievedTicketResponse({
      String message, 
      bool status, 
      Data data,}){
    _message = message;
    _status = status;
    _data = data;
}

  RecievedTicketResponse.fromJson(dynamic json) {
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

/// openTicket : [{"ticketId":36,"ticketNumber":"#36","priorityType":3,"priorityName":"High","title":"dsfgsdfgdfg","createdOn":"2022-04-06T12:34:39.01","categoryName":"ticket demo","assignedTo":"Chandra prakash Rawat","ticketStatus":"Pending","lastUpdated":"2022-04-07T16:03:22.083"},{"ticketId":34,"ticketNumber":"#34","priorityType":3,"priorityName":"High","title":"sdfzsdgsdfg","createdOn":"2022-04-06T12:34:22.047","categoryName":"ticket demo","assignedTo":"Chandra prakash Rawat","ticketStatus":"Pending","lastUpdated":"2022-04-06T16:32:04.033"},{"ticketId":42,"ticketNumber":"#42","priorityType":3,"priorityName":"High","title":"zdfgdsfgsd","createdOn":"2022-04-06T14:12:15.243","categoryName":"ticket demo","assignedTo":"Chandra prakash Rawat","ticketStatus":"Pending","lastUpdated":"2022-04-06T16:31:17.377"},{"ticketId":35,"ticketNumber":"#35","priorityType":3,"priorityName":"High","title":"sdfgsdgsd","createdOn":"2022-04-06T12:34:30.443","categoryName":"ticket demo","assignedTo":"Not Assigned Yet!","ticketStatus":"Pending","lastUpdated":"2022-04-06T12:34:30.443"}]
/// closeTicket : [{"ticketId":31,"ticketNumber":"#31","title":"EWerw","createdOn":"2022-04-06T11:08:02.167","categoryName":"ticket demo","closedBy":"Chandra prakash Rawat","closedOn":"2022-04-06T16:31:48.163"},{"ticketId":32,"ticketNumber":"#32","title":"afasdfs","createdOn":"2022-04-06T11:08:10.7","categoryName":"ticket demo","closedBy":"Chandra prakash Rawat","closedOn":"2022-04-06T12:23:49.053"},{"ticketId":33,"ticketNumber":"#33","title":"DFasfdasf","createdOn":"2022-04-06T11:08:19.713","categoryName":"ticket demo","closedBy":"Chandra prakash Rawat","closedOn":"2022-04-06T11:30:41.707"},{"ticketId":27,"ticketNumber":"#27","title":"sdfgasdf","createdOn":"2022-04-05T18:56:52.263","categoryName":"ticket demo","closedBy":"Chandra prakash Rawat","closedOn":"2022-04-06T11:20:33.633"},{"ticketId":23,"ticketNumber":"#23","title":"sdfasf","createdOn":"2022-04-05T14:10:25.287","categoryName":null,"closedBy":"Chandra prakash Rawat","closedOn":"2022-04-05T19:19:25.033"},{"ticketId":24,"ticketNumber":"#24","title":"sdfasdfgsd","createdOn":"2022-04-05T18:44:10.463","categoryName":null,"closedBy":null,"closedOn":null},{"ticketId":25,"ticketNumber":"#25","title":"dfasddfasdf","createdOn":"2022-04-05T18:54:07","categoryName":null,"closedBy":null,"closedOn":null},{"ticketId":26,"ticketNumber":"#26","title":"sdfasfas","createdOn":"2022-04-05T18:56:41.23","categoryName":null,"closedBy":"Chandra prakash Rawat","closedOn":null},{"ticketId":28,"ticketNumber":"#28","title":"sdfasdfASDF","createdOn":"2022-04-05T18:57:07.077","categoryName":null,"closedBy":null,"closedOn":null},{"ticketId":29,"ticketNumber":"#29","title":"sdfasdfASDF","createdOn":"2022-04-05T18:57:07.187","categoryName":null,"closedBy":null,"closedOn":null},{"ticketId":30,"ticketNumber":"#30","title":"SADFAsdF","createdOn":"2022-04-05T18:57:19.337","categoryName":null,"closedBy":null,"closedOn":null}]

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

/// ticketId : 31
/// ticketNumber : "#31"
/// title : "EWerw"
/// createdOn : "2022-04-06T11:08:02.167"
/// categoryName : "ticket demo"
/// closedBy : "Chandra prakash Rawat"
/// closedOn : "2022-04-06T16:31:48.163"

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

/// ticketId : 36
/// ticketNumber : "#36"
/// priorityType : 3
/// priorityName : "High"
/// title : "dsfgsdfgdfg"
/// createdOn : "2022-04-06T12:34:39.01"
/// categoryName : "ticket demo"
/// assignedTo : "Chandra prakash Rawat"
/// ticketStatus : "Pending"
/// lastUpdated : "2022-04-07T16:03:22.083"

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