import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key key}) : super(key: key);

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  ScreenUtil screenUtil = ScreenUtil();
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
        child: ListView(
          padding: EdgeInsets.zero,
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
                    Expanded(child: Image.asset('assets/images/profile.png',height: 70.h,width: 70.h,),flex: 1,),
                    Expanded(flex:3,child: Column(

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
          ],
        ),

      ),
    );
  }
}
