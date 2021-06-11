import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class NotificationIcon extends StatelessWidget {
  final IconData iconData;


  final int notificationCount;


  const NotificationIcon({
    Key key,



    @required this.iconData,
    this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return InkWell(

      child: Container(
        width: 50.w,


        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset( 'assets/images/notification.png',height:20.h,width:20.w,),

              ],
            ),
            Positioned.directional(
              textDirection: Directionality.of(context),
              top: 0,
              end: 0,


              child: Opacity(
                opacity: (notificationCount >0) ? 1.0 : 0.0,
                child: Container(
                  height: 12.h,
                  width: 12.h,


                  decoration: BoxDecoration(shape: BoxShape.circle, color:Color(0xFFF37D5B)),
                  alignment: Alignment.center,
                  child: Text('$notificationCount',style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: ScreenUtil().setSp(6)
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}