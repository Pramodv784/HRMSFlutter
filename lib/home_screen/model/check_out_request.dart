/// EmployeeId : "4"
/// date : "2022-15-02T00:00:00"
/// clockOut : "12:00"
/// totalTime : "1:30"

class CheckOutRequest {
  CheckOutRequest({
      String employeeId, 
      String date, 
      String clockOut, 
      String totalTime,}){
    _employeeId = employeeId;
    _date = date;
    _clockOut = clockOut;
    _totalTime = totalTime;
}

  CheckOutRequest.fromJson(dynamic json) {
    _employeeId = json['EmployeeId'];
    _date = json['date'];
    _clockOut = json['clockOut'];
    _totalTime = json['totalTime'];
  }
  String _employeeId;
  String _date;
  String _clockOut;
  String _totalTime;

  String get employeeId => _employeeId;
  String get date => _date;
  String get clockOut => _clockOut;
  String get totalTime => _totalTime;


  set employeeId(String value) {
    _employeeId = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['EmployeeId'] = _employeeId;
    map['date'] = _date;
    map['clockOut'] = _clockOut;
    map['totalTime'] = _totalTime;
    return map;
  }

  set date(String value) {
    _date = value;
  }

  set clockOut(String value) {
    _clockOut = value;
  }

  set totalTime(String value) {
    _totalTime = value;
  }
}