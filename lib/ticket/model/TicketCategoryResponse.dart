/// message : "Ticket Category List"
/// status : true
/// data : [{"ticketCategoryId":4,"categoryName":"Account HelpDesk","description":"Account Ticket Tax deduction queries pay slip queries Form 16 Request etc. Queries related to accounts and finance. "},{"ticketCategoryId":7,"categoryName":"Human Recourses Helpdesk","description":"Hello Team, Please create tickets here for all the queries and Requests related to HR Department"},{"ticketCategoryId":9,"categoryName":"IT HelpDesk","description":"Send request related to system"}]

class TicketCategoryResponse {
  TicketCategoryResponse({
      String message, 
      bool status, 
      List<TicketCatData> data,}){
    _message = message;
    _status = status;
    _data = data;
}

  TicketCategoryResponse.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(TicketCatData.fromJson(v));
      });
    }
  }
  String _message;
  bool _status;
  List<TicketCatData> _data;

  String get message => _message;
  bool get status => _status;
  List<TicketCatData> get data => _data;

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

/// ticketCategoryId : 4
/// categoryName : "Account HelpDesk"
/// description : "Account Ticket Tax deduction queries pay slip queries Form 16 Request etc. Queries related to accounts and finance. "

class TicketCatData {
  TicketCatData({
      int ticketCategoryId, 
      String categoryName, 
      String description,}){
    _ticketCategoryId = ticketCategoryId;
    _categoryName = categoryName;
    _description = description;
}

  TicketCatData.fromJson(dynamic json) {
    _ticketCategoryId = json['ticketCategoryId'];
    _categoryName = json['categoryName'];
    _description = json['description'];
  }
  int _ticketCategoryId;
  String _categoryName;
  String _description;

  int get ticketCategoryId => _ticketCategoryId;
  String get categoryName => _categoryName;
  String get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticketCategoryId'] = _ticketCategoryId;
    map['categoryName'] = _categoryName;
    map['description'] = _description;
    return map;
  }

}