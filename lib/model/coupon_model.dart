/// coupans_id : 1
/// code : "EYE2021"
/// date_created : null
/// date_modified : null
/// description : "test"
/// discount_type : "percent"
/// amount : 10
/// expiry_date : "2021-07-10 00:00:00"
/// usage_count : 0
/// individual_use : 0
/// usage_limit : null
/// usage_limit_per_user : null
/// limit_usage_to_x_items : 0
/// free_shipping : 0
/// exclude_sale_items : 0
/// minimum_amount : "10.00"
/// maximum_amount : "100.00"
/// created_at : "2021-02-25 16:17:32"
/// updated_at : "2021-06-15 19:41:16"
/// total_order_value : 7920
/// post_discount_price : 7820
/// discounted_amount : "100.00"

class CouponModel {
  int _coupansId;
  String _code;
  dynamic _dateCreated;
  dynamic _dateModified;
  String _description;
  String _discountType;
  int _amount;
  String _expiryDate;
  int _usageCount;
  int _individualUse;
  dynamic _usageLimit;
  dynamic _usageLimitPerUser;
  int _limitUsageToXItems;
  int _freeShipping;
  int _excludeSaleItems;
  String _minimumAmount;
  String _maximumAmount;
  String _createdAt;
  String _updatedAt;
  int _totalOrderValue;
  int _postDiscountPrice;
  String _discountedAmount;

  int get coupansId => _coupansId;
  String get code => _code;
  dynamic get dateCreated => _dateCreated;
  dynamic get dateModified => _dateModified;
  String get description => _description;
  String get discountType => _discountType;
  int get amount => _amount;
  String get expiryDate => _expiryDate;
  int get usageCount => _usageCount;
  int get individualUse => _individualUse;
  dynamic get usageLimit => _usageLimit;
  dynamic get usageLimitPerUser => _usageLimitPerUser;
  int get limitUsageToXItems => _limitUsageToXItems;
  int get freeShipping => _freeShipping;
  int get excludeSaleItems => _excludeSaleItems;
  String get minimumAmount => _minimumAmount;
  String get maximumAmount => _maximumAmount;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get totalOrderValue => _totalOrderValue;
  int get postDiscountPrice => _postDiscountPrice;
  String get discountedAmount => _discountedAmount;

  CouponModel({
      int coupansId, 
      String code, 
      dynamic dateCreated, 
      dynamic dateModified, 
      String description, 
      String discountType, 
      int amount, 
      String expiryDate, 
      int usageCount, 
      int individualUse, 
      dynamic usageLimit, 
      dynamic usageLimitPerUser, 
      int limitUsageToXItems, 
      int freeShipping, 
      int excludeSaleItems, 
      String minimumAmount, 
      String maximumAmount, 
      String createdAt, 
      String updatedAt, 
      int totalOrderValue, 
      int postDiscountPrice, 
      String discountedAmount}){
    _coupansId = coupansId;
    _code = code;
    _dateCreated = dateCreated;
    _dateModified = dateModified;
    _description = description;
    _discountType = discountType;
    _amount = amount;
    _expiryDate = expiryDate;
    _usageCount = usageCount;
    _individualUse = individualUse;
    _usageLimit = usageLimit;
    _usageLimitPerUser = usageLimitPerUser;
    _limitUsageToXItems = limitUsageToXItems;
    _freeShipping = freeShipping;
    _excludeSaleItems = excludeSaleItems;
    _minimumAmount = minimumAmount;
    _maximumAmount = maximumAmount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _totalOrderValue = totalOrderValue;
    _postDiscountPrice = postDiscountPrice;
    _discountedAmount = discountedAmount;
}

  CouponModel.fromJson(dynamic json) {
    _coupansId = json["coupans_id"];
    _code = json["code"];
    _dateCreated = json["date_created"];
    _dateModified = json["date_modified"];
    _description = json["description"];
    _discountType = json["discount_type"];
    _amount = json["amount"];
    _expiryDate = json["expiry_date"];
    _usageCount = json["usage_count"];
    _individualUse = json["individual_use"];
    _usageLimit = json["usage_limit"];
    _usageLimitPerUser = json["usage_limit_per_user"];
    _limitUsageToXItems = json["limit_usage_to_x_items"];
    _freeShipping = json["free_shipping"];
    _excludeSaleItems = json["exclude_sale_items"];
    _minimumAmount = json["minimum_amount"];
    _maximumAmount = json["maximum_amount"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _totalOrderValue = json["total_order_value"];
    _postDiscountPrice = json["post_discount_price"];
    _discountedAmount = json["discounted_amount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["coupans_id"] = _coupansId;
    map["code"] = _code;
    map["date_created"] = _dateCreated;
    map["date_modified"] = _dateModified;
    map["description"] = _description;
    map["discount_type"] = _discountType;
    map["amount"] = _amount;
    map["expiry_date"] = _expiryDate;
    map["usage_count"] = _usageCount;
    map["individual_use"] = _individualUse;
    map["usage_limit"] = _usageLimit;
    map["usage_limit_per_user"] = _usageLimitPerUser;
    map["limit_usage_to_x_items"] = _limitUsageToXItems;
    map["free_shipping"] = _freeShipping;
    map["exclude_sale_items"] = _excludeSaleItems;
    map["minimum_amount"] = _minimumAmount;
    map["maximum_amount"] = _maximumAmount;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["total_order_value"] = _totalOrderValue;
    map["post_discount_price"] = _postDiscountPrice;
    map["discounted_amount"] = _discountedAmount;
    return map;
  }

}