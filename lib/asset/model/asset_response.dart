/// status : "Ok"
/// message : "Asset data list found"
/// myAssetList : [{"assetId":12,"assetName":"keyboard","categoryId":4,"categoryName":"System","subCategoryId":2,"subCategoryName":"Systemasset","assignedTo":146,"assignedToName":"Roopesh Mandloi","location":"indore","conditionId":1,"conditionName":"Good","status":null,"notAvailableReasonId":0,"reasonName":null}]

class AssetResponse {
  AssetResponse({
      String status, 
      String message, 
      List<MyAssetList> myAssetList,}){
    _status = status;
    _message = message;
    _myAssetList = myAssetList;
}

  AssetResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['myAssetList'] != null) {
      _myAssetList = [];
      json['myAssetList'].forEach((v) {
        _myAssetList.add(MyAssetList.fromJson(v));
      });
    }
  }
  String _status;
  String _message;
  List<MyAssetList> _myAssetList;

  String get status => _status;
  String get message => _message;
  List<MyAssetList> get myAssetList => _myAssetList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_myAssetList != null) {
      map['myAssetList'] = _myAssetList.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// assetId : 12
/// assetName : "keyboard"
/// categoryId : 4
/// categoryName : "System"
/// subCategoryId : 2
/// subCategoryName : "Systemasset"
/// assignedTo : 146
/// assignedToName : "Roopesh Mandloi"
/// location : "indore"
/// conditionId : 1
/// conditionName : "Good"
/// status : null
/// notAvailableReasonId : 0
/// reasonName : null

class MyAssetList {
  MyAssetList({
      int assetId, 
      String assetName, 
      int categoryId, 
      String categoryName, 
      int subCategoryId, 
      String subCategoryName, 
      int assignedTo, 
      String assignedToName, 
      String location, 
      int conditionId, 
      String conditionName, 
      dynamic status, 
      int notAvailableReasonId, 
      dynamic reasonName,}){
    _assetId = assetId;
    _assetName = assetName;
    _categoryId = categoryId;
    _categoryName = categoryName;
    _subCategoryId = subCategoryId;
    _subCategoryName = subCategoryName;
    _assignedTo = assignedTo;
    _assignedToName = assignedToName;
    _location = location;
    _conditionId = conditionId;
    _conditionName = conditionName;
    _status = status;
    _notAvailableReasonId = notAvailableReasonId;
    _reasonName = reasonName;
}

  MyAssetList.fromJson(dynamic json) {
    _assetId = json['assetId'];
    _assetName = json['assetName'];
    _categoryId = json['categoryId'];
    _categoryName = json['categoryName'];
    _subCategoryId = json['subCategoryId'];
    _subCategoryName = json['subCategoryName'];
    _assignedTo = json['assignedTo'];
    _assignedToName = json['assignedToName'];
    _location = json['location'];
    _conditionId = json['conditionId'];
    _conditionName = json['conditionName'];
    _status = json['status'];
    _notAvailableReasonId = json['notAvailableReasonId'];
    _reasonName = json['reasonName'];
  }
  int _assetId;
  String _assetName;
  int _categoryId;
  String _categoryName;
  int _subCategoryId;
  String _subCategoryName;
  int _assignedTo;
  String _assignedToName;
  String _location;
  int _conditionId;
  String _conditionName;
  dynamic _status;
  int _notAvailableReasonId;
  dynamic _reasonName;

  int get assetId => _assetId;
  String get assetName => _assetName;
  int get categoryId => _categoryId;
  String get categoryName => _categoryName;
  int get subCategoryId => _subCategoryId;
  String get subCategoryName => _subCategoryName;
  int get assignedTo => _assignedTo;
  String get assignedToName => _assignedToName;
  String get location => _location;
  int get conditionId => _conditionId;
  String get conditionName => _conditionName;
  dynamic get status => _status;
  int get notAvailableReasonId => _notAvailableReasonId;
  dynamic get reasonName => _reasonName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['assetId'] = _assetId;
    map['assetName'] = _assetName;
    map['categoryId'] = _categoryId;
    map['categoryName'] = _categoryName;
    map['subCategoryId'] = _subCategoryId;
    map['subCategoryName'] = _subCategoryName;
    map['assignedTo'] = _assignedTo;
    map['assignedToName'] = _assignedToName;
    map['location'] = _location;
    map['conditionId'] = _conditionId;
    map['conditionName'] = _conditionName;
    map['status'] = _status;
    map['notAvailableReasonId'] = _notAvailableReasonId;
    map['reasonName'] = _reasonName;
    return map;
  }

}