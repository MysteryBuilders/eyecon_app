import 'package:cached_network_image/cached_network_image.dart';
import 'package:eyecon_app/model/order_model.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OrderDetailsScreen extends StatefulWidget {
  Data orderModel;
   OrderDetailsScreen({Key key,@required this.orderModel}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  String currency = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrency().then((value) {
      setState(() {
        currency = value;
      });

    });
  }
  Future<String> getCurrency()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String currency = sharedPreferences.getString("currency")??"KWD";
    return currency;
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
            child: Text('Order Details',
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
        child: currency == ""?
            Container()
            :
        ListView(
          scrollDirection: Axis.vertical,


          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            ListView.separated(
                scrollDirection: Axis.vertical,


                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context,index){
              return Container(
                width: width,
                height: 150.h,
                child:  Container(
                  width: width,

                  margin: EdgeInsets.all(10.w),
                  child: Card(
                    elevation: 2,
                    color: Color(0xFFFFFFFF),
                    child: Container(
                      child:
                      Column(
                        children: [
                          Expanded(flex:2,child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.all(10.w),
                                    child: CachedNetworkImage(
                                      width: 50.w,
                                      height: 80.h,


                                      fit: BoxFit.fill,
                                      imageUrl:'${TAG_IMAGE_URL}${widget.orderModel.data[index].image}',
                                      imageBuilder: (context, imageProvider) => Container(
                                          width: width,


                                          decoration: BoxDecoration(



                                            image: DecorationImage(


                                                fit: BoxFit.fill,
                                                image: imageProvider),
                                          )
                                      ),
                                      placeholder: (context, url) =>
                                          Column(
                                            children: [
                                              Expanded(
                                                flex: 9,
                                                child: Container(
                                                  height: height,
                                                  width: width,


                                                  alignment: FractionalOffset.center,
                                                  child: SizedBox(
                                                      height: 50.h,
                                                      width: 50.h,
                                                      child: new CircularProgressIndicator()),
                                                ),
                                              ),
                                            ],
                                          ),


                                      errorWidget: (context, url, error) => Container(
                                          height: height,
                                          width: width,
                                          alignment: FractionalOffset.center,
                                          child: Icon(Icons.image_not_supported)),

                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex:2,
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  child:  Text(widget.orderModel.data[index].productsName.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w500,

                                        fontSize: screenUtil.setSp(12)
                                    ),),
                                ),)
                              ],
                            ),

                          )),
                          Expanded(flex:1,child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text("Quantity : ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w500,

                                        fontSize: screenUtil.setSp(15)
                                    ),),
                                  Text(widget.orderModel.data[index].productsQuantity.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFFE4937C),
                                        fontWeight: FontWeight.w500,

                                        fontSize: screenUtil.setSp(17)
                                    ),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Price : ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w500,

                                        fontSize: screenUtil.setSp(15)
                                    ),),
                                  Text("${widget.orderModel.data[index].finalPrice.toString()}" "${widget.orderModel.currency}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFFE4937C),
                                        fontWeight: FontWeight.w500,

                                        fontSize: screenUtil.setSp(17)
                                    ),),
                                ],
                              ),

                            ],
                          ))

                        ],

                      ),
                    ),
                  ),
                ),
              );
            }, separatorBuilder: (context,index){

              return Container(
                height: 10.h,
                width: width,
              );
            }, itemCount: widget.orderModel.data.length),
            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              width: width,
              height: 150.h,
              child: Card(
                elevation: 2,
                color: Color(0xFFFFFFFF),
                child: 
                Container(
                  margin: EdgeInsets.all(10.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Address : ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFE4937C),
                                fontWeight: FontWeight.w500,

                                fontSize: screenUtil.setSp(12)
                            ),),
                          Text(widget.orderModel.customersStreetAddress,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,

                                fontSize: screenUtil.setSp(12)
                            ),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Price : ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFE4937C),
                                fontWeight: FontWeight.w500,

                                fontSize: screenUtil.setSp(12)
                            ),),
                          Text(widget.orderModel.orderPrice.toString() +" "+widget.orderModel.currency,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,

                                fontSize: screenUtil.setSp(12)
                            ),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Tax : ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFE4937C),
                                fontWeight: FontWeight.w500,

                                fontSize: screenUtil.setSp(12)
                            ),),
                          Text(widget.orderModel.totalTax.toString() +" "+widget.orderModel.currency,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,

                                fontSize: screenUtil.setSp(12)
                            ),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Shipping Cost : ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFFE4937C),
                                fontWeight: FontWeight.w500,

                                fontSize: screenUtil.setSp(12)
                            ),),
                          Text(widget.orderModel.shippingCost.toString() +" "+widget.orderModel.currency,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,

                                fontSize: screenUtil.setSp(12)
                            ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )

      ),

    );
  }
}
