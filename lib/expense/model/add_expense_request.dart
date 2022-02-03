/// expenseId : 33
/// categoryId : 2
/// employeeId : 156
/// projectId : 22
/// expenseTitle : "House"
/// expenseDate : "2022-02-10"
/// currencyName : "Rupees"
/// expenseAmount : 20000.0
/// merchantName : "Xyz"
/// billNumber : "12345"
/// comment : "abcc"
/// imageUrl : "https://media.gettyimages.com/photos/house-orange-isolated-home-simple-picture-id1273742730"
/// createdBy : 0
/// updatedBy : 0
/// createdOn : "2022-02-02T11:34:17.5371365+05:30"
/// updatedOn : null
/// isActive : true
/// isApprove : false
/// reasonToReject : null
/// isDeleted : false
/// message : null
/// companyId : 1
/// orgId : 1

class AddExpenseRequest {
  AddExpenseRequest({
      int expenseId, 
      int categoryId, 
      int employeeId, 
      int projectId, 
      String expenseTitle, 
      String expenseDate, 
      String currencyName, 
      double expenseAmount, 
      String merchantName, 
      String billNumber, 
      String comment, 
      String imageUrl, 
      int createdBy, 
      int updatedBy, 
      String createdOn, 
      dynamic updatedOn, 
      bool isActive, 
      bool isApprove, 
      dynamic reasonToReject, 
      bool isDeleted, 
      dynamic message, 
      int companyId, 
      int orgId,}){
    _expenseId = expenseId;
    _categoryId = categoryId;
    _employeeId = employeeId;
    _projectId = projectId;
    _expenseTitle = expenseTitle;
    _expenseDate = expenseDate;
    _currencyName = currencyName;
    _expenseAmount = expenseAmount;
    _merchantName = merchantName;
    _billNumber = billNumber;
    _comment = comment;
    _imageUrl = imageUrl;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
    _isActive = isActive;
    _isApprove = isApprove;
    _reasonToReject = reasonToReject;
    _isDeleted = isDeleted;
    _message = message;
    _companyId = companyId;
    _orgId = orgId;
}

  AddExpenseRequest.fromJson(dynamic json) {
    _expenseId = json['expenseId'];
    _categoryId = json['categoryId'];
    _employeeId = json['employeeId'];
    _projectId = json['projectId'];
    _expenseTitle = json['expenseTitle'];
    _expenseDate = json['expenseDate'];
    _currencyName = json['currencyName'];
    _expenseAmount = json['expenseAmount'];
    _merchantName = json['merchantName'];
    _billNumber = json['billNumber'];
    _comment = json['comment'];
    _imageUrl = json['imageUrl'];
    _createdBy = json['createdBy'];
    _updatedBy = json['updatedBy'];
    _createdOn = json['createdOn'];
    _updatedOn = json['updatedOn'];
    _isActive = json['isActive'];
    _isApprove = json['isApprove'];
    _reasonToReject = json['reasonToReject'];
    _isDeleted = json['isDeleted'];
    _message = json['message'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
  }
  int _expenseId;
  int _categoryId;
  int _employeeId;
  int _projectId;
  String _expenseTitle;
  String _expenseDate;
  String _currencyName;
  double _expenseAmount;
  String _merchantName;
  String _billNumber;
  String _comment;
  String _imageUrl;
  int _createdBy;
  int _updatedBy;
  String _createdOn;
  dynamic _updatedOn;
  bool _isActive;
  bool _isApprove;
  dynamic _reasonToReject;
  bool _isDeleted;
  dynamic _message;
  int _companyId;
  int _orgId;

  int get expenseId => _expenseId;
  int get categoryId => _categoryId;
  int get employeeId => _employeeId;
  int get projectId => _projectId;
  String get expenseTitle => _expenseTitle;
  String get expenseDate => _expenseDate;
  String get currencyName => _currencyName;
  double get expenseAmount => _expenseAmount;
  String get merchantName => _merchantName;
  String get billNumber => _billNumber;
  String get comment => _comment;
  String get imageUrl => _imageUrl;
  int get createdBy => _createdBy;
  int get updatedBy => _updatedBy;
  String get createdOn => _createdOn;
  dynamic get updatedOn => _updatedOn;
  bool get isActive => _isActive;
  bool get isApprove => _isApprove;
  dynamic get reasonToReject => _reasonToReject;
  bool get isDeleted => _isDeleted;
  dynamic get message => _message;
  int get companyId => _companyId;
  int get orgId => _orgId;


  set expenseId(int value) {
    _expenseId = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['expenseId'] = _expenseId;
    map['categoryId'] = _categoryId;
    map['employeeId'] = _employeeId;
    map['projectId'] = _projectId;
    map['expenseTitle'] = _expenseTitle;
    map['expenseDate'] = _expenseDate;
    map['currencyName'] = _currencyName;
    map['expenseAmount'] = _expenseAmount;
    map['merchantName'] = _merchantName;
    map['billNumber'] = _billNumber;
    map['comment'] = _comment;
    map['imageUrl'] = _imageUrl;
    map['createdBy'] = _createdBy;
    map['updatedBy'] = _updatedBy;
    map['createdOn'] = _createdOn;
    map['updatedOn'] = _updatedOn;
    map['isActive'] = _isActive;
    map['isApprove'] = _isApprove;
    map['reasonToReject'] = _reasonToReject;
    map['isDeleted'] = _isDeleted;
    map['message'] = _message;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    return map;
  }

  set categoryId(int value) {
    _categoryId = value;
  }

  set employeeId(int value) {
    _employeeId = value;
  }

  set projectId(int value) {
    _projectId = value;
  }

  set expenseTitle(String value) {
    _expenseTitle = value;
  }

  set expenseDate(String value) {
    _expenseDate = value;
  }

  set currencyName(String value) {
    _currencyName = value;
  }

  set expenseAmount(double value) {
    _expenseAmount = value;
  }

  set merchantName(String value) {
    _merchantName = value;
  }

  set billNumber(String value) {
    _billNumber = value;
  }

  set comment(String value) {
    _comment = value;
  }

  set imageUrl(String value) {
    _imageUrl = value;
  }

  set createdBy(int value) {
    _createdBy = value;
  }

  set updatedBy(int value) {
    _updatedBy = value;
  }

  set createdOn(String value) {
    _createdOn = value;
  }

  set updatedOn(dynamic value) {
    _updatedOn = value;
  }

  set isActive(bool value) {
    _isActive = value;
  }

  set isApprove(bool value) {
    _isApprove = value;
  }

  set reasonToReject(dynamic value) {
    _reasonToReject = value;
  }

  set isDeleted(bool value) {
    _isDeleted = value;
  }

  set message(dynamic value) {
    _message = value;
  }

  set companyId(int value) {
    _companyId = value;
  }

  set orgId(int value) {
    _orgId = value;
  }
}