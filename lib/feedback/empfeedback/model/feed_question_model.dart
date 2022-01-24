/// dataCategory : [{"categoryId":1198,"categoryName":"09-12-21","category_Type":null,"categoryTypeId":2,"roleId":30,"userId":0,"questionId":0,"quenstions":[{"questionId":1374,"question":"Type 1","categoryId":1198,"createdDate":"0001-01-01T00:00:00","updatedDate":"0001-01-01T00:00:00","scoreRating":5,"companyId":0,"orgId":0},{"questionId":1375,"question":"Test 2","categoryId":1198,"createdDate":"0001-01-01T00:00:00","updatedDate":"0001-01-01T00:00:00","scoreRating":5,"companyId":0,"orgId":0}],"questionScores":null,"roleType":null,"createdDate":"0001-01-01T00:00:00","updatedDate":"0001-01-01T00:00:00","categoryAverageScore":0}]

class FeedQuestionModel {
  FeedQuestionModel({
      List<DataCategory> dataCategory,}){
    _dataCategory = dataCategory;
}

  FeedQuestionModel.fromJson(dynamic json) {
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

/// categoryId : 1198
/// categoryName : "09-12-21"
/// category_Type : null
/// categoryTypeId : 2
/// roleId : 30
/// userId : 0
/// questionId : 0
/// quenstions : [{"questionId":1374,"question":"Type 1","categoryId":1198,"createdDate":"0001-01-01T00:00:00","updatedDate":"0001-01-01T00:00:00","scoreRating":5,"companyId":0,"orgId":0},{"questionId":1375,"question":"Test 2","categoryId":1198,"createdDate":"0001-01-01T00:00:00","updatedDate":"0001-01-01T00:00:00","scoreRating":5,"companyId":0,"orgId":0}]
/// questionScores : null
/// roleType : null
/// createdDate : "0001-01-01T00:00:00"
/// updatedDate : "0001-01-01T00:00:00"
/// categoryAverageScore : 0

class DataCategory {
  DataCategory({
      int categoryId, 
      String categoryName, 
      dynamic categoryType, 
      int categoryTypeId, 
      int roleId, 
      int userId, 
      int questionId, 
      List<Quenstions> quenstions, 
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
    if (json['quenstions'] != null) {
      _quenstions = [];
      json['quenstions'].forEach((v) {
        _quenstions.add(Quenstions.fromJson(v));
      });
    }
    _questionScores = json['questionScores'];
    _roleType = json['roleType'];
    _createdDate = json['createdDate'];
    _updatedDate = json['updatedDate'];
    _categoryAverageScore = json['categoryAverageScore'];
  }
  int _categoryId;
  String _categoryName;
  dynamic _categoryType;
  int _categoryTypeId;
  int _roleId;
  int _userId;
  int _questionId;
  List<Quenstions> _quenstions;
  dynamic _questionScores;
  dynamic _roleType;
  String _createdDate;
  String _updatedDate;
  int _categoryAverageScore;

  int get categoryId => _categoryId;
  String get categoryName => _categoryName;
  dynamic get categoryType => _categoryType;
  int get categoryTypeId => _categoryTypeId;
  int get roleId => _roleId;
  int get userId => _userId;
  int get questionId => _questionId;
  List<Quenstions> get quenstions => _quenstions;
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
    if (_quenstions != null) {
      map['quenstions'] = _quenstions.map((v) => v.toJson()).toList();
    }
    map['questionScores'] = _questionScores;
    map['roleType'] = _roleType;
    map['createdDate'] = _createdDate;
    map['updatedDate'] = _updatedDate;
    map['categoryAverageScore'] = _categoryAverageScore;
    return map;
  }

}

/// questionId : 1374
/// question : "Type 1"
/// categoryId : 1198
/// createdDate : "0001-01-01T00:00:00"
/// updatedDate : "0001-01-01T00:00:00"
/// scoreRating : 5
/// companyId : 0
/// orgId : 0

class Quenstions {
  Quenstions({
      int questionId, 
      String question, 
      int categoryId, 
      String createdDate, 
      String updatedDate, 
      int scoreRating, 
      int companyId, 
      int orgId,}){
    _questionId = questionId;
    _question = question;
    _categoryId = categoryId;
    _createdDate = createdDate;
    _updatedDate = updatedDate;
    _scoreRating = scoreRating;
    _companyId = companyId;
    _orgId = orgId;
}

  Quenstions.fromJson(dynamic json) {
    _questionId = json['questionId'];
    _question = json['question'];
    _categoryId = json['categoryId'];
    _createdDate = json['createdDate'];
    _updatedDate = json['updatedDate'];
    _scoreRating = json['scoreRating'];
    _companyId = json['companyId'];
    _orgId = json['orgId'];
  }
  int _questionId;
  String _question;
  int _categoryId;
  String _createdDate;
  String _updatedDate;
  int _scoreRating;
  int _companyId;
  int _orgId;

  int get questionId => _questionId;
  String get question => _question;
  int get categoryId => _categoryId;
  String get createdDate => _createdDate;
  String get updatedDate => _updatedDate;
  int get scoreRating => _scoreRating;
  int get companyId => _companyId;
  int get orgId => _orgId;


  set questionId(int value) {
    _questionId = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['questionId'] = _questionId;
    map['question'] = _question;
    map['categoryId'] = _categoryId;
    map['createdDate'] = _createdDate;
    map['updatedDate'] = _updatedDate;
    map['scoreRating'] = _scoreRating;
    map['companyId'] = _companyId;
    map['orgId'] = _orgId;
    return map;
  }

  set question(String value) {
    _question = value;
  }

  set categoryId(int value) {
    _categoryId = value;
  }

  set createdDate(String value) {
    _createdDate = value;
  }

  set updatedDate(String value) {
    _updatedDate = value;
  }

  set scoreRating(int value) {
    _scoreRating = value;
  }

  set companyId(int value) {
    _companyId = value;
  }

  set orgId(int value) {
    _orgId = value;
  }
}