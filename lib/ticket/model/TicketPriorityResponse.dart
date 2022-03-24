/// message : "Ticket Priority List"
/// status : true
/// data : [{"ticPriorityId":18,"priorityName":"Low","priorityDescription":"hii this is low"},{"ticPriorityId":19,"priorityName":"Medium","priorityDescription":"hii this is medium"}]

class TicketPriorityResponse {
  TicketPriorityResponse({
      String message, 
      bool status, 
      List<PriorityData> data,}){
    _message = message;
    _status = status;
    _data = data;
}

  TicketPriorityResponse.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(PriorityData.fromJson(v));
      });
    }
  }
  String _message;
  bool _status;
  List<PriorityData> _data;

  String get message => _message;
  bool get status => _status;
  List<PriorityData> get data => _data;

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

/// ticPriorityId : 18
/// priorityName : "Low"
/// priorityDescription : "hii this is low"

class PriorityData {
  PriorityData({
      int ticPriorityId, 
      String priorityName, 
      String priorityDescription,}){
    _ticPriorityId = ticPriorityId;
    _priorityName = priorityName;
    _priorityDescription = priorityDescription;
}

  PriorityData.fromJson(dynamic json) {
    _ticPriorityId = json['ticPriorityId'];
    _priorityName = json['priorityName'];
    _priorityDescription = json['priorityDescription'];
  }
  int _ticPriorityId;
  String _priorityName;
  String _priorityDescription;

  int get ticPriorityId => _ticPriorityId;
  String get priorityName => _priorityName;
  String get priorityDescription => _priorityDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticPriorityId'] = _ticPriorityId;
    map['priorityName'] = _priorityName;
    map['priorityDescription'] = _priorityDescription;
    return map;
  }

}