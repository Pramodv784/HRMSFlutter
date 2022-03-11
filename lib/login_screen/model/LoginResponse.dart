/// message : "Login Success"
/// status : true
/// userId : 156
/// employeeId : 156
/// companyId : 0
/// orgId : 0
/// roleType : "HR Head"
/// fullName : "Admin"
/// primaryContact : ""
/// accesToken : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1laWQiOiI3OTlmNTQ4Mi01YmViLTQ2MGQtYWU1ZS03NjQ5NjMwYjY1ZTMiLCJ1bmlxdWVfbmFtZSI6WyJsc2hhcm1hQG1vcmV5ZWFocy5jb20iLCJsc2hhcm1hQG1vcmV5ZWFocy5jb20iXSwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS9hY2Nlc3Njb250cm9sc2VydmljZS8yMDEwLzA3L2NsYWltcy9pZGVudGl0eXByb3ZpZGVyIjoiQVNQLk5FVCBJZGVudGl0eSIsIkFzcE5ldC5JZGVudGl0eS5TZWN1cml0eVN0YW1wIjoiMzRjNmQxMjItYzUxOC00NzAyLTlmOTgtZGViMjYxMTAwOWM4IiwiRlRFIjoiMCIsImZpcnN0dGltZSI6InRydWUiLCJjb21waWQiOiIxIiwib3JnaWQiOiIxIiwiZW1haWwiOiJsc2hhcm1hQG1vcmV5ZWFocy5jb20iLCJGaXJzdE5hbWUiOiJMb3ZlbHkiLCJMYXN0TmFtZSI6IlNoYXJtYSIsIkVtYWlsIjoibHNoYXJtYUBtb3JleWVhaHMuY29tIiwiTGV2ZWwiOiI0IiwidXNlcmlkIjpbIjE1NiIsIjE1NiJdLCJSb2xlaWRzIjoiMTIwIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo1OTgyMiIsImF1ZCI6IjQxNGUxOTI3YTM4ODRmNjhhYmM3OWY3MjgzODM3ZmQxIiwiZXhwIjoxNjQ3MDcwMjcwLCJuYmYiOjE2NDY5ODM4NzB9.UJZYvdBGib84O7bci4hOWS0Y3JABZjGlDlpxmdDkx4w"

class LoginResponse {
  LoginResponse({
      String message, 
      bool status, 
      int userId, 
      int employeeId, 
      int companyId, 
      int orgId, 
      String roleType, 
      String fullName, 
      String primaryContact, 
      String accesToken,}){
    _message = message;
    _status = status;
    _userId = userId;
    _employeeId = employeeId;
    _companyId = companyId;
    _orgId = orgId;
    _roleType = roleType;
    _fullName = fullName;
    _primaryContact = primaryContact;
    _accesToken = accesToken;
}

  LoginResponse.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _userId = json['userId'];
    _employeeId = json['employeeId'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
    _roleType = json['roleType'];
    _fullName = json['fullName'];
    _primaryContact = json['primaryContact'];
    _accesToken = json['accesToken'];
  }
  String _message;
  bool _status;
  int _userId;
  int _employeeId;
  int _companyId;
  int _orgId;
  String _roleType;
  String _fullName;
  String _primaryContact;
  String _accesToken;

  String get message => _message;
  bool get status => _status;
  int get userId => _userId;
  int get employeeId => _employeeId;
  int get companyId => _companyId;
  int get orgId => _orgId;
  String get roleType => _roleType;
  String get fullName => _fullName;
  String get primaryContact => _primaryContact;
  String get accesToken => _accesToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    map['userId'] = _userId;
    map['employeeId'] = _employeeId;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    map['roleType'] = _roleType;
    map['fullName'] = _fullName;
    map['primaryContact'] = _primaryContact;
    map['accesToken'] = _accesToken;
    return map;
  }

}