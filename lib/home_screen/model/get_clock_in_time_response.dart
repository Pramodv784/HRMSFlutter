/// message : "Clock Time"
/// status : true
/// data : {"isClockIn":false,"clockInTime":"11:17:56 AM","clockOutTime":"11:18:20 AM","totalTime":"00:00:24"}

class GetClockInTimeResponse {
  GetClockInTimeResponse({
      String message, 
      bool status, 
      Data data,}){
    _message = message;
    _status = status;
    _data = data;
}

  GetClockInTimeResponse.fromJson(dynamic json) {
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

/// isClockIn : false
/// clockInTime : "11:17:56 AM"
/// clockOutTime : "11:18:20 AM"
/// totalTime : "00:00:24"

class Data {
  Data({
      bool isClockIn, 
      String clockInTime, 
      String clockOutTime, 
      String totalTime,}){
    _isClockIn = isClockIn;
    _clockInTime = clockInTime;
    _clockOutTime = clockOutTime;
    _totalTime = totalTime;
}

  Data.fromJson(dynamic json) {
    _isClockIn = json['isClockIn'];
    _clockInTime = json['clockInTime'];
    _clockOutTime = json['clockOutTime'];
    _totalTime = json['totalTime'];
  }
  bool _isClockIn;
  String _clockInTime;
  String _clockOutTime;
  String _totalTime;

  bool get isClockIn => _isClockIn;
  String get clockInTime => _clockInTime;
  String get clockOutTime => _clockOutTime;
  String get totalTime => _totalTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isClockIn'] = _isClockIn;
    map['clockInTime'] = _clockInTime;
    map['clockOutTime'] = _clockOutTime;
    map['totalTime'] = _totalTime;
    return map;
  }

}