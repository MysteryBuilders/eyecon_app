import 'package:eyecon_app/widgets/name_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ForgetPasswordScreen extends StatefulWidget {

  static String id = 'ForgetPasswordScreen';
  const ForgetPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Container(
          alignment: AlignmentDirectional.center,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.h),
            child: Text(
              'Forget Password',
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

      ),body: Container(
      margin: EdgeInsets.all(20.w),
      child: Column(
        children: [
          NameTextField(hint:"Email Address",onClick: (value){
            email= value;

          },
          ),
          SizedBox(height: 30.h,width: screenUtil.screenWidth,),

          forgetPassword('Forget Password',context)

        ],
      )
      ,
    ),
    );
  }
  TextButton forgetPassword(String text,BuildContext context){
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFFEFA18B),
      minimumSize: Size(screenUtil.screenWidth, 40.h),
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
}
