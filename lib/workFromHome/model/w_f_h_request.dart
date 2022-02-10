/// EmployeeId : 4
/// StartDate : "29-8-2022"
/// EndDate : "02-8-2022"
/// NumberOfDays : 4
/// Comment : "Personal Reason"

class WFHRequest {
  WFHRequest({
      int employeeId, 
      String startDate, 
      String endDate, 
      int numberOfDays, 
      String comment,}){
    _employeeId = employeeId;
    _startDate = startDate;
    _endDate = endDate;
    _numberOfDays = numberOfDays;
    _comment = comment;
}

  WFHRequest.fromJson(dynamic json) {
    _employeeId = json['EmployeeId'];
    _startDate = json['StartDate'];
    _endDate = json['EndDate'];
    _numberOfDays = json['NumberOfDays'];
    _comment = json['Comment'];
  }
  int _employeeId;
  String _startDate;
  String _endDate;
  int _numberOfDays;
  String _comment;

  int get employeeId => _employeeId;
  String get startDate => _startDate;
  String get endDate => _endDate;
  int get numberOfDays => _numberOfDays;
  String get comment => _comment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['EmployeeId'] = _employeeId;
    map['StartDate'] = _startDate;
    map['EndDate'] = _endDate;
    map['NumberOfDays'] = _numberOfDays;
    map['Comment'] = _comment;
    return map;
  }

  set employeeId(int value) {
    _employeeId = value;
  }

  set comment(String value) {
    _comment = value;
  }

  set numberOfDays(int value) {
    _numberOfDays = value;
  }

  set endDate(String value) {
    _endDate = value;
  }

  set startDate(String value) {
    _startDate = value;
  }
}