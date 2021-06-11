/// data : [{"faq_id":1,"faq_group":1,"language_id":1,"question":"Test FAQ Eng updated","answer":"<p>Yooo Eng Answer</p>","status":1,"created_at":"2021-03-08 15:56:15","updated_at":"2021-03-08 15:56:15"}]
/// message : "Success"
/// success : "1"

class FaqModel {
  List<Data> _data;
  String _message;
  String _success;

  List<Data> get data => _data;
  String get message => _message;
  String get success => _success;

  FaqModel({
      List<Data> data, 
      String message, 
      String success}){
    _data = data;
    _message = message;
    _success = success;
}

  FaqModel.fromJson(dynamic json) {
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
    _message = json["message"];
    _success = json["success"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    map["message"] = _message;
    map["success"] = _success;
    return map;
  }

}

/// faq_id : 1
/// faq_group : 1
/// language_id : 1
/// question : "Test FAQ Eng updated"
/// answer : "<p>Yooo Eng Answer</p>"
/// status : 1
/// created_at : "2021-03-08 15:56:15"
/// updated_at : "2021-03-08 15:56:15"

class Data {
  int _faqId;
  int _faqGroup;
  int _languageId;
  String _question;
  String _answer;
  int _status;
  String _createdAt;
  String _updatedAt;

  int get faqId => _faqId;
  int get faqGroup => _faqGroup;
  int get languageId => _languageId;
  String get question => _question;
  String get answer => _answer;
  int get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Data({
      int faqId, 
      int faqGroup, 
      int languageId, 
      String question, 
      String answer, 
      int status, 
      String createdAt, 
      String updatedAt}){
    _faqId = faqId;
    _faqGroup = faqGroup;
    _languageId = languageId;
    _question = question;
    _answer = answer;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _faqId = json["faq_id"];
    _faqGroup = json["faq_group"];
    _languageId = json["language_id"];
    _question = json["question"];
    _answer = json["answer"];
    _status = json["status"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["faq_id"] = _faqId;
    map["faq_group"] = _faqGroup;
    map["language_id"] = _languageId;
    map["question"] = _question;
    map["answer"] = _answer;
    map["status"] = _status;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    return map;
  }

}