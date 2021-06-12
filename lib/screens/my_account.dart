import 'dart:convert';

import 'package:eyecon_app/model/login_model.dart';
import 'package:eyecon_app/screens/address_screen.dart';
import 'package:eyecon_app/screens/orders_screen.dart';
import 'package:eyecon_app/screens/points_screen.dart';
import 'package:eyecon_app/screens/profile_screen.dart';
import 'package:eyecon_app/screens/wallet_screen.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key key}) : super(key: key);

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  LoginModel loginModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUser().then((value) {
      loginModel = value;
      setState(() {

      });
    });
  }
  Future<LoginModel> getUser()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String loginData = sharedPreferences.getString(kUserModel);
    final body = json.decode(loginData);
    LoginModel   loginModel = LoginModel.fromJson(body);
    return loginModel;
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
            child: Text('My Account',
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
        color: Color(0xFFF9F9F9),
        child: loginModel == null?
        Container(
          child: CircularProgressIndicator(


          ),
          alignment: AlignmentDirectional.center,
        )
        :ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,



          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          children: [
            Container(
              width: width,
              height:40.h ,
            ),
            Container(
              width: width,
              height: 1,
              color: Color(0x44707070),
            ),
            Container(
              width: width,
              height: 90.h,
              color: Color(0xFFFFFFFF),
              child: Container(
                margin: EdgeInsets.all(10.w),
                child: Row(

                  children: [
                    Expanded(child: Image.asset('assets/images/profile.png',height: 70.h,width: 70.h,fit: BoxFit.fill,),flex: 1,),
                    SizedBox(height: 60.h,
                    width: 10.w,),
                    Expanded(flex:3,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex:1,child: Text(loginModel.data[0].fullName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.bold,

                              fontSize: screenUtil.setSp(11)
                          ),),),
                        Expanded(flex:1,child: Text(loginModel.data[0].fullName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0x888B8B8B),
                              fontWeight: FontWeight.w500,

                              fontSize: screenUtil.setSp(10)
                          ),),),
                        Expanded(flex:1,child: Text("Joined at ${loginModel.data[0].createdAt}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0x888B8B8B),
                              fontWeight: FontWeight.w500,

                              fontSize: screenUtil.setSp(10)
                          ),),),
                      ],

                    ))
                  ],

                ),
              ),
            ),
            Container(
              width: width,
              height: 1,
              color: Color(0x44707070),
            ),
            Container(
              width: width,
              height:40.h ,
            ),

            Wrap(
              children: [
                Container(
                  color: Color(0xFFFFFFFF),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,



                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        width: width,
                        height: 1,
                        color: Color(0x44707070),
                      ),
                      ListTile(
                        trailing:SizedBox(
                            height: 20.h,
                            width: 20.w, // fixed width and height
                            child: Icon(Icons.arrow_forward_ios_outlined,size: 20.w,color: Color(0xFF8B8B8B),)
                        ),
                        onTap: (){
                          Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                            return new ProfileScreen();
                          }));
                        },
                        leading: SizedBox(
                            height: 20.h,
                            width: 20.w, // fixed width and height
                            child: Image.asset('assets/images/profile_icon.png')
                        ),

                        title: Text('Profile',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: screenUtil.setSp(12),
                              fontWeight: FontWeight.w500
                          ),),
                      ),
                      Container(
                        width: width,
                        height: 1,
                        color: Color(0x44707070),
                      ),
                      ListTile(
                        trailing:SizedBox(
                            height: 20.h,
                            width: 20.w, // fixed width and height
                            child: Icon(Icons.arrow_forward_ios_outlined,size: 20.w,color: Color(0xFF8B8B8B),)
                        ),
                        onTap: (){
                          Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                            return new AddressScreen();
                          }));
                        },
                        leading: SizedBox(
                            height: 20.h,
                            width: 20.w, // fixed width and height
                            child: Image.asset('assets/images/address_icon.png')
                        ),

                        title: Text('Address',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: screenUtil.setSp(12),
                              fontWeight: FontWeight.w500
                          ),),
                      ),
                      Container(
                        width: width,
                        height: 1,
                        color: Color(0x44707070),
                      ),
                      ListTile(
                        trailing:SizedBox(
                            height: 20.h,
                            width: 20.w, // fixed width and height
                            child: Icon(Icons.arrow_forward_ios_outlined,size: 20.w,color: Color(0xFF8B8B8B),)
                        ),
                        onTap: (){
                          Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                            return new OrdersScreen();
                          }));
                        },
                        leading: SizedBox(
                            height: 20.h,
                            width: 20.w, // fixed width and height
                            child: Image.asset('assets/images/orders_icon.png')
                        ),

                        title: Text('Orders',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: screenUtil.setSp(12),
                              fontWeight: FontWeight.w500
                          ),),
                      ),
                      Container(
                        width: width,
                        height: 1,
                        color: Color(0x44707070),
                      ),
                      ListTile(
                        trailing:SizedBox(
                            height: 20.h,
                            width: 20.w, // fixed width and height
                            child: Icon(Icons.arrow_forward_ios_outlined,size: 20.w,color: Color(0xFF8B8B8B),)
                        ),
                        onTap: (){
                          Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                            return new WalletScreen();
                          }));

                        },
                        leading: SizedBox(
                            height: 20.h,
                            width: 20.w, // fixed width and height
                            child: Image.asset('assets/images/wallet_icon.png')
                        ),

                        title: Text('Wallet',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: screenUtil.setSp(12),
                              fontWeight: FontWeight.w500
                          ),),
                      ),
                      Container(
                        width: width,
                        height: 1,
                        color: Color(0x44707070),
                      ),
                      ListTile(
                        trailing:SizedBox(
                            height: 20.h,
                            width: 20.w, // fixed width and height
                            child: Icon(Icons.arrow_forward_ios_outlined,size: 20.w,color: Color(0xFF8B8B8B),)
                        ),
                        onTap: (){
                          Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                            return new PointsScreen();
                          }));
                        },
                        leading: SizedBox(
                            height: 20.h,
                            width: 20.w, // fixed width and height
                            child: Image.asset('assets/images/points_icon.png')
                        ),

                        title: Text('EYECON Points',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: screenUtil.setSp(12),
                              fontWeight: FontWeight.w500
                          ),),
                      ),
                      Container(
                        width: width,
                        height: 1,
                        color: Color(0x44707070),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}
