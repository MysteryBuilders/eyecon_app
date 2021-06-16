/// success : "1"
/// message : "Item deleted sucessfully."

class DeleteCartModel {
  String _success;
  String _message;

  String get success => _success;
  String get message => _message;

  DeleteCartModel({
      String success, 
      String message}){
    _success = success;
    _message = message;
}

  DeleteCartModel.fromJson(dynamic json) {
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