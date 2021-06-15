/// success : "1"
/// data : {"cart_id":2}
/// message : [{"success":"1","message":"Product sucessfully added in cart."},{"success":"1","message":"Product sucessfully added in cart."}]

class AddCartModel {
  String _success;
  Data _data;
  List<Message> _message;

  String get success => _success;
  Data get data => _data;
  List<Message> get message => _message;

  AddCartModel({
      String success, 
      Data data, 
      List<Message> message}){
    _success = success;
    _data = data;
    _message = message;
}

  AddCartModel.fromJson(dynamic json) {
    _success = json["success"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    if (json["message"] != null) {
      _message = [];
      json["message"].forEach((v) {
        _message.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    if (_message != null) {
      map["message"] = _message.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// success : "1"
/// message : "Product sucessfully added in cart."

class Message {
  String _success;
  String _message;

  String get success => _success;
  String get message => _message;

  Message({
      String success, 
      String message}){
    _success = success;
    _message = message;
}

  Message.fromJson(dynamic json) {
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

/// cart_id : 2

class Data {
  int _cartId;

  int get cartId => _cartId;

  Data({
      int cartId}){
    _cartId = cartId;
}

  Data.fromJson(dynamic json) {
    _cartId = json["cart_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["cart_id"] = _cartId;
    return map;
  }

}