import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eyecon_app/localization/localization_methods.dart';
import 'package:eyecon_app/model/add_address_model.dart';
import 'package:eyecon_app/model/add_cart_model.dart';
import 'package:eyecon_app/model/address_model.dart';
import 'package:eyecon_app/model/cart_model.dart';
import 'package:eyecon_app/model/categories_model.dart';
import 'package:eyecon_app/model/change_password_model.dart';
import 'package:eyecon_app/model/city_model.dart';
import 'package:eyecon_app/model/country_model.dart';
import 'package:eyecon_app/model/coupon_model.dart';
import 'package:eyecon_app/model/currency_model.dart';
import 'package:eyecon_app/model/delete_cart_model.dart';
import 'package:eyecon_app/model/dis_like_model.dart';
import 'package:eyecon_app/model/edit_address_model.dart';
import 'package:eyecon_app/model/faq_model.dart';
import 'package:eyecon_app/model/favorite_products_model.dart';
import 'package:eyecon_app/model/home_model.dart';
import 'package:eyecon_app/model/like_model.dart';
import 'package:eyecon_app/model/login_model.dart';
import 'package:eyecon_app/model/order_model.dart';
import 'package:eyecon_app/model/page_model.dart';
import 'package:eyecon_app/model/place_order_model.dart';
import 'package:eyecon_app/model/product_details_model.dart';
import 'package:eyecon_app/model/products_model.dart';
import 'package:eyecon_app/model/register_model.dart';
import 'package:eyecon_app/model/tax_model.dart';
import 'package:eyecon_app/model/update_cart_model.dart';
import 'package:eyecon_app/model/update_profile_model.dart';
import 'package:eyecon_app/model/wallet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class eyeconServices{
  static String TAG_BASE_URL= "https://eyecon.store/api/" ;
  Future<HomeModel> home()async{

    HomeModel homeModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getHomeGallery");

    if (response.statusCode == 200) {




      homeModel =
          HomeModel.fromJson(Map<String, dynamic>.from(response.data));
    }

    return homeModel;


  }
  Future<CountryModel> country()async{

    CountryModel countryModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getcountries");

    if (response.statusCode == 200) {




      countryModel =
          CountryModel.fromJson(Map<String, dynamic>.from(response.data));
    }

    return countryModel;


  }
  Future<CurrencyModel> currency()async{

    CurrencyModel currencyModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getcurrencies");

    if (response.statusCode == 200) {


print(response.data);

      currencyModel =
          CurrencyModel.fromJson(json.decode(response.data));
    }

    return currencyModel;


  }
  Future<CategoriesModel> categories()async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String mLanguage = sharedPreferences.getString(LANG_CODE);
    String mLang ="";
    if(mLanguage == 'ar'){
      mLang = "2";
    }else{
      mLang = "1";
    }
    Map map = Map();
    map['language_id'] = mLang;
    String body = json.encode(map);

    CategoriesModel categoriesModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getMainCategories",
    options: Options(contentType: 'application/json'),
    data: body);

    if (response.statusCode == 200) {




      categoriesModel =
          CategoriesModel.fromJson(Map<String, dynamic>.from(response.data));
    }

    return categoriesModel;


  }
  Future<ProductsModel> products(String catId)async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String mLanguage = sharedPreferences.getString(LANG_CODE);
    String mLang ="";
    if(mLanguage == 'ar'){
      mLang = "2";
    }else{
      mLang = "1";
    }
    Map map = Map();
    map['language_id'] = mLang;
    map['categories_id']=catId;
    String body = json.encode(map);

    ProductsModel productsModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getcatproducts",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {




      productsModel =
          ProductsModel.fromJson(Map<String, dynamic>.from(response.data));
    }

    return productsModel;


  }
  Future<ProductDetailsModel> productDetails(String productId)async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String mLanguage = sharedPreferences.getString(LANG_CODE);
    String mLang ="";
    if(mLanguage == 'ar'){
      mLang = "2";
    }else{
      mLang = "1";
    }
    Map map = Map();
    map['language_id'] = mLang;
    map['products_id']=productId;
    print(map);
    String body = json.encode(map);

    ProductDetailsModel productModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getallproducts",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);
      try{



      productModel = ProductDetailsModel.fromJson(json.decode(response.data));
            }
      catch(e){
        print(e.toString());
      }

    }

    return productModel;


  }
  Future<PageModel> page(String pageId)async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String mLanguage = sharedPreferences.getString(LANG_CODE);
    String mLang ="";
    if(mLanguage == 'ar'){
      mLang = "2";
    }else{
      mLang = "1";
    }
    Map map = Map();
    map['langId'] = mLang;
    map['PageId']=pageId;
    String body = json.encode(map);

    PageModel pageModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getallpages",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      pageModel =
          PageModel.fromJson(json.decode(response.data));
    }

    return pageModel;


  }
  Future<FaqModel> faq()async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String mLanguage = sharedPreferences.getString(LANG_CODE);
    String mLang ="";
    if(mLanguage == 'ar'){
      mLang = "2";
    }else{
      mLang = "1";
    }
    Map map = Map();
    map['language_id'] = mLang;

    String body = json.encode(map);

    FaqModel faqModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getfaqs",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      faqModel =
          FaqModel.fromJson(Map<String, dynamic>.from(response.data));
    }

    return faqModel;


  }
  Future<RegisterModel> register( Map map)async{



    String body = json.encode(map);

    RegisterModel registerModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "processregistration",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      registerModel =
          RegisterModel.fromJson(Map<String, dynamic>.from(response.data));
    }

    return registerModel;


  }
  Future<LoginModel> login( Map map)async{



    String body = json.encode(map);

    LoginModel loginModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "processlogin",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      loginModel =
          LoginModel.fromJson(json.decode(response.data));
    }

    return loginModel;


  }
  Future<LikeModel> likeProduct(Map map )async{

    LikeModel likeModel;
    var dio = Dio();

    FormData formData = new FormData.fromMap(map);
    print(formData.fields);

    try {
      var response = await dio.post(TAG_BASE_URL + "likeproduct",
          options: Options(contentType: 'multipart/form-data'),

          data: formData);
      print(response.data);

      if (response.statusCode == 200) {
        likeModel = LikeModel.fromJson(json.decode(response.data));



      }
    }on DioError catch(e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.




    }
    return likeModel;


  }
  Future<DisLikeModel> disLikeProduct(String productId,String customerId )async{

    DisLikeModel disLikeModel;
    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "unlikeproduct?liked_products_id= ${productId}&liked_customers_id= ${customerId}"
        );

    if (response.statusCode == 200) {




      disLikeModel = DisLikeModel.fromJson(json.decode(response.data));

    }

    return disLikeModel;




  }
  Future<FavoriteProductsModel> favoriteProducts(Map map)async{


    String body = json.encode(map);

    FavoriteProductsModel favoriteProductsModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "mylikeproduct",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);
      try{



        favoriteProductsModel =    FavoriteProductsModel.fromJson(json.decode(response.data));


      }
      catch(e){
        print(e.toString());
      }

    }

    return favoriteProductsModel;


  }
  Future<UpdateProfileModel> updateProfile( Map map)async{



    String body = json.encode(map);

    UpdateProfileModel updateProfileModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "updatecustomerinfo",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      updateProfileModel =
          UpdateProfileModel.fromJson(json.decode(response.data));
    }

    return updateProfileModel;


  }
  Future<OrderModel> orders( Map map)async{



    String body = json.encode(map);

    OrderModel orderModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getorders",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      orderModel =
          OrderModel.fromJson(Map<String, dynamic>.from(response.data));
    }

    return orderModel;


  }
  Future<WalletModel> wallet( Map map)async{



    String body = json.encode(map);

    WalletModel walletModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getTotalBlance",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      walletModel =
          WalletModel.fromJson(json.decode(response.data));
    }

    return walletModel;


  }
  Future<AddressModel> address( Map map)async{



    String body = json.encode(map);

    AddressModel addressModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getDefaultaddress",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      addressModel =
          AddressModel.fromJson(json.decode(response.data));
    }

    return addressModel;


  }
  Future<ChangePasswordModel> forgetPassword( Map map)async{



    String body = json.encode(map);

    ChangePasswordModel addressModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "processforgotpassword",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      addressModel =  ChangePasswordModel.fromJson(json.decode(response.data));

    }

    return addressModel;


  }
  Future<AddAddressModel> addAddress( Map map)async{



    String body = json.encode(map);

    AddAddressModel addressModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "addshippingaddress",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      addressModel =  AddAddressModel.fromJson(json.decode(response.data));

    }

    return addressModel;


  }
  Future<EditAddressModel> editAddress( Map map)async{



    String body = json.encode(map);

    EditAddressModel editAddressModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "updateshippingaddress",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      editAddressModel =  EditAddressModel.fromJson(json.decode(response.data));

    }

    return editAddressModel;


  }
  Future<CityModel> city( Map map)async{



    String body = json.encode(map);

    CityModel cityModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getcities",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      cityModel =  CityModel.fromJson(json.decode(response.data));

    }

    return cityModel;


  }
  Future<AddCartModel> addCart( Map map)async{



    String body = json.encode(map);

    AddCartModel addCartModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "cart/add",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      addCartModel =  AddCartModel.fromJson(json.decode(response.data));

    }

    return addCartModel;


  }
  Future<List<CartModel>> cart( Map map)async{



    String body = json.encode(map);

    List<CartModel> cartModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "cart/index",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);



    cartModel =  (response.data as List)
          .map((x) => CartModel.fromJson(x))
          .toList();
      // final parsed = jsonDecode(response.data).cast<Map<String, dynamic>>();



      // cartModel =  CartModel.fromJson(json.decode(response.data)) as List<CartModel>;

    }

    return cartModel;


  }
  Future<UpdateCartModel> updateCart( Map map)async{



    String body = json.encode(map);

    UpdateCartModel addCartModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "cart/update",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      addCartModel =   UpdateCartModel.fromJson(Map<String, dynamic>.from(response.data));

    }

    return addCartModel;


  }
  Future<DeleteCartModel> deleteCart( Map map)async{



    String body = json.encode(map);

    DeleteCartModel deleteCartModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "cart/destroy",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      deleteCartModel =   DeleteCartModel.fromJson(Map<String, dynamic>.from(response.data));

    }

    return deleteCartModel;


  }
  Future<TaxModel> tax( Map map)async{



    String body = json.encode(map);

    TaxModel taxModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "gettax",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      taxModel =      TaxModel.fromJson(json.decode(response.data));

    }

    return taxModel;


  }
  Future<CouponModel> applyCoupoun( Map map)async{



    String body = json.encode(map);

    CouponModel couponModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "getcoupon",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      couponModel =    CouponModel.fromJson(Map<String, dynamic>.from(response.data));

    }

    return couponModel;


  }
  Future<PlaceOrderModel> placeOrder( Map map)async{



    String body = json.encode(map);

    PlaceOrderModel couponModel;

    var dio = Dio();


    var response = await dio.post(TAG_BASE_URL + "addtoorder",
        options: Options(contentType: 'application/json'),
        data: body);

    if (response.statusCode == 200) {
      print(response.data);




      couponModel =   PlaceOrderModel.fromJson(json.decode(response.data));

    }

    return couponModel;


  }
}