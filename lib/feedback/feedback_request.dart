/// ReceiverEmployeeId : "13"
/// RatedByEmpId : "10"
/// YourFeedback : "He is excellent "
/// CategoryTypeId : "2"
/// FBScore : [{"CategoryId":6,"QuestionId":15,"QuestionScore":6}]

class FeedbackRequest {
  FeedbackRequest({
      int receiverEmployeeId,
      int ratedByEmpId,
      String yourFeedback,
      int categoryTypeId,
      List<FBScore> fBScore,}){
    _receiverEmployeeId = receiverEmployeeId;
    _ratedByEmpId = ratedByEmpId;
    _yourFeedback = yourFeedback;
    _categoryTypeId = categoryTypeId;
    _fBScore = fBScore;
}

  FeedbackRequest.fromJson(dynamic json) {
    _receiverEmployeeId = json['ReceiverEmployeeId'];
    _ratedByEmpId = json['RatedByEmpId'];
    _yourFeedback = json['YourFeedback'];
    _categoryTypeId = json['CategoryTypeId'];
    if (json['FBScore'] != null) {
      _fBScore = [];
      json['FBScore'].forEach((v) {
        _fBScore.add(FBScore.fromJson(v));
      });
    }
  }
  int _receiverEmployeeId;
  int _ratedByEmpId;
  String _yourFeedback;
  int _categoryTypeId;
  List<FBScore> _fBScore;

  int get receiverEmployeeId => _receiverEmployeeId;
  int get ratedByEmpId => _ratedByEmpId;
  String get yourFeedback => _yourFeedback;
  int get categoryTypeId => _categoryTypeId;

  set receiverEmployeeId(int value) {
    _receiverEmployeeId = value;
  }

  List<FBScore> get fBScore => _fBScore;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ReceiverEmployeeId'] = _receiverEmployeeId;
    map['RatedByEmpId'] = _ratedByEmpId;
    map['YourFeedback'] = _yourFeedback;
    map['CategoryTypeId'] = _categoryTypeId;
    if (_fBScore != null) {
      map['FBScore'] = _fBScore.map((v) => v.toJson()).toList();
    }
    return map;
  }

  set ratedByEmpId(int value) {
    _ratedByEmpId = value;
  }

  set yourFeedback(String value) {
    _yourFeedback = value;
  }

  set categoryTypeId(int value) {
    _categoryTypeId = value;
  }

  set fBScore(List<FBScore> value) {
    _fBScore = value;
  }
}

/// CategoryId : 6
/// QuestionId : 15
/// QuestionScore : 6

class FBScore {
  FBScore({
      int categoryId, 
      int questionId, 
      int questionScore,}){
    _categoryId = categoryId;
    _questionId = questionId;
    _questionScore = questionScore;
}

  FBScore.fromJson(dynamic json) {
    _categoryId = json['CategoryId'];
    _questionId = json['QuestionId'];
    _questionScore = json['QuestionScore'];
  }
  int _categoryId;
  int _questionId;
  int _questionScore;

  int get categoryId => _categoryId;
  int get questionId => _questionId;
  int get questionScore => _questionScore;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CategoryId'] = _categoryId;
    map['QuestionId'] = _questionId;
    map['QuestionScore'] = _questionScore;
    return map;
  }

}