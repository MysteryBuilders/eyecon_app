import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/localization/localization_methods.dart';
import 'package:eyecon_app/model/cart_model.dart';
import 'package:eyecon_app/model/delete_cart_model.dart';
import 'package:eyecon_app/model/login_model.dart';
import 'package:eyecon_app/model/update_cart_model.dart';
import 'package:eyecon_app/providers/cart_notifier.dart';
import 'package:eyecon_app/providers/model_hud.dart';
import 'package:eyecon_app/screens/address_screen.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  LoginModel loginModel;
  List<CartModel> cartModel = null;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
ScreenUtil screenUtil = ScreenUtil();
  String currency;
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
    Map map = Map();
    map['language_id'] = mLang;
    map['customer_id'] = userId;
    eyeconServices services = eyeconServices();
    List<CartModel> cartModel = await services.cart(map);
    return cartModel;


  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
            Opacity(
              opacity: cartModel == null?0.0:1,

              child:

              GestureDetector(
                onTap: (){
                  Map map = Map();

                  map['id']= userId;
                  print(userId);
                  deleteCart(map);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.delete,color:  Color(0xFFEFA18B),size: 30.h,),
                ),
              ),
            ),

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
              ListView.separated(itemBuilder: (context,index){
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

                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                          child: GestureDetector(
                                            onTap: (){
                                              int maxCount = cartModel[index].productsMaxStock;
                                              print(maxCount);
                                              int quantity = cartModel[index].quantity;
                                              print(quantity);
                                              quantity++;
                                              if(maxCount>quantity ){
                                                userId = loginModel.data[0].id.toString();
                                                Map map = Map();
                                                map['language_id'] = mLang;
                                                map['customer_id'] = userId;
                                                map['quantity'] =quantity;
                                                map['item_id'] =cartModel[index].id;
                                                updateCart(map);
        print('welcome');


                                             }

                                            },
                                              child: Image.asset('assets/images/plus.png',height: 30.w,width: 30.w,)),
                                        ),

                                        Text(cartModel[index].quantity.toString(),style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: screenUtil.setSp(13),
                                            fontWeight: FontWeight.normal
                                        ),),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                          child: InkWell(
                                              onTap: (){
                                                print('welcome');
                                                int minOrder = cartModel[index].productsMinOrder;
                                                print(minOrder);
                                                int quantity = cartModel[index].quantity;
                                                print(quantity);
                                                quantity--;
                                                print(quantity);
                                                if(quantity>=minOrder ){
                                                  print(quantity);
                                                  userId = loginModel.data[0].id.toString();
                                                  Map<String,dynamic> map = Map();
                                                  map['language_id'] = mLang;
                                                  map['customer_id'] = userId;
                                                  map['quantity'] =quantity;
                                                  map['item_id'] =cartModel[index].id;
                                                  updateCart(map);


                                                }


                                              },
                                              child: Image.asset('assets/images/minus.png',height: 30.w,width: 30.w,)),
                                        ),
                                      ],
                                    ),

                                    Text('${cartModel[index].finalPrice}${currency}',
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

              Positioned.directional(textDirection:  Directionality.of(context),
                  bottom: 10.h,
                  child: shopButton('Choose Address', context))
            ],
          ) ,

        ),

    ),
      );
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
        Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
          return new AddressScreen(isMyProfile: false,);
        }));

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
      Provider.of<CartNumber>(context,listen: false).clearCart();
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

      sharedPreferences.setInt('Count', 0);
      Navigator.pop(context);
    }
  }

}
