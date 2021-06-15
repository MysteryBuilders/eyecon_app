import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/model/attribute_model.dart';
import 'package:eyecon_app/model/dis_like_model.dart';
import 'package:eyecon_app/model/like_model.dart';
import 'package:eyecon_app/model/login_model.dart';
import 'package:eyecon_app/model/product_details_model.dart';
import 'package:eyecon_app/providers/model_hud.dart';
import 'package:eyecon_app/screens/login_screen.dart';
import 'package:eyecon_app/screens/photo_screen.dart';
import 'package:eyecon_app/screens/vedio_screen.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:eyecon_app/widgets/action_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProductDetailsScreen extends StatefulWidget {
  String productId;

   ProductDetailsScreen({Key key,@required this.productId}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  final CarouselController _controller = CarouselController();
  int _current =0;
  int count = 1;
   int productInStock = 0;
   int minimumOrder =0;
  ProductDetailsModel productDetailsModel;
  Future<ProductDetailsModel> productDetails(String id) async{


    eyeconServices services = eyeconServices();
    ProductDetailsModel productDetailsModel = await services.productDetails(id);
    return productDetailsModel;
  }
  List<Map> selectedItems = List();
  List<Attribute> attribueList = List();
  int isLiked = 0;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productDetails(widget.productId).then((value) {
      productDetailsModel = value;
      isLiked = productDetailsModel.productData[0].productsLiked;
      productInStock =productDetailsModel.productData[0].productsMaxStock ;
      minimumOrder = productDetailsModel.productData[0].productsMinOrder;
      count = minimumOrder;
      List<Attributes> attributes = productDetailsModel.productData[0].attributes;
      for(int i =0;i<attributes.length;i++ ){
        Attribute attribute = Attribute(attributes[i].option, attributes[i].values[0]);
        attribueList.add(attribute);
        String optionId = attributes[i].option.id.toString();
        Map selectedMap = Map();
        selectedMap['optionId'] = optionId;
        selectedMap['valueId']= attributes[i].values[0].id.toString();

       selectedItems.add(selectedMap);



      }
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading,
      child: Scaffold(
        key: _scaffoldKey,
        appBar:   AppBar(
          centerTitle: true,
          title:Container(
            width: screenUtil.screenWidth,
            child: Center(
              child:
              Text('Details',
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
              Navigator.of(context).pop({'selection':true});

            },
            child: Icon(Icons.arrow_back_ios_outlined,color: Color(0xFFE4937C),size: 20.h,),
          ),

          actions: [

            NamedIcon(

              iconData: Icons.notifications,


              notificationCount:  2,),
            SizedBox(width: 5.w,),




          ],

        ),
        body: Container(
          margin: EdgeInsets.all(10.w),
          child: productDetailsModel == null?
          Container(
            child: CircularProgressIndicator(


            ),
            alignment: AlignmentDirectional.center,
          )
          :ListView(
            scrollDirection: Axis.vertical,


            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [

              Container(

                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  children: [
                    Container(
                      height: 250.h,

                      width: width,
                      child:

                      CarouselSlider(

                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 10),



                            height: double.infinity,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            disableCenter: true,
                            pauseAutoPlayOnTouch: true
                            ,




                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }
                        ),
                        items: productDetailsModel.productData[0].images.map((item) =>
                            Stack(

                              children: [
                                GestureDetector(
                                  onTap: (){
                                    String url = item.image.trim();
                                    if(url.isNotEmpty) {
                                      Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                                        return new PhotoScreen(imageProvider: NetworkImage(
                                          TAG_IMAGE_URL+url,
                                        ),);
                                      }));

                                    }

                                  },


                                  child:
                                  Column(
                                    children: [

                                      Expanded(
                                        flex:4,
                                        child: Container(
                                          width: width,

                                          child:
                                          CachedNetworkImage(
                                            width: width,

                                            fit: BoxFit.fill,
                                            imageUrl:'${TAG_IMAGE_URL}${item.image}',
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
                                          // Image.network(
                                          //
                                          //
                                          // '${kBaseUrl}${mAdsPhoto}${item.photo}'  , fit: BoxFit.fitWidth,
                                          //   height: 600.h,),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                              ] ,
                            )).toList(),

                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: productDetailsModel.productData[0].images.map((item) {
                        int index =productDetailsModel.productData[0].images.indexOf(item);
                        return Container(
                          width: 8.0.w,
                          height: 8.0.h,
                          margin: EdgeInsets.symmetric(vertical: 10.0.w, horizontal: 2.0.h),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color(0xFFEFA18B)
                                : Color(0xFF707070),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(productDetailsModel.productData[0].productsName,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,

                      fontSize: screenUtil.setSp(15)
                  ),),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${productDetailsModel.productData[0].productsPrice} KWD',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,

                          fontSize: screenUtil.setSp(15)
                      ),),
                    Row(
                      children: [

                        Opacity(
                          opacity: productDetailsModel.productData[0].productsVideoLink == null?0.0:1.0,
                          child:


                          GestureDetector(
                            onTap: (){
                              Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                                  return new VideoScreen(vedioUrl:productDetailsModel.productData[0].productsVideoLink,auctionName: productDetailsModel.productData[0].productsName);
                              }));
                                   },
                            child: Container(child: Image.asset('assets/images/vedio_icon.png',width: 25.w,height: 25.w,),
                              padding: EdgeInsets.all(5.w),
                            ),
                          )

                        ),

                        GestureDetector(
                          onTap: (){

                            validateProduct();
                          },
                          child: Container(child: isLiked== 1? Image.asset('assets/images/like_icon.png',width: 25.w,height: 25.w,):
                          Image.asset('assets/images/un_like_icon.png',width: 25.w,height: 25.w,),
                            padding: EdgeInsets.all(5.w),),
                        ),


                      ],
                    ),

                  ],
                ),
              ),
              Text('Description',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xFFEFA18B),
                    fontWeight: FontWeight.normal,

                    fontSize: screenUtil.setSp(15)
                ),),
              HtmlWidget(


                productDetailsModel.productData[0].productsDescription,
                textStyle: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontSize: screenUtil.setSp(
                        12)

                ),
              ),
              ListView.separated(
                  scrollDirection: Axis.vertical,


                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productDetailsModel.productData[0].attributes[index].option.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(0xFFEFA18B),
                          fontWeight: FontWeight.w500,

                          fontSize: screenUtil.setSp(17)
                      ),),
                    ListView.separated(
                        scrollDirection: Axis.vertical,


                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder:
                    (context,i){
                      return Container(
                        height: 30.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(productDetailsModel.productData[0].attributes[index].values[i].value,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.normal,

                                  fontSize: screenUtil.setSp(15)
                              ),),
                            GestureDetector(
                              onTap: (){
                                String optionId = productDetailsModel.productData[0].attributes[index].option.id.toString();
                                String valueId =productDetailsModel.productData[0].attributes[index].values[i].id.toString();
                                if(!isValueSelected(productDetailsModel.productData[0].attributes[index].option.id.toString(), productDetailsModel.productData[0].attributes[index].values[i].id.toString())){
                                  for(int j =0;j<attribueList.length;j++){
                                    print("positions -->"+attribueList[i].option.id.toString());
                                    print("selected position -->"+optionId);
                                    if(attribueList[j].option.id.toString()==optionId){
                                      attribueList[j].values=productDetailsModel.productData[0].attributes[index].values[i];
                                    }

                                  }
                                  print(attribueList);
                                  setState(() {

                                  });
                                }

                              },
                              child: Container(child:isValueSelected(productDetailsModel.productData[0].attributes[index].option.id.toString(), productDetailsModel.productData[0].attributes[index].values[i].id.toString())
                              ?    Icon(Icons.radio_button_checked,color: Color(0xFFEFA18B),size: 25.h,)
                                  :
                              Icon(Icons.radio_button_off,color: Color(0xFFEFA18B),size: 25.h,))


                            )
                          ],

                        ),
                      );
                    }

                        , separatorBuilder: (context,i){
                      return Container(width: width,
                        height: 2.h,
                      );

                    }, itemCount: productDetailsModel.productData[0].attributes[index].values.length)
                  ],
                );

              }, separatorBuilder: (context,index){
                return Container(width: width,
                height: 10.h,);

              }, itemCount: productDetailsModel.productData[0].attributes.length),
              Text('Quantity',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xFFEFA18B),
                    fontWeight: FontWeight.w500,

                    fontSize: screenUtil.setSp(15)
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(count>minimumOrder){
                        count--;
                        setState(() {

                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                        child: Image.asset('assets/images/minus.png',height: 30.h,width: 30.h,fit: BoxFit.fill,)),
                  ),

                  Container(
                    padding: EdgeInsets.all(10.w),
                    child: Text('${count}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.normal,

                          fontSize: screenUtil.setSp(22)
                      ),),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(productInStock>count){
                        count++;
                      }

                      setState(() {

                      });
                    },
                    child: Container(  padding: EdgeInsets.all(10.w),
                        child: Image.asset('assets/images/plus.png',height: 30.h,width: 30.h,fit: BoxFit.fill,)),
                  ),

                ],
              ),
              SizedBox(height: 20.h,),
              Container(child: shopButton('ADD TO BAG',context),
              ),
              SizedBox(height: 20.h,),


            ],
          ),
        ),
      ),
    );
  }

  bool isValueSelected(String optionId,String valueId){
    bool isSelected = false;
    for(int i =0;i<attribueList.length;i++){
      String selectedOptionId = attribueList[i].option.id.toString();
      if(selectedOptionId == optionId){
        String selectedValue = attribueList[i].values.id.toString();
        if(selectedValue == valueId){
          isSelected = true;
          break;
        }
      }
    }
    return isSelected;
  }
  TextButton shopButton(String text,BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFF000000),
      minimumSize: Size(width, 40.h ),
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      shape:  RoundedRectangleBorder(

        borderRadius: BorderRadius.all(Radius.circular(5.0.w)),
      ),
      backgroundColor: Color(0xFF063B36),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {
        if(productInStock>0){

        }


      },
      child: Text(text,style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: screenUtil.setSp(12),
          fontWeight: FontWeight.bold
      ),),
    );
  }

  void validateProduct() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLoggedIn = sharedPreferences.getBool(kIsLogin)??false;
    if(isLoggedIn){
      String loginData = sharedPreferences.getString(kUserModel);
      final body = json.decode(loginData);
      LoginModel   loginModel = LoginModel.fromJson(body);
      String userId = loginModel.data[0].id.toString();
      String productId = productDetailsModel.productData[0].productsId.toString();
      if(isLiked == 1){
        final modelHud = Provider.of<ModelHud>(context, listen: false);
        modelHud.changeIsLoading(true);
        eyeconServices services = eyeconServices();
        DisLikeModel disLikeModel = await services.disLikeProduct(productId, userId);
        String status = disLikeModel.success;
        modelHud.changeIsLoading(false);
        if(status == "1"){
          isLiked = 0;
          setState(() {

          });

        }
      }else{
        final modelHud = Provider.of<ModelHud>(context, listen: false);
        modelHud.changeIsLoading(true);

        Map<String, dynamic> map = Map();
        map['liked_products_id'] = productId;
        map['liked_customers_id'] = userId;
        eyeconServices services = eyeconServices();
        LikeModel likeModel = await services.likeProduct(map);
        String status = likeModel.success;
        modelHud.changeIsLoading(false);
        if(status == "1"){
          isLiked = 1;
          setState(() {

          });

        }



      }

    }else{
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    }

  }
}
