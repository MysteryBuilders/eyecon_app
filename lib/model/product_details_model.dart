/// success : "1"
/// product_data : [{"products_id":2,"products_quantity":-71,"products_model":"msd","products_image":"204","products_video_link":null,"products_price":"100.00","products_date_added":"0000-00-00 00:00:00","products_last_modified":null,"products_date_available":null,"products_weight":"5","products_weight_unit":"1pc","products_status":1,"is_current":1,"products_tax_class_id":1,"manufacturers_id":null,"products_ordered":37,"products_liked":1,"low_limit":0,"is_feature":0,"products_slug":"dailies-total1-multifocal-contact-lenses","products_type":1,"products_min_order":1,"products_max_stock":1,"created_at":null,"updated_at":null,"manufacturer_name":null,"manufacturer_image":null,"manufacturers_slug":null,"date_added":null,"last_modified":null,"manufacturers_image":null,"languages_id":null,"manufacturers_url":null,"url_clicked":null,"date_last_click":null,"id":292,"language_id":1,"products_name":"DAILIES TOTAL1®  MULTIFOCAL CONTACT LENSES","products_description":"<ul>\r\n\t<li>Presbyopia, the inability to see sharp images up close as the eye ages</li>\r\n\t<li>Individuals currently wearing readers or wearing contact lenses who are having difficulty with near vision</li>\r\n\t<li>Individuals with presbyopia who experience contact lens-related dryness</li>\r\n</ul>","products_url":null,"products_viewed":0,"products_left_banner":null,"products_left_banner_start_date":0,"products_left_banner_expire_date":0,"products_right_banner":null,"products_right_banner_start_date":0,"products_right_banner_expire_date":0,"image_id":204,"image_type":"ACTUAL","height":1800,"width":1200,"path":"images/media/2021/03/RTxzb02207.jpg","currency":null,"images":[{"id":2,"products_id":2,"image":"images/media/2020/11/5TOHA22203.jpg","htmlcontent":null,"sort_order":2},{"id":3,"products_id":2,"image":"images/media/2020/11/Rc3X616405.png","htmlcontent":null,"sort_order":3},{"id":8,"products_id":2,"image":"images/media/2021/03/RTxzb02207.jpg","htmlcontent":null,"sort_order":4}],"categories":[{"categories_id":1,"categories_name":"Contact Lens","categories_image":"121","categories_icon":"122","parent_id":0}],"rating":"0.00","total_user_rated":0,"five_ratio":0,"four_ratio":0,"three_ratio":0,"two_ratio":0,"one_ratio":0,"defaultStock":0,"isLiked":"0","attributes":[{"option":{"id":1,"name":"Size"},"values":[{"products_attributes_id":2,"id":3,"value":"Small","price":"10.00","price_prefix":"+"},{"products_attributes_id":3,"id":4,"value":"Large","price":"10.00","price_prefix":"+"}]},{"option":{"id":2,"name":"color"},"values":[{"products_attributes_id":1,"id":2,"value":"White","price":"10.00","price_prefix":"+"},{"products_attributes_id":4,"id":1,"value":"Black","price":"10.00","price_prefix":"+"}]},{"option":{"id":3,"name":"Power for left"},"values":[{"products_attributes_id":7,"id":5,"value":"-2.05","price":"10.00","price_prefix":"+"},{"products_attributes_id":8,"id":6,"value":"+2.25","price":"10.00","price_prefix":"+"}]},{"option":{"id":4,"name":"Power for right"},"values":[{"products_attributes_id":9,"id":7,"value":"-2.25","price":"10.00","price_prefix":"+"},{"products_attributes_id":10,"id":10,"value":"+2.5","price":"10.00","price_prefix":"+"}]}]}]
/// message : "Returned all products."
/// total_record : 1

class ProductDetailsModel {
  String _success;
  List<Product_data> _productData;
  String _message;
  int _totalRecord;

  String get success => _success;
  List<Product_data> get productData => _productData;
  String get message => _message;
  int get totalRecord => _totalRecord;

  ProductDetailsModel({
      String success, 
      List<Product_data> productData, 
      String message, 
      int totalRecord}){
    _success = success;
    _productData = productData;
    _message = message;
    _totalRecord = totalRecord;
}

  ProductDetailsModel.fromJson(dynamic json) {
    _success = json["success"];
    if (json["product_data"] != null) {
      _productData = [];
      json["product_data"].forEach((v) {
        _productData.add(Product_data.fromJson(v));
      });
    }
    _message = json["message"];
    _totalRecord = json["total_record"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_productData != null) {
      map["product_data"] = _productData.map((v) => v.toJson()).toList();
    }
    map["message"] = _message;
    map["total_record"] = _totalRecord;
    return map;
  }

}

/// products_id : 2
/// products_quantity : -71
/// products_model : "msd"
/// products_image : "204"
/// products_video_link : null
/// products_price : "100.00"
/// products_date_added : "0000-00-00 00:00:00"
/// products_last_modified : null
/// products_date_available : null
/// products_weight : "5"
/// products_weight_unit : "1pc"
/// products_status : 1
/// is_current : 1
/// products_tax_class_id : 1
/// manufacturers_id : null
/// products_ordered : 37
/// products_liked : 1
/// low_limit : 0
/// is_feature : 0
/// products_slug : "dailies-total1-multifocal-contact-lenses"
/// products_type : 1
/// products_min_order : 1
/// products_max_stock : 1
/// created_at : null
/// updated_at : null
/// manufacturer_name : null
/// manufacturer_image : null
/// manufacturers_slug : null
/// date_added : null
/// last_modified : null
/// manufacturers_image : null
/// languages_id : null
/// manufacturers_url : null
/// url_clicked : null
/// date_last_click : null
/// id : 292
/// language_id : 1
/// products_name : "DAILIES TOTAL1®  MULTIFOCAL CONTACT LENSES"
/// products_description : "<ul>\r\n\t<li>Presbyopia, the inability to see sharp images up close as the eye ages</li>\r\n\t<li>Individuals currently wearing readers or wearing contact lenses who are having difficulty with near vision</li>\r\n\t<li>Individuals with presbyopia who experience contact lens-related dryness</li>\r\n</ul>"
/// products_url : null
/// products_viewed : 0
/// products_left_banner : null
/// products_left_banner_start_date : 0
/// products_left_banner_expire_date : 0
/// products_right_banner : null
/// products_right_banner_start_date : 0
/// products_right_banner_expire_date : 0
/// image_id : 204
/// image_type : "ACTUAL"
/// height : 1800
/// width : 1200
/// path : "images/media/2021/03/RTxzb02207.jpg"
/// currency : null
/// images : [{"id":2,"products_id":2,"image":"images/media/2020/11/5TOHA22203.jpg","htmlcontent":null,"sort_order":2},{"id":3,"products_id":2,"image":"images/media/2020/11/Rc3X616405.png","htmlcontent":null,"sort_order":3},{"id":8,"products_id":2,"image":"images/media/2021/03/RTxzb02207.jpg","htmlcontent":null,"sort_order":4}]
/// categories : [{"categories_id":1,"categories_name":"Contact Lens","categories_image":"121","categories_icon":"122","parent_id":0}]
/// rating : "0.00"
/// total_user_rated : 0
/// five_ratio : 0
/// four_ratio : 0
/// three_ratio : 0
/// two_ratio : 0
/// one_ratio : 0
/// defaultStock : 0
/// isLiked : "0"
/// attributes : [{"option":{"id":1,"name":"Size"},"values":[{"products_attributes_id":2,"id":3,"value":"Small","price":"10.00","price_prefix":"+"},{"products_attributes_id":3,"id":4,"value":"Large","price":"10.00","price_prefix":"+"}]},{"option":{"id":2,"name":"color"},"values":[{"products_attributes_id":1,"id":2,"value":"White","price":"10.00","price_prefix":"+"},{"products_attributes_id":4,"id":1,"value":"Black","price":"10.00","price_prefix":"+"}]},{"option":{"id":3,"name":"Power for left"},"values":[{"products_attributes_id":7,"id":5,"value":"-2.05","price":"10.00","price_prefix":"+"},{"products_attributes_id":8,"id":6,"value":"+2.25","price":"10.00","price_prefix":"+"}]},{"option":{"id":4,"name":"Power for right"},"values":[{"products_attributes_id":9,"id":7,"value":"-2.25","price":"10.00","price_prefix":"+"},{"products_attributes_id":10,"id":10,"value":"+2.5","price":"10.00","price_prefix":"+"}]}]

class Product_data {
  int _productsId;
  int _productsQuantity;
  String _productsModel;
  String _productsImage;
  dynamic _productsVideoLink;
  String _productsPrice;
  String _productsDateAdded;
  dynamic _productsLastModified;
  dynamic _productsDateAvailable;
  String _productsWeight;
  String _productsWeightUnit;
  int _productsStatus;
  int _isCurrent;
  int _productsTaxClassId;
  dynamic _manufacturersId;
  int _productsOrdered;
  int _productsLiked;
  int _lowLimit;
  int _isFeature;
  String _productsSlug;
  int _productsType;
  int _productsMinOrder;
  int _productsMaxStock;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _manufacturerName;
  dynamic _manufacturerImage;
  dynamic _manufacturersSlug;
  dynamic _dateAdded;
  dynamic _lastModified;
  dynamic _manufacturersImage;
  dynamic _languagesId;
  dynamic _manufacturersUrl;
  dynamic _urlClicked;
  dynamic _dateLastClick;
  int _id;
  int _languageId;
  String _productsName;
  String _productsDescription;
  dynamic _productsUrl;
  int _productsViewed;
  dynamic _productsLeftBanner;
  int _productsLeftBannerStartDate;
  int _productsLeftBannerExpireDate;
  dynamic _productsRightBanner;
  int _productsRightBannerStartDate;
  int _productsRightBannerExpireDate;
  int _imageId;
  String _imageType;
  int _height;
  int _width;
  String _path;
  dynamic _currency;
  List<Images> _images;
  List<Categories> _categories;
  String _rating;
  int _totalUserRated;
  int _fiveRatio;
  int _fourRatio;
  int _threeRatio;
  int _twoRatio;
  int _oneRatio;
  int _defaultStock;
  String _isLiked;
  List<Attributes> _attributes;

  int get productsId => _productsId;
  int get productsQuantity => _productsQuantity;
  String get productsModel => _productsModel;
  String get productsImage => _productsImage;
  dynamic get productsVideoLink => _productsVideoLink;
  String get productsPrice => _productsPrice;
  String get productsDateAdded => _productsDateAdded;
  dynamic get productsLastModified => _productsLastModified;
  dynamic get productsDateAvailable => _productsDateAvailable;
  String get productsWeight => _productsWeight;
  String get productsWeightUnit => _productsWeightUnit;
  int get productsStatus => _productsStatus;
  int get isCurrent => _isCurrent;
  int get productsTaxClassId => _productsTaxClassId;
  dynamic get manufacturersId => _manufacturersId;
  int get productsOrdered => _productsOrdered;
  int get productsLiked => _productsLiked;
  int get lowLimit => _lowLimit;
  int get isFeature => _isFeature;
  String get productsSlug => _productsSlug;
  int get productsType => _productsType;
  int get productsMinOrder => _productsMinOrder;
  int get productsMaxStock => _productsMaxStock;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  dynamic get manufacturerName => _manufacturerName;
  dynamic get manufacturerImage => _manufacturerImage;
  dynamic get manufacturersSlug => _manufacturersSlug;
  dynamic get dateAdded => _dateAdded;
  dynamic get lastModified => _lastModified;
  dynamic get manufacturersImage => _manufacturersImage;
  dynamic get languagesId => _languagesId;
  dynamic get manufacturersUrl => _manufacturersUrl;
  dynamic get urlClicked => _urlClicked;
  dynamic get dateLastClick => _dateLastClick;
  int get id => _id;
  int get languageId => _languageId;
  String get productsName => _productsName;
  String get productsDescription => _productsDescription;
  dynamic get productsUrl => _productsUrl;
  int get productsViewed => _productsViewed;
  dynamic get productsLeftBanner => _productsLeftBanner;
  int get productsLeftBannerStartDate => _productsLeftBannerStartDate;
  int get productsLeftBannerExpireDate => _productsLeftBannerExpireDate;
  dynamic get productsRightBanner => _productsRightBanner;
  int get productsRightBannerStartDate => _productsRightBannerStartDate;
  int get productsRightBannerExpireDate => _productsRightBannerExpireDate;
  int get imageId => _imageId;
  String get imageType => _imageType;
  int get height => _height;
  int get width => _width;
  String get path => _path;
  dynamic get currency => _currency;
  List<Images> get images => _images;
  List<Categories> get categories => _categories;
  String get rating => _rating;
  int get totalUserRated => _totalUserRated;
  int get fiveRatio => _fiveRatio;
  int get fourRatio => _fourRatio;
  int get threeRatio => _threeRatio;
  int get twoRatio => _twoRatio;
  int get oneRatio => _oneRatio;
  int get defaultStock => _defaultStock;
  String get isLiked => _isLiked;
  List<Attributes> get attributes => _attributes;

  Product_data({
      int productsId, 
      int productsQuantity, 
      String productsModel, 
      String productsImage, 
      dynamic productsVideoLink, 
      String productsPrice, 
      String productsDateAdded, 
      dynamic productsLastModified, 
      dynamic productsDateAvailable, 
      String productsWeight, 
      String productsWeightUnit, 
      int productsStatus, 
      int isCurrent, 
      int productsTaxClassId, 
      dynamic manufacturersId, 
      int productsOrdered, 
      int productsLiked, 
      int lowLimit, 
      int isFeature, 
      String productsSlug, 
      int productsType, 
      int productsMinOrder, 
      int productsMaxStock, 
      dynamic createdAt, 
      dynamic updatedAt, 
      dynamic manufacturerName, 
      dynamic manufacturerImage, 
      dynamic manufacturersSlug, 
      dynamic dateAdded, 
      dynamic lastModified, 
      dynamic manufacturersImage, 
      dynamic languagesId, 
      dynamic manufacturersUrl, 
      dynamic urlClicked, 
      dynamic dateLastClick, 
      int id, 
      int languageId, 
      String productsName, 
      String productsDescription, 
      dynamic productsUrl, 
      int productsViewed, 
      dynamic productsLeftBanner, 
      int productsLeftBannerStartDate, 
      int productsLeftBannerExpireDate, 
      dynamic productsRightBanner, 
      int productsRightBannerStartDate, 
      int productsRightBannerExpireDate, 
      int imageId, 
      String imageType, 
      int height, 
      int width, 
      String path, 
      dynamic currency, 
      List<Images> images, 
      List<Categories> categories, 
      String rating, 
      int totalUserRated, 
      int fiveRatio, 
      int fourRatio, 
      int threeRatio, 
      int twoRatio, 
      int oneRatio, 
      int defaultStock, 
      String isLiked, 
      List<Attributes> attributes}){
    _productsId = productsId;
    _productsQuantity = productsQuantity;
    _productsModel = productsModel;
    _productsImage = productsImage;
    _productsVideoLink = productsVideoLink;
    _productsPrice = productsPrice;
    _productsDateAdded = productsDateAdded;
    _productsLastModified = productsLastModified;
    _productsDateAvailable = productsDateAvailable;
    _productsWeight = productsWeight;
    _productsWeightUnit = productsWeightUnit;
    _productsStatus = productsStatus;
    _isCurrent = isCurrent;
    _productsTaxClassId = productsTaxClassId;
    _manufacturersId = manufacturersId;
    _productsOrdered = productsOrdered;
    _productsLiked = productsLiked;
    _lowLimit = lowLimit;
    _isFeature = isFeature;
    _productsSlug = productsSlug;
    _productsType = productsType;
    _productsMinOrder = productsMinOrder;
    _productsMaxStock = productsMaxStock;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _manufacturerName = manufacturerName;
    _manufacturerImage = manufacturerImage;
    _manufacturersSlug = manufacturersSlug;
    _dateAdded = dateAdded;
    _lastModified = lastModified;
    _manufacturersImage = manufacturersImage;
    _languagesId = languagesId;
    _manufacturersUrl = manufacturersUrl;
    _urlClicked = urlClicked;
    _dateLastClick = dateLastClick;
    _id = id;
    _languageId = languageId;
    _productsName = productsName;
    _productsDescription = productsDescription;
    _productsUrl = productsUrl;
    _productsViewed = productsViewed;
    _productsLeftBanner = productsLeftBanner;
    _productsLeftBannerStartDate = productsLeftBannerStartDate;
    _productsLeftBannerExpireDate = productsLeftBannerExpireDate;
    _productsRightBanner = productsRightBanner;
    _productsRightBannerStartDate = productsRightBannerStartDate;
    _productsRightBannerExpireDate = productsRightBannerExpireDate;
    _imageId = imageId;
    _imageType = imageType;
    _height = height;
    _width = width;
    _path = path;
    _currency = currency;
    _images = images;
    _categories = categories;
    _rating = rating;
    _totalUserRated = totalUserRated;
    _fiveRatio = fiveRatio;
    _fourRatio = fourRatio;
    _threeRatio = threeRatio;
    _twoRatio = twoRatio;
    _oneRatio = oneRatio;
    _defaultStock = defaultStock;
    _isLiked = isLiked;
    _attributes = attributes;
}

  Product_data.fromJson(dynamic json) {
    _productsId = json["products_id"];
    _productsQuantity = json["products_quantity"];
    _productsModel = json["products_model"];
    _productsImage = json["products_image"];
    _productsVideoLink = json["products_video_link"];
    _productsPrice = json["products_price"];
    _productsDateAdded = json["products_date_added"];
    _productsLastModified = json["products_last_modified"];
    _productsDateAvailable = json["products_date_available"];
    _productsWeight = json["products_weight"];
    _productsWeightUnit = json["products_weight_unit"];
    _productsStatus = json["products_status"];
    _isCurrent = json["is_current"];
    _productsTaxClassId = json["products_tax_class_id"];
    _manufacturersId = json["manufacturers_id"];
    _productsOrdered = json["products_ordered"];
    _productsLiked = json["products_liked"];
    _lowLimit = json["low_limit"];
    _isFeature = json["is_feature"];
    _productsSlug = json["products_slug"];
    _productsType = json["products_type"];
    _productsMinOrder = json["products_min_order"];
    _productsMaxStock = json["products_max_stock"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _manufacturerName = json["manufacturer_name"];
    _manufacturerImage = json["manufacturer_image"];
    _manufacturersSlug = json["manufacturers_slug"];
    _dateAdded = json["date_added"];
    _lastModified = json["last_modified"];
    _manufacturersImage = json["manufacturers_image"];
    _languagesId = json["languages_id"];
    _manufacturersUrl = json["manufacturers_url"];
    _urlClicked = json["url_clicked"];
    _dateLastClick = json["date_last_click"];
    _id = json["id"];
    _languageId = json["language_id"];
    _productsName = json["products_name"];
    _productsDescription = json["products_description"];
    _productsUrl = json["products_url"];
    _productsViewed = json["products_viewed"];
    _productsLeftBanner = json["products_left_banner"];
    _productsLeftBannerStartDate = json["products_left_banner_start_date"];
    _productsLeftBannerExpireDate = json["products_left_banner_expire_date"];
    _productsRightBanner = json["products_right_banner"];
    _productsRightBannerStartDate = json["products_right_banner_start_date"];
    _productsRightBannerExpireDate = json["products_right_banner_expire_date"];
    _imageId = json["image_id"];
    _imageType = json["image_type"];
    _height = json["height"];
    _width = json["width"];
    _path = json["path"];
    _currency = json["currency"];
    if (json["images"] != null) {
      _images = [];
      json["images"].forEach((v) {
        _images.add(Images.fromJson(v));
      });
    }
    if (json["categories"] != null) {
      _categories = [];
      json["categories"].forEach((v) {
        _categories.add(Categories.fromJson(v));
      });
    }
    _rating = json["rating"];
    _totalUserRated = json["total_user_rated"];
    _fiveRatio = json["five_ratio"];
    _fourRatio = json["four_ratio"];
    _threeRatio = json["three_ratio"];
    _twoRatio = json["two_ratio"];
    _oneRatio = json["one_ratio"];
    _defaultStock = json["defaultStock"];
    _isLiked = json["isLiked"];
    if (json["attributes"] != null) {
      _attributes = [];
      json["attributes"].forEach((v) {
        _attributes.add(Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["products_id"] = _productsId;
    map["products_quantity"] = _productsQuantity;
    map["products_model"] = _productsModel;
    map["products_image"] = _productsImage;
    map["products_video_link"] = _productsVideoLink;
    map["products_price"] = _productsPrice;
    map["products_date_added"] = _productsDateAdded;
    map["products_last_modified"] = _productsLastModified;
    map["products_date_available"] = _productsDateAvailable;
    map["products_weight"] = _productsWeight;
    map["products_weight_unit"] = _productsWeightUnit;
    map["products_status"] = _productsStatus;
    map["is_current"] = _isCurrent;
    map["products_tax_class_id"] = _productsTaxClassId;
    map["manufacturers_id"] = _manufacturersId;
    map["products_ordered"] = _productsOrdered;
    map["products_liked"] = _productsLiked;
    map["low_limit"] = _lowLimit;
    map["is_feature"] = _isFeature;
    map["products_slug"] = _productsSlug;
    map["products_type"] = _productsType;
    map["products_min_order"] = _productsMinOrder;
    map["products_max_stock"] = _productsMaxStock;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["manufacturer_name"] = _manufacturerName;
    map["manufacturer_image"] = _manufacturerImage;
    map["manufacturers_slug"] = _manufacturersSlug;
    map["date_added"] = _dateAdded;
    map["last_modified"] = _lastModified;
    map["manufacturers_image"] = _manufacturersImage;
    map["languages_id"] = _languagesId;
    map["manufacturers_url"] = _manufacturersUrl;
    map["url_clicked"] = _urlClicked;
    map["date_last_click"] = _dateLastClick;
    map["id"] = _id;
    map["language_id"] = _languageId;
    map["products_name"] = _productsName;
    map["products_description"] = _productsDescription;
    map["products_url"] = _productsUrl;
    map["products_viewed"] = _productsViewed;
    map["products_left_banner"] = _productsLeftBanner;
    map["products_left_banner_start_date"] = _productsLeftBannerStartDate;
    map["products_left_banner_expire_date"] = _productsLeftBannerExpireDate;
    map["products_right_banner"] = _productsRightBanner;
    map["products_right_banner_start_date"] = _productsRightBannerStartDate;
    map["products_right_banner_expire_date"] = _productsRightBannerExpireDate;
    map["image_id"] = _imageId;
    map["image_type"] = _imageType;
    map["height"] = _height;
    map["width"] = _width;
    map["path"] = _path;
    map["currency"] = _currency;
    if (_images != null) {
      map["images"] = _images.map((v) => v.toJson()).toList();
    }
    if (_categories != null) {
      map["categories"] = _categories.map((v) => v.toJson()).toList();
    }
    map["rating"] = _rating;
    map["total_user_rated"] = _totalUserRated;
    map["five_ratio"] = _fiveRatio;
    map["four_ratio"] = _fourRatio;
    map["three_ratio"] = _threeRatio;
    map["two_ratio"] = _twoRatio;
    map["one_ratio"] = _oneRatio;
    map["defaultStock"] = _defaultStock;
    map["isLiked"] = _isLiked;
    if (_attributes != null) {
      map["attributes"] = _attributes.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// option : {"id":1,"name":"Size"}
/// values : [{"products_attributes_id":2,"id":3,"value":"Small","price":"10.00","price_prefix":"+"},{"products_attributes_id":3,"id":4,"value":"Large","price":"10.00","price_prefix":"+"}]

class Attributes {
  Option _option;
  List<Values> _values;

  Option get option => _option;
  List<Values> get values => _values;

  Attributes({
      Option option, 
      List<Values> values}){
    _option = option;
    _values = values;
}

  Attributes.fromJson(dynamic json) {
    _option = json["option"] != null ? Option.fromJson(json["option"]) : null;
    if (json["values"] != null) {
      _values = [];
      json["values"].forEach((v) {
        _values.add(Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_option != null) {
      map["option"] = _option.toJson();
    }
    if (_values != null) {
      map["values"] = _values.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// products_attributes_id : 2
/// id : 3
/// value : "Small"
/// price : "10.00"
/// price_prefix : "+"

class Values {
  int _productsAttributesId;
  int _id;
  String _value;
  String _price;
  String _pricePrefix;
  bool _isSelected;

  int get productsAttributesId => _productsAttributesId;
  int get id => _id;
  String get value => _value;
  String get price => _price;
  String get pricePrefix => _pricePrefix;
  bool get isSelected =>_isSelected;

  Values({
      int productsAttributesId, 
      int id, 
      String value, 
      String price, 
      String pricePrefix,bool isSelected}){
    _productsAttributesId = productsAttributesId;
    _isSelected = isSelected;
    _id = id;
    _value = value;
    _price = price;
    _pricePrefix = pricePrefix;
}

  Values.fromJson(dynamic json) {
    _productsAttributesId = json["products_attributes_id"];
    _id = json["id"];
    _isSelected = false;
    _value = json["value"];
    _price = json["price"];
    _pricePrefix = json["price_prefix"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["products_attributes_id"] = _productsAttributesId;
    map["id"] = _id;
    map["value"] = _value;
    map["price"] = _price;
    map["price_prefix"] = _pricePrefix;
    map['isSelected'] = _isSelected;
    return map;
  }

}

/// id : 1
/// name : "Size"

class Option {
  int _id;
  String _name;

  int get id => _id;
  String get name => _name;

  Option({
      int id, 
      String name}){
    _id = id;
    _name = name;
}

  Option.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }

}

/// categories_id : 1
/// categories_name : "Contact Lens"
/// categories_image : "121"
/// categories_icon : "122"
/// parent_id : 0

class Categories {
  int _categoriesId;
  String _categoriesName;
  String _categoriesImage;
  String _categoriesIcon;
  int _parentId;

  int get categoriesId => _categoriesId;
  String get categoriesName => _categoriesName;
  String get categoriesImage => _categoriesImage;
  String get categoriesIcon => _categoriesIcon;
  int get parentId => _parentId;

  Categories({
      int categoriesId, 
      String categoriesName, 
      String categoriesImage, 
      String categoriesIcon, 
      int parentId}){
    _categoriesId = categoriesId;
    _categoriesName = categoriesName;
    _categoriesImage = categoriesImage;
    _categoriesIcon = categoriesIcon;
    _parentId = parentId;
}

  Categories.fromJson(dynamic json) {
    _categoriesId = json["categories_id"];
    _categoriesName = json["categories_name"];
    _categoriesImage = json["categories_image"];
    _categoriesIcon = json["categories_icon"];
    _parentId = json["parent_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["categories_id"] = _categoriesId;
    map["categories_name"] = _categoriesName;
    map["categories_image"] = _categoriesImage;
    map["categories_icon"] = _categoriesIcon;
    map["parent_id"] = _parentId;
    return map;
  }

}

/// id : 2
/// products_id : 2
/// image : "images/media/2020/11/5TOHA22203.jpg"
/// htmlcontent : null
/// sort_order : 2

class Images {
  int _id;
  int _productsId;
  String _image;
  dynamic _htmlcontent;
  int _sortOrder;

  int get id => _id;
  int get productsId => _productsId;
  String get image => _image;
  dynamic get htmlcontent => _htmlcontent;
  int get sortOrder => _sortOrder;

  Images({
      int id, 
      int productsId, 
      String image, 
      dynamic htmlcontent, 
      int sortOrder}){
    _id = id;
    _productsId = productsId;
    _image = image;
    _htmlcontent = htmlcontent;
    _sortOrder = sortOrder;
}

  Images.fromJson(dynamic json) {
    _id = json["id"];
    _productsId = json["products_id"];
    _image = json["image"];
    _htmlcontent = json["htmlcontent"];
    _sortOrder = json["sort_order"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["products_id"] = _productsId;
    map["image"] = _image;
    map["htmlcontent"] = _htmlcontent;
    map["sort_order"] = _sortOrder;
    return map;
  }

}