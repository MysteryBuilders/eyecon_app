/// success : "1"
/// data : [{"id":2,"role_id":2,"user_name":null,"first_name":null,"last_name":null,"full_name":"Test User","gender":"Male","default_address_id":0,"country_code":null,"phone":"8927279789","email":"testuset@gmail.com","password":"$2y$10$Y.p20IF2WxuEKzfz.R4xiOymQ/Yk6mlqtEqq1utVnRMsiDo93Icg2","login_type":null,"push_key":null,"avatar":null,"status":"1","is_seen":1,"phone_verified":null,"remember_token":null,"auth_id_tiwilo":null,"dob":"25-04-1993","nationality":"Indian","created_at":"2020-11-17 05:09:23","updated_at":"2020-11-22 12:04:18"}]
/// message : "Customer information has been Updated successfully"

class UpdateProfileModel {
  String _success;
  List<Data> _data;
  String _message;

  String get success => _success;
  List<Data> get data => _data;
  String get message => _message;

  UpdateProfileModel({
      String success, 
      List<Data> data, 
      String message}){
    _success = success;
    _data = data;
    _message = message;
}

  UpdateProfileModel.fromJson(dynamic json) {
    _success = json["success"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    map["message"] = _message;
    return map;
  }

}

/// id : 2
/// role_id : 2
/// user_name : null
/// first_name : null
/// last_name : null
/// full_name : "Test User"
/// gender : "Male"
/// default_address_id : 0
/// country_code : null
/// phone : "8927279789"
/// email : "testuset@gmail.com"
/// password : "$2y$10$Y.p20IF2WxuEKzfz.R4xiOymQ/Yk6mlqtEqq1utVnRMsiDo93Icg2"
/// login_type : null
/// push_key : null
/// avatar : null
/// status : "1"
/// is_seen : 1
/// phone_verified : null
/// remember_token : null
/// auth_id_tiwilo : null
/// dob : "25-04-1993"
/// nationality : "Indian"
/// created_at : "2020-11-17 05:09:23"
/// updated_at : "2020-11-22 12:04:18"

class Data {
  int _id;
  int _roleId;
  dynamic _userName;
  dynamic _firstName;
  dynamic _lastName;
  String _fullName;
  String _gender;
  int _defaultAddressId;
  dynamic _countryCode;
  String _phone;
  String _email;
  String _password;
  dynamic _loginType;
  dynamic _pushKey;
  dynamic _avatar;
  String _status;
  int _isSeen;
  dynamic _phoneVerified;
  dynamic _rememberToken;
  dynamic _authIdTiwilo;
  String _dob;
  String _nationality;
  String _createdAt;
  String _updatedAt;

  int get id => _id;
  int get roleId => _roleId;
  dynamic get userName => _userName;
  dynamic get firstName => _firstName;
  dynamic get lastName => _lastName;
  String get fullName => _fullName;
  String get gender => _gender;
  int get defaultAddressId => _defaultAddressId;
  dynamic get countryCode => _countryCode;
  String get phone => _phone;
  String get email => _email;
  String get password => _password;
  dynamic get loginType => _loginType;
  dynamic get pushKey => _pushKey;
  dynamic get avatar => _avatar;
  String get status => _status;
  int get isSeen => _isSeen;
  dynamic get phoneVerified => _phoneVerified;
  dynamic get rememberToken => _rememberToken;
  dynamic get authIdTiwilo => _authIdTiwilo;
  String get dob => _dob;
  String get nationality => _nationality;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Data({
      int id, 
      int roleId, 
      dynamic userName, 
      dynamic firstName, 
      dynamic lastName, 
      String fullName, 
      String gender, 
      int defaultAddressId, 
      dynamic countryCode, 
      String phone, 
      String email, 
      String password, 
      dynamic loginType, 
      dynamic pushKey, 
      dynamic avatar, 
      String status, 
      int isSeen, 
      dynamic phoneVerified, 
      dynamic rememberToken, 
      dynamic authIdTiwilo, 
      String dob, 
      String nationality, 
      String createdAt, 
      String updatedAt}){
    _id = id;
    _roleId = roleId;
    _userName = userName;
    _firstName = firstName;
    _lastName = lastName;
    _fullName = fullName;
    _gender = gender;
    _defaultAddressId = defaultAddressId;
    _countryCode = countryCode;
    _phone = phone;
    _email = email;
    _password = password;
    _loginType = loginType;
    _pushKey = pushKey;
    _avatar = avatar;
    _status = status;
    _isSeen = isSeen;
    _phoneVerified = phoneVerified;
    _rememberToken = rememberToken;
    _authIdTiwilo = authIdTiwilo;
    _dob = dob;
    _nationality = nationality;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _roleId = json["role_id"];
    _userName = json["user_name"];
    _firstName = json["first_name"];
    _lastName = json["last_name"];
    _fullName = json["full_name"];
    _gender = json["gender"];
    _defaultAddressId = json["default_address_id"];
    _countryCode = json["country_code"];
    _phone = json["phone"];
    _email = json["email"];
    _password = json["password"];
    _loginType = json["login_type"];
    _pushKey = json["push_key"];
    _avatar = json["avatar"];
    _status = json["status"];
    _isSeen = json["is_seen"];
    _phoneVerified = json["phone_verified"];
    _rememberToken = json["remember_token"];
    _authIdTiwilo = json["auth_id_tiwilo"];
    _dob = json["dob"];
    _nationality = json["nationality"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["role_id"] = _roleId;
    map["user_name"] = _userName;
    map["first_name"] = _firstName;
    map["last_name"] = _lastName;
    map["full_name"] = _fullName;
    map["gender"] = _gender;
    map["default_address_id"] = _defaultAddressId;
    map["country_code"] = _countryCode;
    map["phone"] = _phone;
    map["email"] = _email;
    map["password"] = _password;
    map["login_type"] = _loginType;
    map["push_key"] = _pushKey;
    map["avatar"] = _avatar;
    map["status"] = _status;
    map["is_seen"] = _isSeen;
    map["phone_verified"] = _phoneVerified;
    map["remember_token"] = _rememberToken;
    map["auth_id_tiwilo"] = _authIdTiwilo;
    map["dob"] = _dob;
    map["nationality"] = _nationality;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    return map;
  }

}