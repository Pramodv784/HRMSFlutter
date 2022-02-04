/// key : "2021-02-01T00:00:00"
/// value : 0.0

class AvgMonthResponse {
  AvgMonthResponse({
      String key, 
      double value,}){
    _key = key;
    _value = value;
}

  AvgMonthResponse.fromJson(dynamic json) {
    _key = json['key'];
    _value = json['value'];
  }
  String _key;
  double _value;

  String get key => _key;
  double get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = _key;
    map['value'] = _value;
    return map;
  }

}