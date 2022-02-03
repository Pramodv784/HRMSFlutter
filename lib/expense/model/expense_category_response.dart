/// status : "OK"
/// message : "Expense Found"
/// expenseCategoryList : [{"categoryId":3,"categoryName":"Misc","iconImageUrl":null,"imageUrl":null,"createdBy":1,"updatedBy":1,"createdOn":"2022-01-14T00:00:00","updatedOn":null,"isActive":true,"isDeleted":false,"message":null,"companyId":1,"orgId":0}]

class ExpenseCategoryResponse {
  ExpenseCategoryResponse({
      String status, 
      String message, 
      List<ExpenseCategoryList> expenseCategoryList,}){
    _status = status;
    _message = message;
    _expenseCategoryList = expenseCategoryList;
}

  ExpenseCategoryResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['expenseCategoryList'] != null) {
      _expenseCategoryList = [];
      json['expenseCategoryList'].forEach((v) {
        _expenseCategoryList.add(ExpenseCategoryList.fromJson(v));
      });
    }
  }
  String _status;
  String _message;
  List<ExpenseCategoryList> _expenseCategoryList;

  String get status => _status;
  String get message => _message;
  List<ExpenseCategoryList> get expenseCategoryList => _expenseCategoryList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_expenseCategoryList != null) {
      map['expenseCategoryList'] = _expenseCategoryList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// categoryId : 3
/// categoryName : "Misc"
/// iconImageUrl : null
/// imageUrl : null
/// createdBy : 1
/// updatedBy : 1
/// createdOn : "2022-01-14T00:00:00"
/// updatedOn : null
/// isActive : true
/// isDeleted : false
/// message : null
/// companyId : 1
/// orgId : 0

class ExpenseCategoryList {
  ExpenseCategoryList({
      int categoryId, 
      String categoryName, 
      dynamic iconImageUrl, 
      dynamic imageUrl, 
      int createdBy, 
      int updatedBy, 
      String createdOn, 
      dynamic updatedOn, 
      bool isActive, 
      bool isDeleted, 
      dynamic message, 
      int companyId, 
      int orgId,}){
    _categoryId = categoryId;
    _categoryName = categoryName;
    _iconImageUrl = iconImageUrl;
    _imageUrl = imageUrl;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
    _isActive = isActive;
    _isDeleted = isDeleted;
    _message = message;
    _companyId = companyId;
    _orgId = orgId;
}

  ExpenseCategoryList.fromJson(dynamic json) {
    _categoryId = json['categoryId'];
    _categoryName = json['categoryName'];
    _iconImageUrl = json['iconImageUrl'];
    _imageUrl = json['imageUrl'];
    _createdBy = json['createdBy'];
    _updatedBy = json['updatedBy'];
    _createdOn = json['createdOn'];
    _updatedOn = json['updatedOn'];
    _isActive = json['isActive'];
    _isDeleted = json['isDeleted'];
    _message = json['message'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
  }
  int _categoryId;
  String _categoryName;
  dynamic _iconImageUrl;
  dynamic _imageUrl;
  int _createdBy;
  int _updatedBy;
  String _createdOn;
  dynamic _updatedOn;
  bool _isActive;
  bool _isDeleted;
  dynamic _message;
  int _companyId;
  int _orgId;

  int get categoryId => _categoryId;
  String get categoryName => _categoryName;
  dynamic get iconImageUrl => _iconImageUrl;
  dynamic get imageUrl => _imageUrl;
  int get createdBy => _createdBy;
  int get updatedBy => _updatedBy;
  String get createdOn => _createdOn;
  dynamic get updatedOn => _updatedOn;
  bool get isActive => _isActive;
  bool get isDeleted => _isDeleted;
  dynamic get message => _message;
  int get companyId => _companyId;
  int get orgId => _orgId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryId'] = _categoryId;
    map['categoryName'] = _categoryName;
    map['iconImageUrl'] = _iconImageUrl;
    map['imageUrl'] = _imageUrl;
    map['createdBy'] = _createdBy;
    map['updatedBy'] = _updatedBy;
    map['createdOn'] = _createdOn;
    map['updatedOn'] = _updatedOn;
    map['isActive'] = _isActive;
    map['isDeleted'] = _isDeleted;
    map['message'] = _message;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    return map;
  }

}