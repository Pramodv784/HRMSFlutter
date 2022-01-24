/// dataCategory : [{"categoryId":0,"categoryName":null,"category_Type":"HR","categoryTypeId":1,"roleId":0,"userId":0,"questionId":0,"quenstions":null,"questionScores":null,"roleType":null,"createdDate":"0001-01-01T00:00:00","updatedDate":"0001-01-01T00:00:00","categoryAverageScore":0},{"categoryId":0,"categoryName":null,"category_Type":"EMPLOYEE","categoryTypeId":2,"roleId":0,"userId":0,"questionId":0,"quenstions":null,"questionScores":null,"roleType":null,"createdDate":"0001-01-01T00:00:00","updatedDate":"0001-01-01T00:00:00","categoryAverageScore":0},{"categoryId":0,"categoryName":null,"category_Type":"MANAGMENT","categoryTypeId":3,"roleId":0,"userId":0,"questionId":0,"quenstions":null,"questionScores":null,"roleType":null,"createdDate":"0001-01-01T00:00:00","updatedDate":"0001-01-01T00:00:00","categoryAverageScore":0},{"categoryId":0,"categoryName":null,"category_Type":"OTHERS","categoryTypeId":4,"roleId":0,"userId":0,"questionId":0,"quenstions":null,"questionScores":null,"roleType":null,"createdDate":"0001-01-01T00:00:00","updatedDate":"0001-01-01T00:00:00","categoryAverageScore":0}]

class TeamRoleResponse {
  TeamRoleResponse({
      List<DataCategory> dataCategory,}){
    _dataCategory = dataCategory;
}

  TeamRoleResponse.fromJson(dynamic json) {
    if (json['dataCategory'] != null) {
      _dataCategory = [];
      json['dataCategory'].forEach((v) {
        _dataCategory.add(DataCategory.fromJson(v));
      });
    }
  }
  List<DataCategory> _dataCategory;

  List<DataCategory> get dataCategory => _dataCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dataCategory != null) {
      map['dataCategory'] = _dataCategory.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// categoryId : 0
/// categoryName : null
/// category_Type : "HR"
/// categoryTypeId : 1
/// roleId : 0
/// userId : 0
/// questionId : 0
/// quenstions : null
/// questionScores : null
/// roleType : null
/// createdDate : "0001-01-01T00:00:00"
/// updatedDate : "0001-01-01T00:00:00"
/// categoryAverageScore : 0

class DataCategory {
  DataCategory({
      int categoryId, 
      dynamic categoryName, 
      String categoryType, 
      int categoryTypeId, 
      int roleId, 
      int userId, 
      int questionId, 
      dynamic quenstions, 
      dynamic questionScores, 
      dynamic roleType, 
      String createdDate, 
      String updatedDate, 
      int categoryAverageScore,}){
    _categoryId = categoryId;
    _categoryName = categoryName;
    _categoryType = categoryType;
    _categoryTypeId = categoryTypeId;
    _roleId = roleId;
    _userId = userId;
    _questionId = questionId;
    _quenstions = quenstions;
    _questionScores = questionScores;
    _roleType = roleType;
    _createdDate = createdDate;
    _updatedDate = updatedDate;
    _categoryAverageScore = categoryAverageScore;
}

  DataCategory.fromJson(dynamic json) {
    _categoryId = json['categoryId'];
    _categoryName = json['categoryName'];
    _categoryType = json['category_Type'];
    _categoryTypeId = json['categoryTypeId'];
    _roleId = json['roleId'];
    _userId = json['userId'];
    _questionId = json['questionId'];
    _quenstions = json['quenstions'];
    _questionScores = json['questionScores'];
    _roleType = json['roleType'];
    _createdDate = json['createdDate'];
    _updatedDate = json['updatedDate'];
    _categoryAverageScore = json['categoryAverageScore'];
  }
  int _categoryId;
  dynamic _categoryName;
  String _categoryType;
  int _categoryTypeId;
  int _roleId;
  int _userId;
  int _questionId;
  dynamic _quenstions;
  dynamic _questionScores;
  dynamic _roleType;
  String _createdDate;
  String _updatedDate;
  int _categoryAverageScore;

  int get categoryId => _categoryId;
  dynamic get categoryName => _categoryName;
  String get categoryType => _categoryType;
  int get categoryTypeId => _categoryTypeId;
  int get roleId => _roleId;
  int get userId => _userId;
  int get questionId => _questionId;
  dynamic get quenstions => _quenstions;
  dynamic get questionScores => _questionScores;
  dynamic get roleType => _roleType;
  String get createdDate => _createdDate;
  String get updatedDate => _updatedDate;
  int get categoryAverageScore => _categoryAverageScore;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryId'] = _categoryId;
    map['categoryName'] = _categoryName;
    map['category_Type'] = _categoryType;
    map['categoryTypeId'] = _categoryTypeId;
    map['roleId'] = _roleId;
    map['userId'] = _userId;
    map['questionId'] = _questionId;
    map['quenstions'] = _quenstions;
    map['questionScores'] = _questionScores;
    map['roleType'] = _roleType;
    map['createdDate'] = _createdDate;
    map['updatedDate'] = _updatedDate;
    map['categoryAverageScore'] = _categoryAverageScore;
    return map;
  }

}