import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
            child: Text('Notification',
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
        child: ListView.separated(itemBuilder: (context,index){
          return Container(
            width: width,
            height: 70.h,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Image.asset('assets/images/push_image.png'),
                flex: 1,),
                SizedBox(height: 70.h,width: 5.w,),
                Expanded(flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex:1,
                            child: Text('EYECON',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold,

                                  fontSize: screenUtil.setSp(14)
                              ),),),
                        Expanded(flex:1,
                          child: Text('20-02-27 14:45:12',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,

                                fontSize: screenUtil.setSp(10)
                            ),),),
                        Expanded(flex:1,
                          child: Text('عروض حصرية',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.normal,

                                fontSize: screenUtil.setSp(10)
                            ),),)

                      ],
                    ))
              ],
            ),

          );

        }, separatorBuilder: (context,index){
          return Container(
            width: width,
            height: 10.h,
          );
        }, itemCount: 10),
      ),
    );
  }
}
