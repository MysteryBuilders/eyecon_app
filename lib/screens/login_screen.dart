import 'package:eyecon_app/providers/model_hud.dart';
import 'package:eyecon_app/screens/forget_password_screen.dart';
import 'package:eyecon_app/screens/register_screen.dart';
import 'package:eyecon_app/widgets/name_textfield.dart';
import 'package:eyecon_app/widgets/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  String _fullName ="";
  String _password="";
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
                Expanded(flex:4,child: Container(
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
                        child: Text('Welcome to EYECON',
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
                        child: Text('Please enter your registered email and password.',
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
                        child: NameTextField(hint:"Email Address",onClick: (value){
                          _fullName= value;

                        },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal : 20.w,vertical: 10.h),
                        child:
                        PasswordTextField(hint:"Password",onClick: (value){
                          _password= value;

                        },
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Container(margin: EdgeInsets.symmetric(horizontal: 20.w),
                          child: LoginButton('Login',context)),
                      SizedBox(height: 6.h,),
                      Container(margin: EdgeInsets.symmetric(horizontal: 20.w),
                          child: ContinueButton('Continue as Guest ',context)),
                      SizedBox(height: 6.h,),
                      Container(
                        padding:  EdgeInsets.symmetric(horizontal: 20.h),
                        child: Text('or via social networks',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: screenUtil.setSp(13),
                                fontWeight: FontWeight.normal
                            )
                        ),
                      ),
                      SizedBox(height: 6.h,),
                      Container(         padding:  EdgeInsets.symmetric(horizontal: 20.h),
                          child: FaceBookButton('Facebook',context)),
                      SizedBox(height: 6.h,),
                      Container(         padding:  EdgeInsets.symmetric(horizontal: 20.h),
                          child: googleButton('Google',context)),
                      SizedBox(height: 6.h,),
                      Container(         padding:  EdgeInsets.symmetric(horizontal: 20.h),
                          child: appleButton('Apple',context)),
                      SizedBox(height: 10.h,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context,RegisterScreen.id);
                              },
                              child: Text('Register',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF063B36),
                                      fontSize: screenUtil.setSp(15),
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context,ForgetPasswordScreen.id);
                              },
                              child: Text('Forget Password',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF063B36),
                                      fontSize: screenUtil.setSp(15),
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            )
                          ],
                        ),
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
  TextButton LoginButton(String text,BuildContext context){
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

      },
      child: Text(text,style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: screenUtil.setSp(15),
          fontWeight: FontWeight.w600
      ),),
    );
  }
  TextButton ContinueButton(String text,BuildContext context){
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFFEFA18B),
      minimumSize: Size(100.w, 40.h),
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0.w)),
      ),
      backgroundColor: Color(0xFFEFA18B),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {

      },
      child: Text(text,style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: screenUtil.setSp(15),
          fontWeight: FontWeight.w600
      ),),
    );
  }
  TextButton FaceBookButton(String text,BuildContext context){
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFF063B36),
      minimumSize: Size(100.w, 40.h),
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0.w)),
      ),
      backgroundColor: Color(0xFF2C4C8E),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal :10.0.w),
            child: Container(
            height:15.h ,
            width: 15.w,

            child: Image.asset('assets/images/facebook.png')),
          ),

          Text(text,style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: screenUtil.setSp(18),
              fontWeight: FontWeight.w600
          ),),
        ],
      ),
    );
  }
  TextButton googleButton(String text,BuildContext context){
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFF063B36),
      minimumSize: Size(100.w, 40.h),
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0.w)),
      ),
      backgroundColor: Color(0xFF2A5BFE),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal :10.w),
            child: Container(
                height:15.h ,
                width: 15.w,

                child: Image.asset('assets/images/google.png')),
          ),

          Text(text,style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: screenUtil.setSp(18),
              fontWeight: FontWeight.w600
          ),),
        ],
      ),
    );
  }
  TextButton appleButton(String text,BuildContext context){
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFF063B36),
      minimumSize: Size(100.w, 40.h),
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0.w)),
      ),
      backgroundColor: Color(0xFF000000),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal :10.w),
            child: Container(
                height:15.h ,
                width: 15.w,

                child: Image.asset('assets/images/apple.png')),
          ),

          Text(text,style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: screenUtil.setSp(18),
              fontWeight: FontWeight.w600
          ),),
        ],
      ),
    );
  }
} 
