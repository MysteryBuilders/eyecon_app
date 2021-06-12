/// success : "1"
/// product_data : []
/// message : "Product is unliked."

class DisLikeModel {
  String _success;

  String _message;

  String get success => _success;

  String get message => _message;

  DisLikeModel({
      String success, 
      List<dynamic> productData, 
      String message}){
    _success = success;

    _message = message;
}

  DisLikeModel.fromJson(dynamic json) {
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