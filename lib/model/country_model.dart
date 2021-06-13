/// success : "1"
/// data : [{"countries_id":1,"countries_name":"Afghanistan","iso3":"AFG","iso2":"AF","phonecode":"93","capital":"Kabul","currency":"AFN","currency_symbol":"؋","native":"افغانستان","region":"Asia","subregion":"Southern Asia","timezones":"[{\"zoneName\":\"Asia\\/Kabul\",\"gmtOffset\":16200,\"gmtOffsetName\":\"UTC+04:30\",\"abbreviation\":\"AFT\",\"tzName\":\"Afghanistan Time\"}]","translations":"{\"br\":\"Afeganistão\",\"pt\":\"Afeganistão\",\"nl\":\"Afghanistan\",\"hr\":\"Afganistan\",\"fa\":\"افغانستان\",\"de\":\"Afghanistan\",\"es\":\"Afganistán\",\"fr\":\"Afghanistan\",\"ja\":\"アフガニスタン\",\"it\":\"Afghanistan\"}","latitude":"33.00000000","longitude":"65.00000000","emoji":"🇦🇫","emojiU":"U+1F1E6 U+1F1EB","created_at":"2018-07-20 20:11:03","updated_at":"2021-01-23 13:13:39","flag":1,"wikiDataId":"Q889"},{"countries_id":2,"countries_name":"Aland Islands","iso3":"ALA","iso2":"AX","phonecode":"+358-18","capital":"Mariehamn","currency":"EUR","currency_symbol":"€","native":"Åland","region":"Europe","subregion":"Northern Europe","timezones":"[{\"zoneName\":\"Europe\\/Mariehamn\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]","translations":"{\"br\":\"Ilhas de Aland\",\"pt\":\"Ilhas de Aland\",\"nl\":\"Ålandeilanden\",\"hr\":\"Ålandski otoci\",\"fa\":\"جزایر الند\",\"de\":\"Åland\",\"es\":\"Alandia\",\"fr\":\"Åland\",\"ja\":\"オーランド諸島\",\"it\":\"Isole Aland\"}","latitude":"60.11666700","longitude":"19.90000000","emoji":"🇦🇽","emojiU":"U+1F1E6 U+1F1FD","created_at":"2018-07-20 20:11:03","updated_at":"2021-01-23 13:13:39","flag":1,"wikiDataId":null}]
/// message : "Returned all countries."

class CountryModel {
  String _success;
  List<Data> _data;
  String _message;

  String get success => _success;
  List<Data> get data => _data;
  String get message => _message;

  CountryModel({
      String success, 
      List<Data> data, 
      String message}){
    _success = success;
    _data = data;
    _message = message;
}

  CountryModel.fromJson(dynamic json) {
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

/// countries_id : 1
/// countries_name : "Afghanistan"
/// iso3 : "AFG"
/// iso2 : "AF"
/// phonecode : "93"
/// capital : "Kabul"
/// currency : "AFN"
/// currency_symbol : "؋"
/// native : "افغانستان"
/// region : "Asia"
/// subregion : "Southern Asia"
/// timezones : "[{\"zoneName\":\"Asia\\/Kabul\",\"gmtOffset\":16200,\"gmtOffsetName\":\"UTC+04:30\",\"abbreviation\":\"AFT\",\"tzName\":\"Afghanistan Time\"}]"
/// translations : "{\"br\":\"Afeganistão\",\"pt\":\"Afeganistão\",\"nl\":\"Afghanistan\",\"hr\":\"Afganistan\",\"fa\":\"افغانستان\",\"de\":\"Afghanistan\",\"es\":\"Afganistán\",\"fr\":\"Afghanistan\",\"ja\":\"アフガニスタン\",\"it\":\"Afghanistan\"}"
/// latitude : "33.00000000"
/// longitude : "65.00000000"
/// emoji : "🇦🇫"
/// emojiU : "U+1F1E6 U+1F1EB"
/// created_at : "2018-07-20 20:11:03"
/// updated_at : "2021-01-23 13:13:39"
/// flag : 1
/// wikiDataId : "Q889"

class Data {
  int _countriesId;
  String _countriesName;
  String _iso3;
  String _iso2;
  String _phonecode;
  String _capital;
  String _currency;
  String _currencySymbol;
  String _native;
  String _region;
  String _subregion;
  String _timezones;
  String _translations;
  String _latitude;
  String _longitude;
  String _emoji;
  String _emojiU;
  String _createdAt;
  String _updatedAt;
  int _flag;
  String _wikiDataId;

  int get countriesId => _countriesId;
  String get countriesName => _countriesName;
  String get iso3 => _iso3;
  String get iso2 => _iso2;
  String get phonecode => _phonecode;
  String get capital => _capital;
  String get currency => _currency;
  String get currencySymbol => _currencySymbol;
  String get native => _native;
  String get region => _region;
  String get subregion => _subregion;
  String get timezones => _timezones;
  String get translations => _translations;
  String get latitude => _latitude;
  String get longitude => _longitude;
  String get emoji => _emoji;
  String get emojiU => _emojiU;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get flag => _flag;
  String get wikiDataId => _wikiDataId;

  Data({
      int countriesId, 
      String countriesName, 
      String iso3, 
      String iso2, 
      String phonecode, 
      String capital, 
      String currency, 
      String currencySymbol, 
      String native, 
      String region, 
      String subregion, 
      String timezones, 
      String translations, 
      String latitude, 
      String longitude, 
      String emoji, 
      String emojiU, 
      String createdAt, 
      String updatedAt, 
      int flag, 
      String wikiDataId}){
    _countriesId = countriesId;
    _countriesName = countriesName;
    _iso3 = iso3;
    _iso2 = iso2;
    _phonecode = phonecode;
    _capital = capital;
    _currency = currency;
    _currencySymbol = currencySymbol;
    _native = native;
    _region = region;
    _subregion = subregion;
    _timezones = timezones;
    _translations = translations;
    _latitude = latitude;
    _longitude = longitude;
    _emoji = emoji;
    _emojiU = emojiU;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _flag = flag;
    _wikiDataId = wikiDataId;
}

  Data.fromJson(dynamic json) {
    _countriesId = json["countries_id"];
    _countriesName = json["countries_name"];
    _iso3 = json["iso3"];
    _iso2 = json["iso2"];
    _phonecode = json["phonecode"];
    _capital = json["capital"];
    _currency = json["currency"];
    _currencySymbol = json["currency_symbol"];
    _native = json["native"];
    _region = json["region"];
    _subregion = json["subregion"];
    _timezones = json["timezones"];
    _translations = json["translations"];
    _latitude = json["latitude"];
    _longitude = json["longitude"];
    _emoji = json["emoji"];
    _emojiU = json["emojiU"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _flag = json["flag"];
    _wikiDataId = json["wikiDataId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["countries_id"] = _countriesId;
    map["countries_name"] = _countriesName;
    map["iso3"] = _iso3;
    map["iso2"] = _iso2;
    map["phonecode"] = _phonecode;
    map["capital"] = _capital;
    map["currency"] = _currency;
    map["currency_symbol"] = _currencySymbol;
    map["native"] = _native;
    map["region"] = _region;
    map["subregion"] = _subregion;
    map["timezones"] = _timezones;
    map["translations"] = _translations;
    map["latitude"] = _latitude;
    map["longitude"] = _longitude;
    map["emoji"] = _emoji;
    map["emojiU"] = _emojiU;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["flag"] = _flag;
    map["wikiDataId"] = _wikiDataId;
    return map;
  }

}