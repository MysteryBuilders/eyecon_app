/// success : "1"
/// message : "Your password has been sent to your email address."

class ChangePasswordModel {
  String _success;
  String _message;

  String get success => _success;
  String get message => _message;

  ChangePasswordModel({
      String success, 
      String message}){
    _success = success;
    _message = message;
}

  ChangePasswordModel.fromJson(dynamic json) {
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