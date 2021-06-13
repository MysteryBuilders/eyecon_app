class WalletModel {
  String _success;
  WalletData _walletData;
  String _message;

  WalletModel({String success, WalletData walletData, String message}) {
    this._success = success;
    this._walletData = walletData;
    this._message = message;
  }

  String get success => _success;
  set success(String success) => _success = success;
  WalletData get walletData => _walletData;
  set walletData(WalletData walletData) => _walletData = walletData;
  String get message => _message;
  set message(String message) => _message = message;

  WalletModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _walletData = json['wallet_data'] != null
        ? new WalletData.fromJson(json['wallet_data'])
        : null;
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    if (this._walletData != null) {
      data['wallet_data'] = this._walletData.toJson();
    }
    data['message'] = this._message;
    return data;
  }
}

class WalletData {
  int _total;

  WalletData({int total}) {
    this._total = total;
  }

  int get total => _total;
  set total(int total) => _total = total;

  WalletData.fromJson(Map<String, dynamic> json) {
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this._total;
    return data;
  }
}