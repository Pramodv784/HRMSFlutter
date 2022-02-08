/// CaseTitle : "bugs"
/// CaseTypeId : "3"
/// Comment : "ababa"
/// CaseDescription : "Testing"
/// AssignedToId : "210"
/// CaseCreatedById : "156"
/// IsActive : "true"
/// IsDeleted : "false"
/// StartDate : "08/02/2022"
/// CompanyId : "1"
/// OrgId : "1"

class AddTicketRequest {
  AddTicketRequest({
      String caseTitle, 
      String caseTypeId, 
      String comment, 
      String caseDescription, 
      String assignedToId, 
      String caseCreatedById, 
      String isActive, 
      String isDeleted, 
      String startDate, 
      String companyId, 
      String orgId,}){
    _caseTitle = caseTitle;
    _caseTypeId = caseTypeId;
    _comment = comment;
    _caseDescription = caseDescription;
    _assignedToId = assignedToId;
    _caseCreatedById = caseCreatedById;
    _isActive = isActive;
    _isDeleted = isDeleted;
    _startDate = startDate;
    _companyId = companyId;
    _orgId = orgId;
}

  AddTicketRequest.fromJson(dynamic json) {
    _caseTitle = json['CaseTitle'];
    _caseTypeId = json['CaseTypeId'];
    _comment = json['Comment'];
    _caseDescription = json['CaseDescription'];
    _assignedToId = json['AssignedToId'];
    _caseCreatedById = json['CaseCreatedById'];
    _isActive = json['IsActive'];
    _isDeleted = json['IsDeleted'];
    _startDate = json['StartDate'];
    _companyId = json['CompanyId'];
    _orgId = json['OrgId'];
  }
  String _caseTitle;
  String _caseTypeId;
  String _comment;
  String _caseDescription;
  String _assignedToId;
  String _caseCreatedById;
  String _isActive;
  String _isDeleted;
  String _startDate;
  String _companyId;
  String _orgId;

  String get caseTitle => _caseTitle;
  String get caseTypeId => _caseTypeId;
  String get comment => _comment;
  String get caseDescription => _caseDescription;
  String get assignedToId => _assignedToId;
  String get caseCreatedById => _caseCreatedById;
  String get isActive => _isActive;
  String get isDeleted => _isDeleted;
  String get startDate => _startDate;
  String get companyId => _companyId;
  String get orgId => _orgId;


  set caseTitle(String value) {
    _caseTitle = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CaseTitle'] = _caseTitle;
    map['CaseTypeId'] = _caseTypeId;
    map['Comment'] = _comment;
    map['CaseDescription'] = _caseDescription;
    map['AssignedToId'] = _assignedToId;
    map['CaseCreatedById'] = _caseCreatedById;
    map['IsActive'] = _isActive;
    map['IsDeleted'] = _isDeleted;
    map['StartDate'] = _startDate;
    map['CompanyId'] = _companyId;
    map['OrgId'] = _orgId;
    return map;
  }

  set caseTypeId(String value) {
    _caseTypeId = value;
  }

  set comment(String value) {
    _comment = value;
  }

  set caseDescription(String value) {
    _caseDescription = value;
  }

  set assignedToId(String value) {
    _assignedToId = value;
  }

  set caseCreatedById(String value) {
    _caseCreatedById = value;
  }

  set isActive(String value) {
    _isActive = value;
  }

  set isDeleted(String value) {
    _isDeleted = value;
  }

  set startDate(String value) {
    _startDate = value;
  }

  set companyId(String value) {
    _companyId = value;
  }

  set orgId(String value) {
    _orgId = value;
  }
}