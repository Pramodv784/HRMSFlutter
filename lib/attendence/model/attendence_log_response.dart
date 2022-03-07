/// message : "Attendance List"
/// status : true
/// data : [{"dates":"2022-03-02T00:00:00","dateString":"Wednesday, March 2, 2022","clockInTime":"12:29:03 PM","clockOutTime":"12:35:08 PM","totalTime":"00:06:05","logDetails":"12:29:03 PM to 12:35:08 PM"}]

class AttendenceLogResponse {
  AttendenceLogResponse({
      String message, 
      bool status, 
      List<Data> data,}){
    _message = message;
    _status = status;
    _data = data;
}

  AttendenceLogResponse.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }
  String _message;
  bool _status;
  List<Data> _data;

  String get message => _message;
  bool get status => _status;
  List<Data> get data => _data;

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

/// dates : "2022-03-02T00:00:00"
/// dateString : "Wednesday, March 2, 2022"
/// clockInTime : "12:29:03 PM"
/// clockOutTime : "12:35:08 PM"
/// totalTime : "00:06:05"
/// logDetails : "12:29:03 PM to 12:35:08 PM"

class Data {
  Data({
      String dates, 
      String dateString, 
      String clockInTime, 
      String clockOutTime, 
      String totalTime, 
      String logDetails,}){
    _dates = dates;
    _dateString = dateString;
    _clockInTime = clockInTime;
    _clockOutTime = clockOutTime;
    _totalTime = totalTime;
    _logDetails = logDetails;
}

  Data.fromJson(dynamic json) {
    _dates = json['dates'];
    _dateString = json['dateString'];
    _clockInTime = json['clockInTime'];
    _clockOutTime = json['clockOutTime'];
    _totalTime = json['totalTime'];
    _logDetails = json['logDetails'];
  }
  String _dates;
  String _dateString;
  String _clockInTime;
  String _clockOutTime;
  String _totalTime;
  String _logDetails;

  String get dates => _dates;
  String get dateString => _dateString;
  String get clockInTime => _clockInTime;
  String get clockOutTime => _clockOutTime;
  String get totalTime => _totalTime;
  String get logDetails => _logDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dates'] = _dates;
    map['dateString'] = _dateString;
    map['clockInTime'] = _clockInTime;
    map['clockOutTime'] = _clockOutTime;
    map['totalTime'] = _totalTime;
    map['logDetails'] = _logDetails;
    return map;
  }

}