/// success : "1"
/// data : {"tax":158.4}
/// message : "Data is returned."

class TaxModel {
  String _success;
  Data _data;
  String _message;

  String get success => _success;
  Data get data => _data;
  String get message => _message;

  TaxModel({
      String success, 
      Data data, 
      String message}){
    _success = success;
    _data = data;
    _message = message;
}

  TaxModel.fromJson(dynamic json) {
    _success = json["success"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    map["message"] = _message;
    return map;
  }

}

/// tax : 158.4

class Data {
  String _tax;

  String get tax => _tax;

  Data({
    String tax}){
    _tax = tax;
}

  Data.fromJson(dynamic json) {
    _tax = json["tax"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["tax"] = _tax;
    return map;
  }

}