/// ticketCategoryId : 9
/// ticketPriorityId : 19
/// title : "Demo Ticket"
/// message : "This Is a Demo Ticket Created For Testing"
/// image1 : "http://609e-103-15-67-125.ngrok.io/uploadimage/Screenshot 2022-03-09 15330020220323043225PM.png"
/// image2 : "http://609e-103-15-67-125.ngrok.io/uploadimage/Screenshot 2022-03-09 15330020220323043225PM.png"
/// image3 : "http://609e-103-15-67-125.ngrok.io/uploadimage/Screenshot 2022-03-09 15330020220323043225PM.png"
/// image4 : ""
/// image5 : ""

class AddTicketRequest {
  AddTicketRequest({
      int ticketCategoryId, 
      int ticketPriorityId, 
      String title, 
      String message, 
      String image1, 
      String image2, 
      String image3, 
      String image4, 
      String image5,}){
    _ticketCategoryId = ticketCategoryId;
    _ticketPriorityId = ticketPriorityId;
    _title = title;
    _message = message;
    _image1 = image1;
    _image2 = image2;
    _image3 = image3;
    _image4 = image4;
    _image5 = image5;
}

  AddTicketRequest.fromJson(dynamic json) {
    _ticketCategoryId = json['ticketCategoryId'];
    _ticketPriorityId = json['ticketPriorityId'];
    _title = json['title'];
    _message = json['message'];
    _image1 = json['image1'];
    _image2 = json['image2'];
    _image3 = json['image3'];
    _image4 = json['image4'];
    _image5 = json['image5'];
  }
  int _ticketCategoryId;
  int _ticketPriorityId;
  String _title;
  String _message;
  String _image1;
  String _image2;
  String _image3;
  String _image4;
  String _image5;

  int get ticketCategoryId => _ticketCategoryId;
  int get ticketPriorityId => _ticketPriorityId;
  String get title => _title;
  String get message => _message;
  String get image1 => _image1;
  String get image2 => _image2;
  String get image3 => _image3;
  String get image4 => _image4;
  String get image5 => _image5;


  set ticketCategoryId(int value) {
    _ticketCategoryId = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticketCategoryId'] = _ticketCategoryId;
    map['ticketPriorityId'] = _ticketPriorityId;
    map['title'] = _title;
    map['message'] = _message;
    map['image1'] = _image1;
    map['image2'] = _image2;
    map['image3'] = _image3;
    map['image4'] = _image4;
    map['image5'] = _image5;
    return map;
  }

  set ticketPriorityId(int value) {
    _ticketPriorityId = value;
  }

  set title(String value) {
    _title = value;
  }

  set message(String value) {
    _message = value;
  }

  set image1(String value) {
    _image1 = value;
  }

  set image2(String value) {
    _image2 = value;
  }

  set image3(String value) {
    _image3 = value;
  }

  set image4(String value) {
    _image4 = value;
  }

  set image5(String value) {
    _image5 = value;
  }
}