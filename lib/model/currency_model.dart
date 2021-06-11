/// success : "1"
/// data : [{"id":1,"title":"KWD","code":"KWD","symbol_left":"KD","symbol_right":"","decimal_point":null,"thousands_point":null,"decimal_places":"2","created_at":"2021-02-12\n05:27:41","updated_at":"2021-02-12\n05:27:41","value":1,"is_default":1,"status":1,"is_current":1},{"id":3,"title":"SAR","code":"SAR","symbol_left":"SR","symbol_right":"","decimal_point":null,"thousands_point":null,"decimal_places":"2","created_at":"2021-02-17\n05:15:26","updated_at":"2021-02-17\n05:15:26","value":12.4,"is_default":0,"status":1,"is_current":1},{"id":4,"title":"BHD","code":"BHD","symbol_left":"BD","symbol_right":"","decimal_point":null,"thousands_point":null,"decimal_places":"2","created_at":"2021-02-17\n05:16:23","updated_at":"2021-02-17\n05:16:23","value":1.25,"is_default":0,"status":1,"is_current":1},{"id":5,"title":"AED","code":"AED","symbol_left":"AED","symbol_right":"","decimal_point":null,"thousands_point":null,"decimal_places":"2","created_at":"2021-02-17\n05:18:13","updated_at":"2021-02-17\n05:18:13","value":12.14,"is_default":0,"status":1,"is_current":1},{"id":6,"title":"QAR","code":"QAR","symbol_left":"QR","symbol_right":"","decimal_point":null,"thousands_point":null,"decimal_places":"2","created_at":"2021-02-17\n05:18:43","updated_at":"2021-02-17\n05:18:43","value":12.03,"is_default":0,"status":1,"is_current":1},{"id":7,"title":"OMR","code":"OMR","symbol_left":"OR","symbol_right":"","decimal_point":null,"thousands_point":null,"decimal_places":"2","created_at":"2021-02-17\n05:20:00","updated_at":"2021-02-17\n05:20:00","value":1.27,"is_default":0,"status":1,"is_current":1},{"id":8,"title":"JOD","code":"JOD","symbol_left":"JD","symbol_right":"","decimal_point":null,"thousands_point":null,"decimal_places":"2","created_at":"2021-02-17\n05:20:29","updated_at":"2021-02-17\n05:20:29","value":2.34,"is_default":0,"status":1,"is_current":1},{"id":9,"title":"USA","code":"USD","symbol_left":"USD","symbol_right":"","decimal_point":null,"thousands_point":null,"decimal_places":"2","created_at":"2021-02-17\n05:12:42","updated_at":"2021-02-17 05:12:42","value":3.3,"is_default":0,"status":1,"is_current":1}]
/// message : "Returned\nall currencies."

class CurrencyModel {
  String _success;
  List<Data> _data;
  String _message;

  String get success => _success;
  List<Data> get data => _data;
  String get message => _message;

  CurrencyModel({
      String success, 
      List<Data> data, 
      String message}){
    _success = success;
    _data = data;
    _message = message;
}

  CurrencyModel.fromJson(dynamic json) {
    _success = json["success"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    map["message"] = _message;
    return map;
  }

}

/// id : 1
/// title : "KWD"
/// code : "KWD"
/// symbol_left : "KD"
/// symbol_right : ""
/// decimal_point : null
/// thousands_point : null
/// decimal_places : "2"
/// created_at : "2021-02-12\n05:27:41"
/// updated_at : "2021-02-12\n05:27:41"
/// value : 1
/// is_default : 1
/// status : 1
/// is_current : 1

class Data {
  int _id;
  String _title;
  String _code;
  String _symbolLeft;
  String _symbolRight;
  dynamic _decimalPoint;
  dynamic _thousandsPoint;
  String _decimalPlaces;
  String _createdAt;
  String _updatedAt;

  int _isDefault;
  int _status;
  int _isCurrent;

  int get id => _id;
  String get title => _title;
  String get code => _code;
  String get symbolLeft => _symbolLeft;
  String get symbolRight => _symbolRight;
  dynamic get decimalPoint => _decimalPoint;
  dynamic get thousandsPoint => _thousandsPoint;
  String get decimalPlaces => _decimalPlaces;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  int get isDefault => _isDefault;
  int get status => _status;
  int get isCurrent => _isCurrent;

  Data({
      int id, 
      String title, 
      String code, 
      String symbolLeft, 
      String symbolRight, 
      dynamic decimalPoint, 
      dynamic thousandsPoint, 
      String decimalPlaces, 
      String createdAt, 
      String updatedAt, 
      int value, 
      int isDefault, 
      int status, 
      int isCurrent}){
    _id = id;
    _title = title;
    _code = code;
    _symbolLeft = symbolLeft;
    _symbolRight = symbolRight;
    _decimalPoint = decimalPoint;
    _thousandsPoint = thousandsPoint;
    _decimalPlaces = decimalPlaces;
    _createdAt = createdAt;
    _updatedAt = updatedAt;

    _isDefault = isDefault;
    _status = status;
    _isCurrent = isCurrent;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"];
    _code = json["code"];
    _symbolLeft = json["symbol_left"];
    _symbolRight = json["symbol_right"];
    _decimalPoint = json["decimal_point"];
    _thousandsPoint = json["thousands_point"];
    _decimalPlaces = json["decimal_places"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];

    _isDefault = json["is_default"];
    _status = json["status"];
    _isCurrent = json["is_current"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["code"] = _code;
    map["symbol_left"] = _symbolLeft;
    map["symbol_right"] = _symbolRight;
    map["decimal_point"] = _decimalPoint;
    map["thousands_point"] = _thousandsPoint;
    map["decimal_places"] = _decimalPlaces;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;

    map["is_default"] = _isDefault;
    map["status"] = _status;
    map["is_current"] = _isCurrent;
    return map;
  }

}