/// status : "Error"
/// message : "Leave Request already added!"
/// leaveRequest : null

class AddLeaveResponse {
  AddLeaveResponse({
      String status, 
      String message, 
      dynamic leaveRequest,}){
    _status = status;
    _message = message;
    _leaveRequest = leaveRequest;
}

  AddLeaveResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _leaveRequest = json['leaveRequest'];
  }
  String _status;
  String _message;
  dynamic _leaveRequest;

  String get status => _status;
  String get message => _message;
  dynamic get leaveRequest => _leaveRequest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['leaveRequest'] = _leaveRequest;
    return map;
  }

}