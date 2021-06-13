/// success : "1"
/// wallet_data : {"total":400}
/// message : "Wallet added successfully."

class WalletModel {
  String _success;
  Wallet_data _walletData;
  String _message;

  String get success => _success;
  Wallet_data get walletData => _walletData;
  String get message => _message;

  WalletModel({
      String success, 
      Wallet_data walletData, 
      String message}){
    _success = success;
    _walletData = walletData;
    _message = message;
}

  WalletModel.fromJson(dynamic json) {
    _success = json["success"];
    _walletData = json["wallet_data"] != null ? Wallet_data.fromJson(json["walletData"]) : null;
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_walletData != null) {
      map["wallet_data"] = _walletData.toJson();
    }
    map["message"] = _message;
    return map;
  }

}

/// total : 400

class Wallet_data {
  int _total;

  int get total => _total;

  Wallet_data({
      int total}){
    _total = total;
}

  Wallet_data.fromJson(dynamic json) {
    _total = json["total"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["total"] = _total;
    return map;
  }

}