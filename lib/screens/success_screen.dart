import 'package:eyecon_app/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:eyecon_app/model/address_model.dart'as Address;
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SuccessScreen extends StatefulWidget {
  List<CartModel> cartList;
  Address.Data addressModel;
  double totalPaidAmount;
  String currency;

   SuccessScreen({Key key,@required this.cartList,@required this.addressModel
     ,@required this.totalPaidAmount ,@required this.currency}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  @override
  Widget build(BuildContext context) {
  double  width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Container(
          alignment: AlignmentDirectional.center,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.h),
            child: Text(
              'Successful',
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
      body: Container(
        margin: EdgeInsets.all(10.h),
        child: ListView(
          children: [
            Row(
              children: [
        Text(
        'Your order has been placed seccessfully',
          style: TextStyle(
              color: Color(0xFF000000),
              fontSize: screenUtil.setSp(17),
              fontWeight: FontWeight.w500

          ),
        ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
