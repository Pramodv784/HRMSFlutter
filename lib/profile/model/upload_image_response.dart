/// message : "Successful"
/// flag : true
/// data : {"filepath":"http://a93d-2409-4043-2e8d-e75b-404d-60f-88af-a121.ngrok.ioScreenshots","fileurl":"http://a93d-2409-4043-2e8d-e75b-404d-60f-88af-a121.ngrok.ioScreenshots/Moreyeahslogo_White_Logo 120220202010738PM.png"}

class UploadImageResponse {
  UploadImageResponse({
      String message, 
      bool flag, 
      Data data,}){
    _message = message;
    _flag = flag;
    _data = data;
}

  UploadImageResponse.fromJson(dynamic json) {
    _message = json['message'];
    _flag = json['flag'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String _message;
  bool _flag;
  Data _data;

  String get message => _message;
  bool get flag => _flag;
  Data get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['flag'] = _flag;
    if (_data != null) {
      map['data'] = _data.toJson();
    }
    return map;
  }

}

/// filepath : "http://a93d-2409-4043-2e8d-e75b-404d-60f-88af-a121.ngrok.ioScreenshots"
/// fileurl : "http://a93d-2409-4043-2e8d-e75b-404d-60f-88af-a121.ngrok.ioScreenshots/Moreyeahslogo_White_Logo 120220202010738PM.png"

class Data {
  Data({
      String filepath, 
      String fileurl,}){
    _filepath = filepath;
    _fileurl = fileurl;
}

  Data.fromJson(dynamic json) {
    _filepath = json['filepath'];
    _fileurl = json['fileurl'];
  }
  String _filepath;
  String _fileurl;

  String get filepath => _filepath;
  String get fileurl => _fileurl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['filepath'] = _filepath;
    map['fileurl'] = _fileurl;
    return map;
  }

}