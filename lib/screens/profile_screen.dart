import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    );
  }
}