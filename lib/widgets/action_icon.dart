import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class NamedIcon extends StatelessWidget {
  final IconData iconData;


  final int notificationCount;


  const NamedIcon({
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
                Image.asset( 'assets/images/cart.png',height:30,width:30,color:Color(0xFFEFA18B),),

              ],
            ),
            Positioned.directional(
              textDirection: Directionality.of(context),
              bottom: 0,
              end: 0,


              child: Opacity(
                opacity: (notificationCount >0) ? 1.0 : 0.0,
                child: Container(
                  height: 20.h,
                  width: 20.h,


                  decoration: BoxDecoration(shape: BoxShape.circle, color:Color(0xFF063B36)),
                  alignment: Alignment.center,
                  child: Text('$notificationCount',style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: ScreenUtil().setSp(8)
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