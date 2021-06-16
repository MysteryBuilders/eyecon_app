/// success : "1"
/// data : {"InvoiceId":671537,"IsDirectPayment":true,"PaymentURL":"https://apitest.myfatoorah.com/v2/DirectPayment/030635167153747/23","CustomerReference":"Ref 0009","UserDefinedField":null,"RecurringId":""}
/// customer_id : 2
/// message : "Order has been placed successfully."

class PlaceOrderModel {
  String _success;
  Data _data;
  int _customerId;
  String _message;

  String get success => _success;
  Data get data => _data;
  int get customerId => _customerId;
  String get message => _message;

  PlaceOrderModel({
      String success, 
      Data data, 
      int customerId, 
      String message}){
    _success = success;
    _data = data;
    _customerId = customerId;
    _message = message;
}

  PlaceOrderModel.fromJson(dynamic json) {
    _success = json["success"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    _customerId = json["customer_id"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    map["customer_id"] = _customerId;
    map["message"] = _message;
    return map;
  }

}

/// InvoiceId : 671537
/// IsDirectPayment : true
/// PaymentURL : "https://apitest.myfatoorah.com/v2/DirectPayment/030635167153747/23"
/// CustomerReference : "Ref 0009"
/// UserDefinedField : null
/// RecurringId : ""

class Data {
  int _invoiceId;
  bool _isDirectPayment;
  String _paymentURL;
  String _customerReference;
  dynamic _userDefinedField;
  String _recurringId;

  int get invoiceId => _invoiceId;
  bool get isDirectPayment => _isDirectPayment;
  String get paymentURL => _paymentURL;
  String get customerReference => _customerReference;
  dynamic get userDefinedField => _userDefinedField;
  String get recurringId => _recurringId;

  Data({
      int invoiceId, 
      bool isDirectPayment, 
      String paymentURL, 
      String customerReference, 
      dynamic userDefinedField, 
      String recurringId}){
    _invoiceId = invoiceId;
    _isDirectPayment = isDirectPayment;
    _paymentURL = paymentURL;
    _customerReference = customerReference;
    _userDefinedField = userDefinedField;
    _recurringId = recurringId;
}

  Data.fromJson(dynamic json) {
    _invoiceId = json["InvoiceId"];
    _isDirectPayment = json["IsDirectPayment"];
    _paymentURL = json["PaymentURL"];
    _customerReference = json["CustomerReference"];
    _userDefinedField = json["UserDefinedField"];
    _recurringId = json["RecurringId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["InvoiceId"] = _invoiceId;
    map["IsDirectPayment"] = _isDirectPayment;
    map["PaymentURL"] = _paymentURL;
    map["CustomerReference"] = _customerReference;
    map["UserDefinedField"] = _userDefinedField;
    map["RecurringId"] = _recurringId;
    return map;
  }

}