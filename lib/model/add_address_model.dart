/// success : "1"
/// data : {"addressId":34}
/// message : "Shipping address has been added successfully!"

class AddAddressModel {
  String _success;
  Data _data;
  String _message;

  String get success => _success;
  Data get data => _data;
  String get message => _message;

  AddAddressModel({
      String success, 
      Data data, 
      String message}){
    _success = success;
    _data = data;
    _message = message;
}

  AddAddressModel.fromJson(dynamic json) {
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

/// addressId : 34

class Data {
  int _addressId;

  int get addressId => _addressId;

  Data({
      int addressId}){
    _addressId = addressId;
}

  Data.fromJson(dynamic json) {
    _addressId = json["addressId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["addressId"] = _addressId;
    return map;
  }

}