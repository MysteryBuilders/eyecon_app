import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/model/change_password_model.dart';
import 'package:eyecon_app/providers/model_hud.dart';
import 'package:eyecon_app/screens/login_screen.dart';
import 'package:eyecon_app/widgets/name_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
class ForgetPasswordScreen extends StatefulWidget {

  static String id = 'ForgetPasswordScreen';
  const ForgetPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  String email;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading,
      child: Scaffold(
        key: _scaffoldKey,
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

        ),
        body: Form(
          key: _globalKey,
          child: Container(
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
        ),
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
        validate(context);

      },
      child: Text(text,style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: screenUtil.setSp(15),
          fontWeight: FontWeight.w600
      ),),
    );
  }

  void validate(BuildContext context) async{
    if(_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      final modelHud = Provider.of<ModelHud>(context, listen: false);
      modelHud.changeIsLoading(true);

      Map map = Map();
      map['email'] = email;


      eyeconServices services = eyeconServices();
      ChangePasswordModel changePasswordModel = await services.forgetPassword(map);
      String status = changePasswordModel.success;
      modelHud.changeIsLoading(false);
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text(changePasswordModel.message)));

      if(status == "1"){
        Navigator.pushReplacementNamed(context, LoginScreen.id);

      }


    }
    }
}
