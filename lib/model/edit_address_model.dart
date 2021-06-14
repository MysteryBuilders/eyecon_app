/// success : "1"
/// data : {"addressId":3}
/// message : "Shipping address has been updated successfully!"

class EditAddressModel {
  String _success;

  String _message;

  String get success => _success;

  String get message => _message;

  EditAddressModel({
      String success, 

      String message}){
    _success = success;

    _message = message;
}

  EditAddressModel.fromJson(dynamic json) {
    _success = json["success"];

    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;

    map["message"] = _message;
    return map;
  }

}

/// addressId : 3

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