import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/localization/localization_methods.dart';
import 'package:eyecon_app/model/favorite_products_model.dart';
import 'package:eyecon_app/model/login_model.dart';
import 'package:eyecon_app/screens/product_details_screen.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
class WishListScreen extends StatefulWidget {
  const WishListScreen({Key key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  FavoriteProductsModel productsModel;
  ScreenUtil screenUtil = ScreenUtil();
  double itemWidth;
  double itemHeight;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    products().then((value){
      setState(() {
        productsModel = value;
      });

    });

  }
  Future<FavoriteProductsModel> products() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> map = Map();
    String mLanguage = sharedPreferences.getString(LANG_CODE);
    String mLang ="";
    if(mLanguage == 'ar'){
      mLang = "2";
    }else{
      mLang = "1";
    }
    String loginData = sharedPreferences.getString(kUserModel);
    final body = json.decode(loginData);
    LoginModel   loginModel = LoginModel.fromJson(body);
    String userId = loginModel.data[0].id.toString();
    map['language_id'] = mLang;
    map['type'] = 'wishlist';
    map['customer_id'] = userId;
    eyeconServices services = eyeconServices();
    FavoriteProductsModel productsModel = await services.favoriteProducts(map);
    return productsModel;
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    itemWidth = width / 2;
    itemHeight = 240.h;
    return Scaffold(
      appBar:   AppBar(
        centerTitle: true,
        title:Container(
          width: screenUtil.screenWidth,
          child: Center(
            child: Text('Whishlist',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFE4937C),
                  fontWeight: FontWeight.w500,

                  fontSize: screenUtil.setSp(17)
              ),),
          ),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        leading:
        GestureDetector(
          onTap: (){
            Navigator.pop(context);

          },
          child: Icon(Icons.arrow_back_ios_outlined,color: Color(0xFFE4937C),size: 20.h,),
        ),

        actions: [





        ],

      ),
      body: productsModel == null?
      Container(
        child: CircularProgressIndicator(


        ),
        alignment: AlignmentDirectional.center,
      )  : Container(
        margin: EdgeInsets.all(10.w),
        child:      GridView.builder(
          scrollDirection: Axis.vertical,


          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,
              childAspectRatio:itemWidth/itemHeight),
          itemCount: productsModel.productData.length,

          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                _buttonTapped(productsModel.productData[index].productsId.toString());

              },
              child: Container(



                  child:
                  buildItem(productsModel.productData[index],context)),
            );
          },
        ),

      ),

    );
  }

  buildItem(Product_data productData, BuildContext context) {
    return  Container(
      margin: EdgeInsets.all( 5.w),

      child: Column(
        children: [
          Expanded(child:
          Container(

            color: Color(0xFFE8E7E7),
            child: Container(
              margin: EdgeInsets.all(20.w),
              child: CachedNetworkImage(



                fit: BoxFit.fill,
                imageUrl:'${TAG_IMAGE_URL}${productData.productsImage}',
                imageBuilder: (context, imageProvider) => Container(



                    decoration: BoxDecoration(



                      image: DecorationImage(


                          fit: BoxFit.fill,
                          image: imageProvider),
                    )
                ),
                placeholder: (context, url) =>
                    Column(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(



                            alignment: FractionalOffset.center,
                            child: SizedBox(
                                height: 50.h,
                                width: 50.h,
                                child: new CircularProgressIndicator()),
                          ),
                        ),
                      ],
                    ),


                errorWidget: (context, url, error) => Container(

                    alignment: FractionalOffset.center,
                    child: Icon(Icons.image_not_supported)),

              ),
            ),
          ),
            flex: 3,),
          Expanded(flex:1,child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Expanded(flex:2,child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(

                    productData.productsName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(8),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                )),
                Expanded(flex:1,child: Text(

                  productData.productsPrice+" KWD",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Color(0xFFEFA18B),
                      fontSize: screenUtil.setSp(7),
                      fontWeight: FontWeight.w600
                  ),
                )),
                Expanded(flex:1,child: Text(

                  productData.productsPrice+" KWD",
                  textAlign: TextAlign.start,
                  style: TextStyle(

                      color: Color(0xFF000000),
                      fontSize: screenUtil.setSp(10),
                      fontWeight: FontWeight.bold
                  ),
                ))
              ],
            ),

          ))
        ],
      ),

    );
  }
  Future _buttonTapped(String productId) async {
    Map results = await Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
      return new ProductDetailsScreen(productId:productId);
    }));
    // push(new MaterialPageRoute<dynamic>(
    //   builder: (BuildContext context) {
    //     return new CurrencyScreen();
    //   },
    // ));

    if (results != null && results.containsKey('selection')) {
      productsModel = null;
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      Map<String, dynamic> map = Map();
      String mLanguage = sharedPreferences.getString(LANG_CODE);
      String mLang ="";
      if(mLanguage == 'ar'){
        mLang = "2";
      }else{
        mLang = "1";
      }
      String loginData = sharedPreferences.getString(kUserModel);
      final body = json.decode(loginData);
      LoginModel   loginModel = LoginModel.fromJson(body);
      String userId = loginModel.data[0].id.toString();
      map['language_id'] = mLang;
      map['type'] = 'wishlist';
      map['customer_id'] = userId;
      eyeconServices services = eyeconServices();
       productsModel = await services.favoriteProducts(map);
      setState(() {

      });
    }
  }
}
