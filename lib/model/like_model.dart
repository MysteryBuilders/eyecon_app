/// success : "1"
/// product_data : [{"liked_products_id":2}]
/// message : "Product is liked."

class LikeModel {
  String _success;

  String _message;

  String get success => _success;

  String get message => _message;

  LikeModel({
      String success, 
      List<Product_data> productData, 
      String message}){
    _success = success;

    _message = message;
}

  LikeModel.fromJson(dynamic json) {
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

/// liked_products_id : 2

class Product_data {
  int _likedProductsId;

  int get likedProductsId => _likedProductsId;

  Product_data({
      int likedProductsId}){
    _likedProductsId = likedProductsId;
}

  Product_data.fromJson(dynamic json) {
    _likedProductsId = json["liked_products_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["liked_products_id"] = _likedProductsId;
    return map;
  }

}