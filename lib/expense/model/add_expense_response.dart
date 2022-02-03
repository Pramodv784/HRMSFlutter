/// status : "OK"
/// message : "Expense added Successfully!"
/// expense : {"expenseId":33,"categoryId":2,"employeeId":156,"projectId":22,"expenseTitle":"House","expenseDate":"2022-02-10","currencyName":"Rupees","expenseAmount":20000.0,"merchantName":"Xyz","billNumber":"12345","comment":"abcc","imageUrl":"https://media.gettyimages.com/photos/house-orange-isolated-home-simple-picture-id1273742730","createdBy":0,"updatedBy":0,"createdOn":"2022-02-02T11:34:17.5371365+05:30","updatedOn":null,"isActive":true,"isApprove":false,"reasonToReject":null,"isDeleted":false,"message":null,"companyId":1,"orgId":1}

class AddExpenseResponse {
  AddExpenseResponse({
      String status, 
      String message, 
      Expense expense,}){
    _status = status;
    _message = message;
    _expense = expense;
}

  AddExpenseResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _expense = json['expense'] != null ? Expense.fromJson(json['expense']) : null;
  }
  String _status;
  String _message;
  Expense _expense;

  String get status => _status;
  String get message => _message;
  Expense get expense => _expense;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_expense != null) {
      map['expense'] = _expense.toJson();
    }
    return map;
  }

}

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

class Expense {
  Expense({
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

  Expense.fromJson(dynamic json) {
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

}