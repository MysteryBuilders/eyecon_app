/// success : "1"
/// pages_data : [{"page_id":1,"slug":"about-us","status":1,"type":1,"page_description_id":1,"name":"About\nus","description":"<p>About us</p>","language_id":1}]
/// message : "Returned all products."

class PageModel {
  String _success;
  List<Pages_data> _pagesData;
  String _message;

  String get success => _success;
  List<Pages_data> get pagesData => _pagesData;
  String get message => _message;

  PageModel({
      String success, 
      List<Pages_data> pagesData, 
      String message}){
    _success = success;
    _pagesData = pagesData;
    _message = message;
}

  PageModel.fromJson(dynamic json) {
    _success = json["success"];
    if (json["pages_data"] != null) {
      _pagesData = [];
      json["pages_data"].forEach((v) {
        _pagesData.add(Pages_data.fromJson(v));
      });
    }
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_pagesData != null) {
      map["pages_data"] = _pagesData.map((v) => v.toJson()).toList();
    }
    map["message"] = _message;
    return map;
  }

}

/// page_id : 1
/// slug : "about-us"
/// status : 1
/// type : 1
/// page_description_id : 1
/// name : "About\nus"
/// description : "<p>About us</p>"
/// language_id : 1

class Pages_data {
  int _pageId;
  String _slug;
  int _status;
  int _type;
  int _pageDescriptionId;
  String _name;
  String _description;
  int _languageId;

  int get pageId => _pageId;
  String get slug => _slug;
  int get status => _status;
  int get type => _type;
  int get pageDescriptionId => _pageDescriptionId;
  String get name => _name;
  String get description => _description;
  int get languageId => _languageId;

  Pages_data({
      int pageId, 
      String slug, 
      int status, 
      int type, 
      int pageDescriptionId, 
      String name, 
      String description, 
      int languageId}){
    _pageId = pageId;
    _slug = slug;
    _status = status;
    _type = type;
    _pageDescriptionId = pageDescriptionId;
    _name = name;
    _description = description;
    _languageId = languageId;
}

  Pages_data.fromJson(dynamic json) {
    _pageId = json["page_id"];
    _slug = json["slug"];
    _status = json["status"];
    _type = json["type"];
    _pageDescriptionId = json["page_description_id"];
    _name = json["name"];
    _description = json["description"];
    _languageId = json["language_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page_id"] = _pageId;
    map["slug"] = _slug;
    map["status"] = _status;
    map["type"] = _type;
    map["page_description_id"] = _pageDescriptionId;
    map["name"] = _name;
    map["description"] = _description;
    map["language_id"] = _languageId;
    return map;
  }

}