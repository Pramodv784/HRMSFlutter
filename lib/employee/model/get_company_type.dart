/// companyData : [{"companyId":1,"companyName":"MoreYeahs","primaryContactPerson":"Akhilesh Gandhi","primaryContactEmailId":"9399771515","primaryContactMobileNumber":"akhilesh@moreyeahs.com","isDeleted":false,"isActive":true}]

class GetCompanyType {
  GetCompanyType({
      List<CompanyData> companyData,}){
    _companyData = companyData;
}

  GetCompanyType.fromJson(dynamic json) {
    if (json['companyData'] != null) {
      _companyData = [];
      json['companyData'].forEach((v) {
        _companyData.add(CompanyData.fromJson(v));
      });
    }
  }
  List<CompanyData> _companyData;

  List<CompanyData> get companyData => _companyData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_companyData != null) {
      map['companyData'] = _companyData.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// companyId : 1
/// companyName : "MoreYeahs"
/// primaryContactPerson : "Akhilesh Gandhi"
/// primaryContactEmailId : "9399771515"
/// primaryContactMobileNumber : "akhilesh@moreyeahs.com"
/// isDeleted : false
/// isActive : true

class CompanyData {
  CompanyData({
      int companyId, 
      String companyName, 
      String primaryContactPerson, 
      String primaryContactEmailId, 
      String primaryContactMobileNumber, 
      bool isDeleted, 
      bool isActive,}){
    _companyId = companyId;
    _companyName = companyName;
    _primaryContactPerson = primaryContactPerson;
    _primaryContactEmailId = primaryContactEmailId;
    _primaryContactMobileNumber = primaryContactMobileNumber;
    _isDeleted = isDeleted;
    _isActive = isActive;
}

  CompanyData.fromJson(dynamic json) {
    _companyId = json['companyId'];
    _companyName = json['companyName'];
    _primaryContactPerson = json['primaryContactPerson'];
    _primaryContactEmailId = json['primaryContactEmailId'];
    _primaryContactMobileNumber = json['primaryContactMobileNumber'];
    _isDeleted = json['isDeleted'];
    _isActive = json['isActive'];
  }
  int _companyId;
  String _companyName;
  String _primaryContactPerson;
  String _primaryContactEmailId;
  String _primaryContactMobileNumber;
  bool _isDeleted;
  bool _isActive;

  int get companyId => _companyId;
  String get companyName => _companyName;
  String get primaryContactPerson => _primaryContactPerson;
  String get primaryContactEmailId => _primaryContactEmailId;
  String get primaryContactMobileNumber => _primaryContactMobileNumber;
  bool get isDeleted => _isDeleted;
  bool get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['companyId'] = _companyId;
    map['companyName'] = _companyName;
    map['primaryContactPerson'] = _primaryContactPerson;
    map['primaryContactEmailId'] = _primaryContactEmailId;
    map['primaryContactMobileNumber'] = _primaryContactMobileNumber;
    map['isDeleted'] = _isDeleted;
    map['isActive'] = _isActive;
    return map;
  }

}