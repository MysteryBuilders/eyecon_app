import 'dart:convert';

import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/model/address_model.dart';
import 'package:eyecon_app/model/login_model.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AddressScreen extends StatefulWidget {
  const AddressScreen({Key key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  AddressModel addressModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    address().then((value){
      setState(() {
        addressModel= value;
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
            child: Text('My Addresses',
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
        margin: EdgeInsets.all(10.w),
        child: addressModel == null ?
        Container(
          child: CircularProgressIndicator(


          ),
          alignment: AlignmentDirectional.center,
        )
        : Container(

          child: Stack(
            children: [
              ListView(
                scrollDirection: Axis.vertical,


                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  ListView.separated(
                      scrollDirection: Axis.vertical,


                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context,index){
                    return Container(
                      width: width,
                      height: 200.h,
                      child: Card(
                        color: Color(0xFFFFFFFF),
                        elevation: 2.w,
                        shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(10),


                    ),

                      ),
                    );
                  }, separatorBuilder: (context,index){
                    return Container(width: width,
                    height: 10.h,);
                  }, itemCount: addressModel.data.length)
                ],
              ),
              Positioned.directional(textDirection:  Directionality.of(context),
                  bottom: 10.h,
                  child: shopButton('Add Address', context))
            ],
          ),

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
  Future<AddressModel> address()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String loginData = sharedPreferences.getString(kUserModel);
    eyeconServices services = eyeconServices();

    final body = json.decode(loginData);
    Map map = Map();

    LoginModel   loginModel = LoginModel.fromJson(body);
    String userId = loginModel.data[0].id.toString();
    map['customers_id'] = "2";
    AddressModel addressModel = await services.address(map);
    return addressModel;
  }
}
