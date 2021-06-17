import 'dart:convert';

import 'package:eyecon_app/model/address_model.dart'as Address;
import 'package:eyecon_app/model/coupon_model.dart';
import 'package:eyecon_app/model/place_order_model.dart';
import 'package:eyecon_app/model/tax_model.dart';
import 'package:eyecon_app/screens/payment_screen.dart';
import 'package:eyecon_app/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/localization/localization_methods.dart';
import 'package:eyecon_app/model/cart_model.dart';
import 'package:eyecon_app/model/delete_cart_model.dart';
import 'package:eyecon_app/model/login_model.dart';
import 'package:eyecon_app/model/update_cart_model.dart';
import 'package:eyecon_app/providers/model_hud.dart';
import 'package:eyecon_app/screens/address_screen.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PreviewCartScreen extends StatefulWidget {
  Address.Data addressModel;
   PreviewCartScreen({Key key,@required this.addressModel}) : super(key: key);

  @override
  _PreviewCartScreenState createState() => _PreviewCartScreenState();
}

class _PreviewCartScreenState extends State<PreviewCartScreen> {
  LoginModel loginModel;
  List<CartModel> cartModel = null;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScreenUtil screenUtil = ScreenUtil();
  String currency;
  double delivery= 20.0;
  double tax = 0.0;
  int coupounApplied =0;
  final TextEditingController _commentController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cart().then((value) {
      setState(() {
        cartModel= value;
      });
    });
  }
  String mLang ="";
  String userId ="";
  TaxModel taxModel;
  double discountAmout = 0.0;
  Future<List<CartModel>> cart() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String loginData = sharedPreferences.getString(kUserModel);
    currency = sharedPreferences.getString("currency")??"KWD";
    final body = json.decode(loginData);
    LoginModel loginModel = LoginModel.fromJson(body);
    userId = loginModel.data[0].id.toString();
    String mLanguage = sharedPreferences.getString(LANG_CODE);

    if(mLanguage == 'ar'){
      mLang = "2";
    }else{
      mLang = "1";
    }
    eyeconServices services = eyeconServices();
    Map map2 = Map();
    map2['language_id'] = mLang;
    map2['customer_id'] = userId;
    map2['currency_code'] = currency;
    map2['tax_zone_id'] = widget.addressModel.zoneId;
     taxModel = await services.tax(map2);
     tax =double.parse(taxModel.data.tax) ;
     print(taxModel.data.tax);

    Map map = Map();
    map['language_id'] = mLang;
    map['customer_id'] = userId;

    List<CartModel> cartModel = await services.cart(map);
    return cartModel;


  }
  double width;
  @override
  Widget build(BuildContext context) {
     width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFFFFFFFF),
            title: Container(
              alignment: AlignmentDirectional.center,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.h),
                child: Text(
                  'Cart',
                  style: TextStyle(
                      color: Color(0xFFEFA18B),
                      fontSize: screenUtil.setSp(16),
                      fontWeight: FontWeight.bold

                  ),


                ),
              ),
            ),
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);

              },
              child: Icon(Icons.arrow_back_ios_outlined,color:  Color(0xFFEFA18B),size: 20.h,),
            ),

            actions: [


            ],

          ),
          body: Container(
            margin: EdgeInsets.all(10.w),
            child: cartModel == null?
            Container(
              child: CircularProgressIndicator(


              ),
              alignment: AlignmentDirectional.center,
            )
                :
            Stack(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,



                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),

                  children: [
                    ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,



                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),

                        itemBuilder: (context,index){
                      return Container(width: width,
                        height: 200.h,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Color(0xFFFFFFFF),
                          elevation: 2.w,
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(10),


                          ),
                          child: Container(
                            child:  Column(
                              children: [
                                Expanded(flex: 3,
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Expanded(flex:2,child:  Container(
                                            margin: EdgeInsets.all(10.w),
                                            child: CachedNetworkImage(
                                              width: 50.w,
                                              height: 80.h,


                                              fit: BoxFit.fill,
                                              imageUrl:'${TAG_IMAGE_URL}${cartModel[index].productsImage}',
                                              imageBuilder: (context, imageProvider) => Container(
                                                  width: width,


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
                                                          height: height,
                                                          width: width,


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
                                                  height: height,
                                                  width: width,
                                                  alignment: FractionalOffset.center,
                                                  child: Icon(Icons.image_not_supported)),

                                            ),
                                          ),),
                                          Expanded(flex:4,child: Container(
                                            child: Column(
                                              children: [
                                                Expanded(flex:1,child: Container(
                                                  child:  Text(cartModel[index].productsName,style: TextStyle(
                                                      color: Color(0xFF000000),
                                                      fontSize: screenUtil.setSp(12),
                                                      fontWeight: FontWeight.w600
                                                  ),),


                                                )),
                                                Expanded(flex:2,child: ListView.builder(itemBuilder: (context,i){
                                                  return Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                    children: [
                                                      Text(cartModel[index].attiibutes[i].optionsName+" : ",style: TextStyle(
                                                          color: Color(0xFF000000),
                                                          fontSize: screenUtil.setSp(14),
                                                          fontWeight: FontWeight.w600
                                                      ),),
                                                      Text(cartModel[index].attiibutes[i].optionsValuesName,style: TextStyle(
                                                          color: Color(0xFF000000),
                                                          fontSize: screenUtil.setSp(14),
                                                          fontWeight: FontWeight.w600
                                                      ),),
                                                    ],
                                                  );
                                                },itemCount:cartModel[index].attiibutes.length ,))
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                    )),
                                Expanded(flex: 1,
                                    child: Container(

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Quantity : ',style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontSize: screenUtil.setSp(13),
                                                  fontWeight: FontWeight.normal
                                              ),),

                                              Text(cartModel[index].quantity.toString(),style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontSize: screenUtil.setSp(13),
                                                  fontWeight: FontWeight.normal
                                              ),),

                                            ],
                                          ),

                                          Text('Price : ${cartModel[index].finalPrice}${currency}',
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w500,
                                                fontSize: screenUtil.setSp(15)

                                            ),)
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),

                        ),
                      );
                    }, separatorBuilder: (context,index){
                      return Container(
                        height: 10.h,
                        width: width,

                      );
                    }, itemCount: cartModel.length),
                    Container(width: width,
                    height: 20.h,),
                    Container(width: width,
                    height: 1,
                    color: Color(0xFF000000),),
                    Container(width: width,
                      height: 20.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Delivery address',style: TextStyle(
                            color: Color(0xFF5E5E5E),
                            fontSize: screenUtil.setSp(15),
                            fontWeight: FontWeight.w600
                        ),),
                        Text('Name: ${widget.addressModel.name}',style: TextStyle(
                            color: Color(0xFF5E5E5E),
                            fontSize: screenUtil.setSp(15),
                            fontWeight: FontWeight.w600
                        ),),
                        Text('Mobile: ${widget.addressModel.mobile}',style: TextStyle(
                            color: Color(0xFF5E5E5E),
                            fontSize: screenUtil.setSp(15),
                            fontWeight: FontWeight.w600
                        ),),
                        Text(' ${widget.addressModel.countryName} , '
                            '${widget.addressModel.city}, '
                            '${widget.addressModel.area} ,'
                            'Block : ${widget.addressModel.block}  ,'
                            'Avenue : ${widget.addressModel.avenue},'
                            'Street : ${widget.addressModel.street} ,'
                            'House No : ${widget.addressModel.houseno},'
                            'Floor :${widget.addressModel.floor}, '
                            'Flat : ${widget.addressModel.flat} ',style: TextStyle(
                            color: Color(0xFF5E5E5E),
                            fontSize: screenUtil.setSp(15),
                            fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                    Container(width: width,
                      height: 20.h,),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFFFFFFF),
                      elevation: 2.w,
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(10),


                      ),
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        color: Color(0xFFFFFFFF),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Delivery:',style: TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: screenUtil.setSp(11),
                                    fontWeight: FontWeight.w600
                                ),),
                                Text('${delivery}${currency}',style: TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: screenUtil.setSp(11),
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Tax:',style: TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: screenUtil.setSp(11),
                                    fontWeight: FontWeight.w600
                                ),),
                                Text('${tax}${currency}',style: TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: screenUtil.setSp(11),
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('SubTatal:',style: TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: screenUtil.setSp(11),
                                    fontWeight: FontWeight.w600
                                ),),
                                Text('${cartModel[0].subTotal}${currency}',style: TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: screenUtil.setSp(11),
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total:',style: TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: screenUtil.setSp(11),
                                    fontWeight: FontWeight.w600
                                ),),
                                Text('${double.parse(cartModel[0].subTotal) +tax+ delivery-discountAmout}${currency}',style: TextStyle(
                                    color: Color(0xFF5E5E5E),
                                    fontSize: screenUtil.setSp(11),
                                    fontWeight: FontWeight.w600
                                ),),
                              ],
                            ),
                            _bulidSearchComposer(),






                          ],

                        ),

                      ),
                    ),
                    Container(
                      width: width,
                      height: 100.h,
                    )
                  ],
                ),

                Positioned.directional(textDirection:  Directionality.of(context),
                    bottom: 10.h,
                    child: shopButton('Continue', context))
              ],
            ) ,

          ),

        ),
      );
  }
  String totalAmount(){
   return  "${double.parse(cartModel[0].subTotal) +tax+ delivery-discountAmout}${currency}";

  }
  _bulidSearchComposer(){
    double width = MediaQuery.of(context).size.width;
    return
      Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: 100.w ,


              padding: EdgeInsets.symmetric(horizontal: 8.0),
              height: 40.0,

              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color(0x88000000)
                  //                   <--- border width here
                ),

                  borderRadius: BorderRadius.circular(6.h),
                  color: Color(0xFFFFFFF)
              ),
              child: TextField(

                keyboardType: TextInputType.text,
                minLines: 1,
                maxLines: 1,
                enableInteractiveSelection: true,
                controller: _commentController,

                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,


                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration.collapsed(hintText: 'Enter discount code',hintStyle: TextStyle(
                    color: Color(0xFF8B8B8B)
                )
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w,),
          Expanded(flex:1,child: applyButton('Apply', context))
        ],
      );
  }
  TextButton applyButton(String text,BuildContext context){

    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFF000000),
      minimumSize: Size(50, 20 ),

      shape:  RoundedRectangleBorder(

        borderRadius: BorderRadius.all(Radius.circular(15.0.w)),
      ),
      backgroundColor: Color(0xFFEFA18B),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {
        String code = _commentController.text;
        if(code.trim().isNotEmpty){
          sendCode(context, code);

        }else{
          _scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text("please Enter Discount Code")));
        }
        // Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
        //   return new AddressScreen(isMyProfile: false,);
        // }));

      },
      child:
      Center(
        child: Text(text,style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: screenUtil.setSp(12),
            fontWeight: FontWeight.normal
        ),),
      ),
    );
  }
  double coupounAmount = 0.0;
  Future<void> sendCode(BuildContext context,String code) async{
    final modelHud = Provider.of<ModelHud>(context, listen: false);
    modelHud.changeIsLoading(true);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String loginData = sharedPreferences.getString(kUserModel);
    currency = sharedPreferences.getString("currency")??"KWD";
    final body = json.decode(loginData);
    LoginModel loginModel = LoginModel.fromJson(body);
    userId = loginModel.data[0].id.toString();
    String mLanguage = sharedPreferences.getString(LANG_CODE);

    if(mLanguage == 'ar'){
      mLang = "2";
    }else{
      mLang = "1";
    }

    Map map = Map();
    map['language_id'] = mLang;
    map['customer_id'] = userId;
    map['currency_code'] = currency;
    map['code'] = code;
    eyeconServices services = eyeconServices();
    CouponModel couponModel = await services.applyCoupoun(map);
    String discount = couponModel.discountedAmount;
    modelHud.changeIsLoading(false);
discountAmout = double.parse(discount);
    coupounApplied = 1;

setState(() {

});

  }
  TextButton shopButton(String text,BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFF000000),
      minimumSize: Size(width, 40.h ),

      shape:  RoundedRectangleBorder(

        borderRadius: BorderRadius.all(Radius.circular(5.0.w)),
      ),
      backgroundColor: Color(0xFF063B36),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {
        Payment(context);
        // Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
        //   return new AddressScreen(isMyProfile: false,);
        // }));

      },
      child:
      Center(
        child: Text(text,style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: screenUtil.setSp(15),
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }

  void updateCart(Map map) async {
    final modelHud = Provider.of<ModelHud>(context, listen: false);
    modelHud.changeIsLoading(true);

    eyeconServices services = eyeconServices();
    UpdateCartModel updateCartModel = await services.updateCart(map);
    String status = updateCartModel.success;
    modelHud.changeIsLoading(false);
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(updateCartModel.message)));
    if(status == "1"){
      cartModel = null;
      setState(() {

      });
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String loginData = sharedPreferences.getString(kUserModel);
      currency = sharedPreferences.getString("currency")??"KWD";
      final body = json.decode(loginData);
      LoginModel loginModel = LoginModel.fromJson(body);
      userId = loginModel.data[0].id.toString();
      String mLanguage = sharedPreferences.getString(LANG_CODE);

      if(mLanguage == 'ar'){
        mLang = "2";
      }else{
        mLang = "1";
      }
      Map map = Map();
      map['language_id'] = mLang;
      map['customer_id'] = userId;
      eyeconServices services = eyeconServices();
      cartModel = await services.cart(map);

      setState(() {

      });
    }else{

    }

  }

  void deleteCart(Map map) async {
    final modelHud = Provider.of<ModelHud>(context, listen: false);
    modelHud.changeIsLoading(true);

    eyeconServices services = eyeconServices();
    DeleteCartModel deleteCartModel = await services.deleteCart(map);
    String status = deleteCartModel.success;
    modelHud.changeIsLoading(false);
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(deleteCartModel.message)));
    if (status == "1") {
      cartModel = null;
      setState(() {

      });
      SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();
      String loginData = sharedPreferences.getString(kUserModel);
      currency = sharedPreferences.getString("currency") ?? "KWD";
      final body = json.decode(loginData);
      LoginModel loginModel = LoginModel.fromJson(body);
      userId = loginModel.data[0].id.toString();
      String mLanguage = sharedPreferences.getString(LANG_CODE);

      if (mLanguage == 'ar') {
        mLang = "2";
      } else {
        mLang = "1";
      }
      Map map = Map();
      map['language_id'] = mLang;
      map['customer_id'] = userId;
      eyeconServices services = eyeconServices();
      cartModel = await services.cart(map);

      setState(() {

      });
    }
  }

  void Payment(BuildContext context) async{
    final modelHud = Provider.of<ModelHud>(context, listen: false);
    modelHud.changeIsLoading(true);
    SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    String loginData = sharedPreferences.getString(kUserModel);
    currency = sharedPreferences.getString("currency") ?? "KWD";
    final body = json.decode(loginData);
    LoginModel loginModel = LoginModel.fromJson(body);
    userId = loginModel.data[0].id.toString();
    String mLanguage = sharedPreferences.getString(LANG_CODE);

    if (mLanguage == 'ar') {
      mLang = "2";
    } else {
      mLang = "1";
    }
    eyeconServices services = eyeconServices();
    Map map = Map();
    map['language_id']  = mLang;
    map['customer_id']  = userId;
    map['cartid']  = cartModel[0].cartId;
    map['address_id']  = widget.addressModel.addressId;
    map['totalPrice']  = cartModel[0].subTotal;
    map['currency_code']  = currency;
    map['shipping_method']  = 'dhl';
    map['shipping_cost']  = delivery;
    map['total_tax']  = tax;
    map['paymentType']  = 'card';
    map['is_coupon_applied']  = coupounApplied;
    map['coupon_amount']  = discountAmout;
    map['coupons_code']  = _commentController.text;
    map['comments']  = "test";
    PlaceOrderModel placeOrderModel = await services.placeOrder(map);
    String success = placeOrderModel.success;
    modelHud.changeIsLoading(false);
    if(success == "1"){
      double totalAmount = double.parse(cartModel[0].subTotal) +tax+ delivery-discountAmout;
      String paymentUrl = placeOrderModel.data.paymentURL;
      print(paymentUrl);
      Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
        return new PaymentScreen(
          cartList: cartModel, addressModel: widget.addressModel,
          totalPaidAmount: totalAmount, currency: currency,url: paymentUrl,);
      }));
    }



  }

}

