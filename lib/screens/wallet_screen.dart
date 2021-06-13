import 'dart:convert';

import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/localization/localization_methods.dart';
import 'package:eyecon_app/model/login_model.dart';
import 'package:eyecon_app/model/wallet_model.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
class WalletScreen extends StatefulWidget {
  const WalletScreen({Key key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  WalletModel walletModel;
  String currency ="";
  Future<WalletModel> wallet() async{

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String loginData = sharedPreferences.getString(kUserModel);
    final body = json.decode(loginData);
    LoginModel   loginModel = LoginModel.fromJson(body);
    eyeconServices services = eyeconServices();
    Map<String,String> map = Map();
    String mLanguage = sharedPreferences.getString(LANG_CODE);
     currency = sharedPreferences.getString("currency")??"KWD";
    String mLang ="";
    if(mLanguage == 'ar'){
      mLang = "2";
    }else{
      mLang = "1";
    }
    String mUserId = loginModel.data[0].id.toString();
    map['user_id'] = "4";

    WalletModel walletModel = await services.wallet(map);
    return walletModel;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wallet().then((value) {
      setState(() {
walletModel = value;
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
            child: Text('Wallet',
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
        child: walletModel == null?
        Container(
          child: CircularProgressIndicator(


          ),
          alignment: AlignmentDirectional.center,
        )
        :Column(
          children: [
            SizedBox(height: 20.h,),
            Container(
              alignment: AlignmentDirectional.center,
              height: 100.h,
              width: width,
              color: Color(0xFFFFFFFF),
              child: Column(
                children: [
                  Text(

                   walletModel.walletData.total.toString() +" "+currency,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(29),
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(

                    "Total Available Balance",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(18),
                        fontWeight: FontWeight.normal
                    ),
                  )
                ],
              ),

            )


          ],
        ),
      ),
    );
  }
}

