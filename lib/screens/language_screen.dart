import 'package:eyecon_app/localization/localization_methods.dart';
import 'package:eyecon_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_screen.dart';
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}


class _LanguageScreenState extends State<LanguageScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  Future<String> getLanguage() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String mLanguage = sharedPreferences.getString(LANG_CODE);
    return mLanguage;
  }
  String mLanguage ="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLanguage().then((value){
      setState(() {
        mLanguage = value;
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
            child: Text('Language',
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
      body: mLanguage == null?
      Container(
        child: CircularProgressIndicator(


        ),
        alignment: AlignmentDirectional.center,
      ):
      Container(
        child: Column(
          children: [
            ListTile(
              trailing:SizedBox(
                  height: 20.h,
                  width: 20.w, // fixed width and height
                  child: Icon(Icons.arrow_forward_ios_outlined,size: 20.w,color: Color(0xFF8B8B8B),)
              ),
              onTap: (){
                _changeLanguage('en').then((value) {
                  Navigator.of(context).pushReplacementNamed( MainScreen.id);
                });
              },
              leading: SizedBox(
                  height: 20.h,
                  width: 20.w, // fixed width and height
                  child:mLanguage == "en"?
                  Icon(Icons.radio_button_checked,color: Color(0xFFEFA18B)):
                  Icon(Icons.radio_button_off,color: Color(0xFFEFA18B))

              ),

              title: Text('English',
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: screenUtil.setSp(12),
                    fontWeight: FontWeight.normal
                ),),
            ),
            Container(height: 1,
              width: width,
              color: Color(0x44707070),
            ),
            ListTile(
              trailing:SizedBox(
                  height: 20.h,
                  width: 20.w, // fixed width and height
                  child: Icon(Icons.arrow_forward_ios_outlined,size: 20.w,color: Color(0xFF8B8B8B),)
              ),
              onTap: (){
                _changeLanguage('ar').then((value) {
                  Navigator.of(context).pushReplacementNamed( MainScreen.id);
                });
              },
              leading: SizedBox(
                  height: 20.h,
                  width: 20.w, // fixed width and height
                  child:mLanguage == "ar"?
                  Icon(Icons.radio_button_checked,color: Color(0xFFEFA18B)):
                  Icon(Icons.radio_button_off,color: Color(0xFFEFA18B))
              ),

              title: Text('Arabic',
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: screenUtil.setSp(12),
                    fontWeight: FontWeight.normal
                ),),
            ),
            Container(height: 1,
              width: width,
              color: Color(0x44707070),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _changeLanguage(String language) async {
    Locale _temp = await setLocale( language);
    MyApp.setLocale(context, _temp);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("selectLanguage", true);




  }
}
