/// Status : "OK"
/// ErrorMessage : ""
/// Data : {"Message":"Succesful","Flag":true,"data":{"filepath":"https://UATCaradmin.moreyeahs.in/UploadImages/Car/scaled_d48e06fc-e722-40e4-95be-5b726ee0d5dd340444873134760444820220107052803PM.jpg"}}
/// Timestamp : "2022-01-07T17:28:03.797+05:30"

class UploadImageResponse {
  UploadImageResponse({
      String status, 
      String errorMessage, 
      Data data, 
      String timestamp,}){
    _status = status;
    _errorMessage = errorMessage;
    _data = data;
    _timestamp = timestamp;
}

  UploadImageResponse.fromJson(dynamic json) {
    _status = json['Status'];
    _errorMessage = json['ErrorMessage'];
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    _timestamp = json['Timestamp'];
  }
  String _status;
  String _errorMessage;
  Data _data;
  String _timestamp;

  String get status => _status;
  String get errorMessage => _errorMessage;
  Data get data => _data;
  String get timestamp => _timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    map['ErrorMessage'] = _errorMessage;
    if (_data != null) {
      map['Data'] = _data.toJson();
    }
    map['Timestamp'] = _timestamp;
    return map;
  }

}

/// Message : "Succesful"
/// Flag : true
/// data : {"filepath":"https://UATCaradmin.moreyeahs.in/UploadImages/Car/scaled_d48e06fc-e722-40e4-95be-5b726ee0d5dd340444873134760444820220107052803PM.jpg"}

class Data {
  Data({
      String message, 
      bool flag,
    ImageData data,}){
    _message = message;
    _flag = flag;
    _data = data;
}

  Data.fromJson(dynamic json) {
    _message = json['Message'];
    _flag = json['Flag'];
    _data = json['data'] != null ? ImageData.fromJson(json['data']) : null;
  }
  String _message;
  bool _flag;
  ImageData _data;

  String get message => _message;
  bool get flag => _flag;
  ImageData get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Message'] = _message;
    map['Flag'] = _flag;
    if (_data != null) {
      map['data'] = _data.toJson();
    }
    return map;
  }

}

/// filepath : "https://UATCaradmin.moreyeahs.in/UploadImages/Car/scaled_d48e06fc-e722-40e4-95be-5b726ee0d5dd340444873134760444820220107052803PM.jpg"

class ImageData {
  Data({
      String filepath,}){
    _filepath = filepath;
}

  ImageData.fromJson(dynamic json) {
    _filepath = json['filepath'];
  }
  String _filepath;

  String get filepath => _filepath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['filepath'] = _filepath;
    return map;
  }

}