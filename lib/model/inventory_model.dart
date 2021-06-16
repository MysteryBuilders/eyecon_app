/// success : "1"
/// stock : [{"inventory_ref_id":3,"admin_id":1,"added_date":0,"reference_code":null,"stock":10000,"products_id":7,"purchase_price":"12.00","stock_type":"in","created_at":"2021-06-16 05:22:10","updated_at":"2021-06-16 17:22:10"}]
/// message : "Attributes are returned successfull!"

class InventoryModel {
  String _success;
  List<Stock> _stock;
  String _message;

  String get success => _success;
  List<Stock> get stock => _stock;
  String get message => _message;

  InventoryModel({
      String success, 
      List<Stock> stock, 
      String message}){
    _success = success;
    _stock = stock;
    _message = message;
}

  InventoryModel.fromJson(dynamic json) {
    _success = json["success"];
    if (json["stock"] != null) {
      _stock = [];
      json["stock"].forEach((v) {
        _stock.add(Stock.fromJson(v));
      });
    }
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_stock != null) {
      map["stock"] = _stock.map((v) => v.toJson()).toList();
    }
    map["message"] = _message;
    return map;
  }

}

/// inventory_ref_id : 3
/// admin_id : 1
/// added_date : 0
/// reference_code : null
/// stock : 10000
/// products_id : 7
/// purchase_price : "12.00"
/// stock_type : "in"
/// created_at : "2021-06-16 05:22:10"
/// updated_at : "2021-06-16 17:22:10"

class Stock {
  int _inventoryRefId;
  int _adminId;
  int _addedDate;
  dynamic _referenceCode;
  int _stock;
  int _productsId;
  String _purchasePrice;
  String _stockType;
  String _createdAt;
  String _updatedAt;

  int get inventoryRefId => _inventoryRefId;
  int get adminId => _adminId;
  int get addedDate => _addedDate;
  dynamic get referenceCode => _referenceCode;
  int get stock => _stock;
  int get productsId => _productsId;
  String get purchasePrice => _purchasePrice;
  String get stockType => _stockType;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Stock({
      int inventoryRefId, 
      int adminId, 
      int addedDate, 
      dynamic referenceCode, 
      int stock, 
      int productsId, 
      String purchasePrice, 
      String stockType, 
      String createdAt, 
      String updatedAt}){
    _inventoryRefId = inventoryRefId;
    _adminId = adminId;
    _addedDate = addedDate;
    _referenceCode = referenceCode;
    _stock = stock;
    _productsId = productsId;
    _purchasePrice = purchasePrice;
    _stockType = stockType;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Stock.fromJson(dynamic json) {
    _inventoryRefId = json["inventory_ref_id"];
    _adminId = json["admin_id"];
    _addedDate = json["added_date"];
    _referenceCode = json["reference_code"];
    _stock = json["stock"];
    _productsId = json["products_id"];
    _purchasePrice = json["purchase_price"];
    _stockType = json["stock_type"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["inventory_ref_id"] = _inventoryRefId;
    map["admin_id"] = _adminId;
    map["added_date"] = _addedDate;
    map["reference_code"] = _referenceCode;
    map["stock"] = _stock;
    map["products_id"] = _productsId;
    map["purchase_price"] = _purchasePrice;
    map["stock_type"] = _stockType;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    return map;
  }

}