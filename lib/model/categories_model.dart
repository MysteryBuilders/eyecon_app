/// categoryBanner : [{"banners_title":"الفئة الأعلى بانر","banners_url":"","id":278,"image_id":200,"image_type":"ACTUAL","height":360,"width":820,"path":"images/media/2020/11/Q9qzy23406.jpg","created_at":null,"updated_at":null}]
/// getCategories : [{"id":1,"image":"121","date_added":null,"last_modified":null,"name":"عدسات لاصقة","category_image_path":"images/media/2019/10/thumbnail15707880203876V11310.jpg","hasChild":0,"childCategories":[]},{"id":2,"image":"201","date_added":null,"last_modified":null,"name":"ابل","category_image_path":null,"hasChild":0,"childCategories":[]},{"id":3,"image":"197","date_added":null,"last_modified":null,"name":"ابل٢","category_image_path":null,"hasChild":0,"childCategories":[]},{"id":4,"image":"206","date_added":null,"last_modified":null,"name":"القسم 1","category_image_path":null,"hasChild":0,"childCategories":[]},{"id":5,"image":"206","date_added":null,"last_modified":null,"name":"القسم 2","category_image_path":null,"hasChild":1,"childCategories":[{"id":6,"image":"206","date_added":null,"last_modified":null,"name":"الفرع 1","category_image_path":null}]}]

class CategoriesModel {
  List<CategoryBanner> _categoryBanner;
  List<GetCategories> _getCategories;

  List<CategoryBanner> get categoryBanner => _categoryBanner;
  List<GetCategories> get getCategories => _getCategories;

  CategoriesModel({
      List<CategoryBanner> categoryBanner, 
      List<GetCategories> getCategories}){
    _categoryBanner = categoryBanner;
    _getCategories = getCategories;
}

  CategoriesModel.fromJson(dynamic json) {
    if (json["categoryBanner"] != null) {
      _categoryBanner = [];
      json["categoryBanner"].forEach((v) {
        _categoryBanner.add(CategoryBanner.fromJson(v));
      });
    }
    if (json["getCategories"] != null) {
      _getCategories = [];
      json["getCategories"].forEach((v) {
        _getCategories.add(GetCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_categoryBanner != null) {
      map["categoryBanner"] = _categoryBanner.map((v) => v.toJson()).toList();
    }
    if (_getCategories != null) {
      map["getCategories"] = _getCategories.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// image : "121"
/// date_added : null
/// last_modified : null
/// name : "عدسات لاصقة"
/// category_image_path : "images/media/2019/10/thumbnail15707880203876V11310.jpg"
/// hasChild : 0
/// childCategories : []

class GetCategories {
  int _id;
  String _image;
  dynamic _dateAdded;
  dynamic _lastModified;
  String _name;
  String _categoryImagePath;
  int _hasChild;


  int get id => _id;
  String get image => _image;
  dynamic get dateAdded => _dateAdded;
  dynamic get lastModified => _lastModified;
  String get name => _name;
  String get categoryImagePath => _categoryImagePath;
  int get hasChild => _hasChild;


  GetCategories({
      int id, 
      String image, 
      dynamic dateAdded, 
      dynamic lastModified, 
      String name, 
      String categoryImagePath, 
      int hasChild, 
      List<dynamic> childCategories}){
    _id = id;
    _image = image;
    _dateAdded = dateAdded;
    _lastModified = lastModified;
    _name = name;
    _categoryImagePath = categoryImagePath;
    _hasChild = hasChild;

}

  GetCategories.fromJson(dynamic json) {
    _id = json["id"];
    _image = json["image"];
    _dateAdded = json["date_added"];
    _lastModified = json["last_modified"];
    _name = json["name"];
    _categoryImagePath = json["category_image_path"];
    _hasChild = json["hasChild"];

  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["image"] = _image;
    map["date_added"] = _dateAdded;
    map["last_modified"] = _lastModified;
    map["name"] = _name;
    map["category_image_path"] = _categoryImagePath;
    map["hasChild"] = _hasChild;

    return map;
  }

}

/// banners_title : "الفئة الأعلى بانر"
/// banners_url : ""
/// id : 278
/// image_id : 200
/// image_type : "ACTUAL"
/// height : 360
/// width : 820
/// path : "images/media/2020/11/Q9qzy23406.jpg"
/// created_at : null
/// updated_at : null

class CategoryBanner {
  String _bannersTitle;
  String _bannersUrl;
  int _id;
  int _imageId;
  String _imageType;
  int _height;
  int _width;
  String _path;
  dynamic _createdAt;
  dynamic _updatedAt;

  String get bannersTitle => _bannersTitle;
  String get bannersUrl => _bannersUrl;
  int get id => _id;
  int get imageId => _imageId;
  String get imageType => _imageType;
  int get height => _height;
  int get width => _width;
  String get path => _path;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  CategoryBanner({
      String bannersTitle, 
      String bannersUrl, 
      int id, 
      int imageId, 
      String imageType, 
      int height, 
      int width, 
      String path, 
      dynamic createdAt, 
      dynamic updatedAt}){
    _bannersTitle = bannersTitle;
    _bannersUrl = bannersUrl;
    _id = id;
    _imageId = imageId;
    _imageType = imageType;
    _height = height;
    _width = width;
    _path = path;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CategoryBanner.fromJson(dynamic json) {
    _bannersTitle = json["banners_title"];
    _bannersUrl = json["banners_url"];
    _id = json["id"];
    _imageId = json["image_id"];
    _imageType = json["image_type"];
    _height = json["height"];
    _width = json["width"];
    _path = json["path"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["banners_title"] = _bannersTitle;
    map["banners_url"] = _bannersUrl;
    map["id"] = _id;
    map["image_id"] = _imageId;
    map["image_type"] = _imageType;
    map["height"] = _height;
    map["width"] = _width;
    map["path"] = _path;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    return map;
  }

}