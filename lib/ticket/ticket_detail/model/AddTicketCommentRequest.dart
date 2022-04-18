/// ticketId : 7
/// message : "New Comment"
/// image1 : null
/// image2 : null
/// image3 : null
/// image4 : null
/// image5 : null

class AddTicketCommentRequest {
  AddTicketCommentRequest({
      int ticketId, 
      String message, 
      dynamic image1, 
      dynamic image2, 
      dynamic image3, 
      dynamic image4, 
      dynamic image5,}){
    _ticketId = ticketId;
    _message = message;
    _image1 = image1;
    _image2 = image2;
    _image3 = image3;
    _image4 = image4;
    _image5 = image5;
}

  AddTicketCommentRequest.fromJson(dynamic json) {
    _ticketId = json['ticketId'];
    _message = json['message'];
    _image1 = json['image1'];
    _image2 = json['image2'];
    _image3 = json['image3'];
    _image4 = json['image4'];
    _image5 = json['image5'];
  }
  int _ticketId;
  String _message;
  dynamic _image1;
  dynamic _image2;
  dynamic _image3;
  dynamic _image4;
  dynamic _image5;

  int get ticketId => _ticketId;
  String get message => _message;
  dynamic get image1 => _image1;
  dynamic get image2 => _image2;
  dynamic get image3 => _image3;
  dynamic get image4 => _image4;
  dynamic get image5 => _image5;


  set ticketId(int value) {
    _ticketId = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticketId'] = _ticketId;
    map['message'] = _message;
    map['image1'] = _image1;
    map['image2'] = _image2;
    map['image3'] = _image3;
    map['image4'] = _image4;
    map['image5'] = _image5;
    return map;
  }

  set message(String value) {
    _message = value;
  }

  set image1(dynamic value) {
    _image1 = value;
  }

  set image2(dynamic value) {
    _image2 = value;
  }

  set image3(dynamic value) {
    _image3 = value;
  }

  set image4(dynamic value) {
    _image4 = value;
  }

  set image5(dynamic value) {
    _image5 = value;
  }
}