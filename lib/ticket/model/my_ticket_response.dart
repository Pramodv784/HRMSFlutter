/// caseId : 17
/// caseTitle : "title"
/// caseType : "IT Support"
/// assignedTo : "Nitika Sadele"
/// assignedBy : "Lovely Sharma"
/// email : "lsharma@moreyeahs.com"
/// caseStatusId : 12
/// caseStatus : "Open"
/// caseDescription : null
/// comment : "desc"
/// caseTypeId : 1
/// assignedToId : 0
/// caseCreatedById : 0

class MyTicketResponse {
  MyTicketResponse({
      int caseId, 
      String caseTitle, 
      String caseType, 
      String assignedTo, 
      String assignedBy, 
      String email, 
      int caseStatusId, 
      String caseStatus, 
      dynamic caseDescription, 
      String comment, 
      int caseTypeId, 
      int assignedToId, 
      int caseCreatedById,}){
    _caseId = caseId;
    _caseTitle = caseTitle;
    _caseType = caseType;
    _assignedTo = assignedTo;
    _assignedBy = assignedBy;
    _email = email;
    _caseStatusId = caseStatusId;
    _caseStatus = caseStatus;
    _caseDescription = caseDescription;
    _comment = comment;
    _caseTypeId = caseTypeId;
    _assignedToId = assignedToId;
    _caseCreatedById = caseCreatedById;
}

  MyTicketResponse.fromJson(dynamic json) {
    _caseId = json['caseId'];
    _caseTitle = json['caseTitle'];
    _caseType = json['caseType'];
    _assignedTo = json['assignedTo'];
    _assignedBy = json['assignedBy'];
    _email = json['email'];
    _caseStatusId = json['caseStatusId'];
    _caseStatus = json['caseStatus'];
    _caseDescription = json['caseDescription'];
    _comment = json['comment'];
    _caseTypeId = json['caseTypeId'];
    _assignedToId = json['assignedToId'];
    _caseCreatedById = json['caseCreatedById'];
  }
  int _caseId;
  String _caseTitle;
  String _caseType;
  String _assignedTo;
  String _assignedBy;
  String _email;
  int _caseStatusId;
  String _caseStatus;
  dynamic _caseDescription;
  String _comment;
  int _caseTypeId;
  int _assignedToId;
  int _caseCreatedById;

  int get caseId => _caseId;
  String get caseTitle => _caseTitle;
  String get caseType => _caseType;
  String get assignedTo => _assignedTo;
  String get assignedBy => _assignedBy;
  String get email => _email;
  int get caseStatusId => _caseStatusId;
  String get caseStatus => _caseStatus;
  dynamic get caseDescription => _caseDescription;
  String get comment => _comment;
  int get caseTypeId => _caseTypeId;
  int get assignedToId => _assignedToId;
  int get caseCreatedById => _caseCreatedById;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['caseId'] = _caseId;
    map['caseTitle'] = _caseTitle;
    map['caseType'] = _caseType;
    map['assignedTo'] = _assignedTo;
    map['assignedBy'] = _assignedBy;
    map['email'] = _email;
    map['caseStatusId'] = _caseStatusId;
    map['caseStatus'] = _caseStatus;
    map['caseDescription'] = _caseDescription;
    map['comment'] = _comment;
    map['caseTypeId'] = _caseTypeId;
    map['assignedToId'] = _assignedToId;
    map['caseCreatedById'] = _caseCreatedById;
    return map;
  }

}