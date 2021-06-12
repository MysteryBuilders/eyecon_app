import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/model/register_model.dart';
import 'package:eyecon_app/providers/model_hud.dart';
import 'package:eyecon_app/screens/login_screen.dart';
import 'package:eyecon_app/widgets/name_textfield.dart';
import 'package:eyecon_app/widgets/password_textfield.dart';
import 'package:eyecon_app/widgets/phone_textfield.dart';
import 'package:eyecon_app/widgets/user_name_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:unique_identifier/unique_identifier.dart';
class RegisterScreen extends StatefulWidget {
  static String id = 'RegisterScreen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  String name;
  String email;
  String password;
  String confirmPassword;
  String phoneNumber;
  String uniqueId = "Unknown";
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return
      ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Scaffold(
          key: _scaffoldKey,
        backgroundColor: Color(0xFF063B36),
        body:
        Form(
          key: _globalKey,
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(




                      child:  Center(
                        child: Container(
                            height:54.h ,
                            width: 189.w,

                            child: Image.asset('assets/images/icon_login.png')),
                      )
                  ),
                ),
                Expanded(flex:4,
                    child: Container(
                      margin: EdgeInsets.all(20.h),

                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        border: Border.all(
                            color: Color(0xFFEFA18B),
                            width: 3.w
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      ),
                      child: ListView(
                        children: [
                          SizedBox(height: 50.h,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20.h),
                            child: Text('Registration',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: screenUtil.setSp(18),
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20.h),
                            child: Text('Please enter your details below',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: screenUtil.setSp(12),
                                    fontWeight: FontWeight.normal
                                )
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal : 20.w,vertical: 10.h),
                            child: UserNameTextField(hint:"Name",onClick: (value){
                              name= value;

                            },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal : 20.w,vertical: 10.h),
                            child: NameTextField(hint:"Email",onClick: (value){
                              email= value;

                            },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal : 20.w,vertical: 10.h),
                            child: PasswordTextField(hint:"Enter Password",onClick: (value){
                              password= value;

                            },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal : 20.w,vertical: 10.h),
                            child: PasswordTextField(hint:"Repeat Password ",onClick: (value){
                              confirmPassword= value;

                            },
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal : 20.w,vertical: 10.h),
                            child: PhoneTextField(hint:"Enter Mobile Number ",onClick: (value){
                              phoneNumber= value;

                            },
                            ),
                          ),
                          Container(
                            child: Text('By Signing Up, You Terms & Conditions of EYECON',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: screenUtil.setSp(9),
                                    fontWeight: FontWeight.normal
                                )
                            ),
                          ),

                          Container(  margin: EdgeInsets.symmetric(horizontal : 20.w,vertical: 10.h),
                              child: RegisterButton('Register', context)),
                          SizedBox(height: 6.h,
                          width: screenUtil.screenWidth,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account? ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: screenUtil.setSp(10),
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context,LoginScreen.id);
                                }
                                ,
                                child: Text('LOGIN ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF063B36),
                                        fontSize: screenUtil.setSp(10),
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ),
                            ],
                          )


                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
    ),
      );
  }
  TextButton RegisterButton(String text,BuildContext context){
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFF063B36),
      minimumSize: Size(100.w, 40.h),
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0.w)),
      ),
      backgroundColor: Color(0xFF063B36),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {
        validate(context);

      },
      child: Text(text,style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: screenUtil.setSp(15),
          fontWeight: FontWeight.w600
      ),),
    );
  }

  void validate(BuildContext context) async {
    if(_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      if (confirmPassword == password) {
        final modelHud = Provider.of<ModelHud>(context, listen: false);
        modelHud.changeIsLoading(true);
        String deviceType = "";
        if(Platform.isAndroid){
          deviceType = "android";
          uniqueId = await UniqueIdentifier.serial;
        }else{
          deviceType = "ios";
          final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
          var data = await deviceInfoPlugin.iosInfo;
          uniqueId = data.identifierForVendor;
        }
        Map map = Map();
        map['customers_full_name'] = name;
        map['email'] = email;
        map['password'] = password;
        map['retype_password'] = confirmPassword;
        map['customers_telephone'] = phoneNumber;
        map['device_id'] = uniqueId;
        map['device_type'] = deviceType;
        eyeconServices services = eyeconServices();

        RegisterModel registerModel = await services.register(map);
        String success = registerModel.success;
        modelHud.changeIsLoading(false);
        if(success == "1"){
          _scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text(registerModel.message)));
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        }else{
          _scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text(registerModel.message)));
        }

      }else{
        _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text('password are not equal')));

      }
    }
  }
}
