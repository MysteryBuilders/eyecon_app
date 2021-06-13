import 'dart:convert';

import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/localization/localization_methods.dart';
import 'package:eyecon_app/model/login_model.dart';
import 'package:eyecon_app/model/order_model.dart';
import 'package:eyecon_app/screens/order_details.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  OrderModel orderModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orders().then((value) {
      setState(() {
        orderModel = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar:   AppBar(
        centerTitle: true,
        title:Container(
          width: screenUtil.screenWidth,
          child: Center(
            child: Text('My Orders',
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
      body: Container(
        margin

        :EdgeInsets.all(10.h),
        child: orderModel == null?
        Container(
          child: CircularProgressIndicator(


          ),
          alignment: AlignmentDirectional.center,
        )
            :ListView.separated(itemBuilder: (context,index){
          return Container(
            width: width,
            height: 150.h,
            child: Card(
              elevation: 2,
              color: Color(0xFFFFFFFF),
              child: Container(
                margin: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    Expanded(child: Row(

                      children: [

                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text('Order Number',

                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w500,

                                  fontSize: screenUtil.setSp(15)
                              ),),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            child: Text(orderModel.data[index].ordersId.toString(),
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                  color: Color(0xFFEFA18B),
                                  fontWeight: FontWeight.w500,

                                  fontSize: screenUtil.setSp(15)
                              ),),
                          ),
                        ),
                      ],
                    ),flex: 1,),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text('Order Status',

                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w500,

                                  fontSize: screenUtil.setSp(15)
                              ),),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            child:orderModel.data[index].ordersStatus == "Completed"?
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5.w,horizontal: 10.w),
                              decoration: BoxDecoration(

                                  color: Color(0xFF45A158),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Text(orderModel.data[index].ordersStatus.toString(),

                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w500,

                                    fontSize: screenUtil.setSp(12)
                                ),),
                            ):
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5.w,horizontal: 10.w),
                              decoration: BoxDecoration(

                                  color: Color(0xFFB1B1B1),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Text(orderModel.data[index].ordersStatus.toString(),

                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w500,

                                    fontSize: screenUtil.setSp(12)
                                ),),

                            )

                          ),
                        ),

                      ],
                    ),flex: 1,),
                    Expanded(flex:1,child:
                    Container(margin: EdgeInsets.symmetric(vertical: 5.w),
                        child: shopButton('View Order', context,index)))
                  ],

                ),
              ),
            ),
          );
        }, separatorBuilder: (context,index){
          return Container(
            width: width,
            height: 10.h,
          );
        }, itemCount: orderModel.data.length),
      ),
    );
  }
  TextButton shopButton(String text,BuildContext context,int index){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFF000000),
      minimumSize: Size(width, 20.h ),

      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      shape:  RoundedRectangleBorder(

        borderRadius: BorderRadius.all(Radius.circular(5.0.w)),
      ),
      backgroundColor: Color(0xFF063B36),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {
        Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
          return new OrderDetailsScreen(orderModel:orderModel.data[index]);
        }));


      },
      child: Text(text,style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: screenUtil.setSp(15),
          fontWeight: FontWeight.normal
      ),),
    );
  }
  Future<OrderModel> orders() async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String loginData = sharedPreferences.getString(kUserModel);
    final body = json.decode(loginData);
    LoginModel   loginModel = LoginModel.fromJson(body);
    eyeconServices services = eyeconServices();
    Map<String,String> map = Map();
    String mLanguage = sharedPreferences.getString(LANG_CODE);
    String currency = sharedPreferences.getString("currency")??"KWD";
    String mLang ="";
    if(mLanguage == 'ar'){
      mLang = "2";
    }else{
      mLang = "1";
    }
    String mUserId = loginModel.data[0].id.toString();
    map['Userid'] = "2";
    map['langId'] = mLang;
    map['currency_code'] = currency;
    OrderModel orderModel = await services.orders(map);
    return orderModel;
  }
}
