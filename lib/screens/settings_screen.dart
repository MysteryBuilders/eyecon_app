import 'package:eyecon_app/screens/aboutus_screen.dart';
import 'package:eyecon_app/screens/currency_screen.dart';
import 'package:eyecon_app/screens/faq_screen.dart';
import 'package:eyecon_app/screens/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  String currencyCode = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrencyCode().then((value) {
      setState(() {
        currencyCode = value;
      });
    });
  }
  Future<String> getCurrencyCode()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String currencyCode = sharedPreferences.getString("currency")??"KW";
    return currencyCode;
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
            child: Text('Settings',
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
      body: ListView(
        children: [
          ListTile(
            trailing:SizedBox(
      height: 20.h,
          width: 20.w, // fixed width and height
          child: Icon(Icons.arrow_forward_ios_outlined,size: 20.w,color: Color(0xFF8B8B8B),)
      ),
            onTap: (){
              Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                return new LanguageScreen();
              }));
            },
            leading: SizedBox(
                height: 20.h,
                width: 20.w, // fixed width and height
                child: Image.asset('assets/images/language.png')
            ),

            title: Text('Language',
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
            trailing:Text(currencyCode,
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: screenUtil.setSp(12),
                  fontWeight: FontWeight.normal
              ),),
            onTap: (){
              _buttonTapped();
            },
            leading: SizedBox(
                height: 20.h,
                width: 20.w, // fixed width and height
                child: Image.asset('assets/images/currency.png')
            ),

            title: Text('Currency',
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
              Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                return new AboutUsScreen(pageName:"About Us",pageId: "1");
              }));
            },
            leading: SizedBox(
                height: 20.h,
                width: 20.w, // fixed width and height
                child: Image.asset('assets/images/about_us.png')
            ),

            title: Text('About Us',
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
              Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                return new AboutUsScreen(pageName:"Privacy Policy",pageId: "2");
              }));
            },
            leading: SizedBox(
                height: 20.h,
                width: 20.w, // fixed width and height
                child: Image.asset('assets/images/privacy.png')
            ),

            title: Text('Privacy Policy',
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
              Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                return new AboutUsScreen(pageName:"Terms & Conditions",pageId: "3");
              }));
            },
            leading: SizedBox(
                height: 20.h,
                width: 20.w, // fixed width and height
                child: Image.asset('assets/images/terms.png')
            ),

            title: Text('Terms & Conditions',
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
              Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                return new AboutUsScreen(pageName:"Return & Exchange Policy",pageId: "4");
              }));
            },
            leading: SizedBox(
                height: 20.h,
                width: 20.w, // fixed width and height
                child: Image.asset('assets/images/exchange.png')
            ),

            title: Text('Return & Exchange Policy',
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
              Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                return new AboutUsScreen(pageName:"Delivery Terms",pageId: "5");
              }));

            },
            leading: SizedBox(
                height: 20.h,
                width: 20.w, // fixed width and height
                child: Image.asset('assets/images/delivery.png')
            ),

            title: Text('Delivery Terms',
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
              Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                return new FaqScreen();
              }));
            },
            leading: SizedBox(
                height: 20.h,
                width: 20.w, // fixed width and height
                child: Image.asset('assets/images/faq.png')
            ),

            title: Text('FAQ',
              style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: screenUtil.setSp(12),
                  fontWeight: FontWeight.normal
              ),),
          ),
          Container(height: 1,
            width: width,
            color: Color(0x44707070),
          )
        ],


      ),
    );
  }
  Future _buttonTapped() async {
    Map results =  await Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
      return new CurrencyScreen();
    }));
    // push(new MaterialPageRoute<dynamic>(
    //   builder: (BuildContext context) {
    //     return new CurrencyScreen();
    //   },
    // ));

    if (results != null && results.containsKey('selection')) {
      setState(() {
        currencyCode = results['selection'];
      });
    }
  }
}
