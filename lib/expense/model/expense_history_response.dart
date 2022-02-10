/// status : "OK"
/// message : "Expense list Found"
/// expenseList : [{"expenseId":6,"categoryId":3,"employeeId":0,"appliedBy":null,"projectId":22,"projectName":null,"expenseTitle":"lghjfgbhdfd","expenseDate":"2022-01-10T18:30:00.000Z","currencyName":"Rupees","expenseAmount":52000.0,"merchantName":"Pankaj Gupta555555","billNumber":"555555","comment":"kkkkjufdd","imageUrl":null,"createdBy":0,"updatedBy":0,"createdOn":"2022-01-19T11:15:31.387","updatedOn":null,"isActive":true,"isApprove":false,"expenseStatus":"Reject","reasonToReject":null,"isDeleted":false,"message":null,"companyId":1,"orgId":1}]

class ExpenseHistoryResponse {
  ExpenseHistoryResponse({
      String status, 
      String message, 
      List<ExpenseList> expenseList,}){
    _status = status;
    _message = message;
    _expenseList = expenseList;
}

  ExpenseHistoryResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['expenseList'] != null) {
      _expenseList = [];
      json['expenseList'].forEach((v) {
        _expenseList.add(ExpenseList.fromJson(v));
      });
    }
  }
  String _status;
  String _message;
  List<ExpenseList> _expenseList;

  String get status => _status;
  String get message => _message;
  List<ExpenseList> get expenseList => _expenseList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_expenseList != null) {
      map['expenseList'] = _expenseList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// expenseId : 6
/// categoryId : 3
/// employeeId : 0
/// appliedBy : null
/// projectId : 22
/// projectName : null
/// expenseTitle : "lghjfgbhdfd"
/// expenseDate : "2022-01-10T18:30:00.000Z"
/// currencyName : "Rupees"
/// expenseAmount : 52000.0
/// merchantName : "Pankaj Gupta555555"
/// billNumber : "555555"
/// comment : "kkkkjufdd"
/// imageUrl : null
/// createdBy : 0
/// updatedBy : 0
/// createdOn : "2022-01-19T11:15:31.387"
/// updatedOn : null
/// isActive : true
/// isApprove : false
/// expenseStatus : "Reject"
/// reasonToReject : null
/// isDeleted : false
/// message : null
/// companyId : 1
/// orgId : 1

class ExpenseList {
  ExpenseList({
      int expenseId, 
      int categoryId, 
      int employeeId, 
      dynamic appliedBy, 
      int projectId, 
      dynamic projectName, 
      String expenseTitle, 
      String expenseDate, 
      String currencyName, 
      double expenseAmount, 
      String merchantName, 
      String billNumber, 
      String comment, 
      dynamic imageUrl, 
      int createdBy, 
      int updatedBy, 
      String createdOn, 
      dynamic updatedOn, 
      bool isActive, 
      bool isApprove, 
      String expenseStatus, 
      dynamic reasonToReject, 
      bool isDeleted, 
      dynamic message, 
      int companyId, 
      int orgId,}){
    _expenseId = expenseId;
    _categoryId = categoryId;
    _employeeId = employeeId;
    _appliedBy = appliedBy;
    _projectId = projectId;
    _projectName = projectName;
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
    _expenseStatus = expenseStatus;
    _reasonToReject = reasonToReject;
    _isDeleted = isDeleted;
    _message = message;
    _companyId = companyId;
    _orgId = orgId;
}

  ExpenseList.fromJson(dynamic json) {
    _expenseId = json['expenseId'];
    _categoryId = json['categoryId'];
    _employeeId = json['employeeId'];
    _appliedBy = json['appliedBy'];
    _projectId = json['projectId'];
    _projectName = json['projectName'];
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
    _expenseStatus = json['expenseStatus'];
    _reasonToReject = json['reasonToReject'];
    _isDeleted = json['isDeleted'];
    _message = json['message'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
  }
  int _expenseId;
  int _categoryId;
  int _employeeId;
  dynamic _appliedBy;
  int _projectId;
  dynamic _projectName;
  String _expenseTitle;
  String _expenseDate;
  String _currencyName;
  double _expenseAmount;
  String _merchantName;
  String _billNumber;
  String _comment;
  dynamic _imageUrl;
  int _createdBy;
  int _updatedBy;
  String _createdOn;
  dynamic _updatedOn;
  bool _isActive;
  bool _isApprove;
  String _expenseStatus;
  dynamic _reasonToReject;
  bool _isDeleted;
  dynamic _message;
  int _companyId;
  int _orgId;

  int get expenseId => _expenseId;
  int get categoryId => _categoryId;
  int get employeeId => _employeeId;
  dynamic get appliedBy => _appliedBy;
  int get projectId => _projectId;
  dynamic get projectName => _projectName;
  String get expenseTitle => _expenseTitle;
  String get expenseDate => _expenseDate;
  String get currencyName => _currencyName;
  double get expenseAmount => _expenseAmount;
  String get merchantName => _merchantName;
  String get billNumber => _billNumber;
  String get comment => _comment;
  dynamic get imageUrl => _imageUrl;
  int get createdBy => _createdBy;
  int get updatedBy => _updatedBy;
  String get createdOn => _createdOn;
  dynamic get updatedOn => _updatedOn;
  bool get isActive => _isActive;
  bool get isApprove => _isApprove;
  String get expenseStatus => _expenseStatus;
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
    map['appliedBy'] = _appliedBy;
    map['projectId'] = _projectId;
    map['projectName'] = _projectName;
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
    map['expenseStatus'] = _expenseStatus;
    map['reasonToReject'] = _reasonToReject;
    map['isDeleted'] = _isDeleted;
    map['message'] = _message;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    return map;
  }

}