import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/model/home_model.dart';
import 'package:eyecon_app/screens/cart_screen.dart';
import 'package:eyecon_app/screens/categories_screen.dart';
import 'package:eyecon_app/screens/login_screen.dart';
import 'package:eyecon_app/screens/my_account.dart';
import 'package:eyecon_app/screens/notification_screen.dart';
import 'package:eyecon_app/screens/product_details_screen.dart';
import 'package:eyecon_app/screens/settings_screen.dart';
import 'package:eyecon_app/screens/webview_screen.dart';
import 'package:eyecon_app/screens/wishlist-screen.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:eyecon_app/widgets/action_icon.dart';
import 'package:eyecon_app/widgets/notification_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MainScreen extends StatefulWidget {
  static String id = 'MainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  Future<HomeModel> home() async{


    eyeconServices services = eyeconServices();
    HomeModel home = await services.home();
    return home;
  }
  HomeModel homeModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    home().then((value) {
      setState(() {
        homeModel = value;
      });
    });

  }
  int _current =0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:   AppBar(
        centerTitle: true,
        title:Container(
          width: screenUtil.screenWidth,
          child: Center(
            child: Image.asset('assets/images/header_icon.png',width:112.w ,
            height: 36.h,),
          ),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        leading: Builder(
          builder: (BuildContext context) {
            return
              IconButton(
                icon: const Icon(Icons.menu,color: Color(0xFFEFA18B),size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations
                    .of(context)
                    .openAppDrawerTooltip,
              );
          },
        ),

        actions: [

        GestureDetector(
          onTap: (){
            Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
              return new CartScreen();
            }));
          },
          child: NamedIcon(

          iconData: Icons.notifications,


          notificationCount:  2,),
        ),
          SizedBox(width: 5.w,),




        ],

      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFFEFA18B),
          child: ListView(
            children: [
              Container(height: 50.h,),

              Container(child: Image.asset('assets/images/icon_drawer.png',width:150,
              height:50 ,)),
              Container(height: 20.h,),
              ListTile(
                onTap: (){
                  Navigator.pop(context);

                },
                leading: SizedBox(
                    height: 20.h,
                    width: 20.w, // fixed width and height
                    child: Image.asset('assets/images/home.png')
                ),

                title: Text('Home',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: screenUtil.setSp(20),
                      fontWeight: FontWeight.normal
                  ),),
              ),
              ListTile(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                    return new NotificationScreen();
                  }));
                },
                leading: SizedBox(
                  height: 20.h,
                  width: 20.w, //
                    child:  NotificationIcon(

                      iconData: Icons.notifications,


                      notificationCount:  2,),
                ),

                title: Text('Notification',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: screenUtil.setSp(20),
                      fontWeight: FontWeight.normal
                  ),),
              ),
              ListTile(
                onTap: (){
                  Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                    return new CategoriesScreen();
                  }));
                },
                leading: SizedBox(
                    height: 20.h,
                    width: 20.w, // fixed width and height
                    child: Image.asset('assets/images/shop.png')
                ),

                title: Text('Shop',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: screenUtil.setSp(20),
                      fontWeight: FontWeight.normal
                  ),),
              ),
              ListTile(
                onTap: (){
                  isLoggedIn();

                },
                leading: SizedBox(
                    height: 20.h,
                    width: 20.w, // fixed width and height
                    child: Image.asset('assets/images/wishlist.png')
                ),

                title: Text('Whishlist',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: screenUtil.setSp(20),
                      fontWeight: FontWeight.normal
                  ),),
              ),
              ListTile(
                onTap: (){
                  myAccount();

                },
                leading: SizedBox(
                    height: 20.h,
                    width: 20.w, // fixed width and height
                    child: Image.asset('assets/images/myaccount.png')
                ),

                title: Text('My Account',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: screenUtil.setSp(20),
                      fontWeight: FontWeight.normal
                  ),),
              ),
              ListTile(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                    return new SettingsScreen();
                  }));
                },
                leading: SizedBox(
                    height: 20.h,
                    width: 20.w, // fixed width and height
                    child: Image.asset('assets/images/settings.png')
                ),

                title: Text('Settings',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: screenUtil.setSp(20),
                      fontWeight: FontWeight.normal
                  ),),
              ),


            ],
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFFFFFFF),
        child: homeModel == null ?
        Container(
          child: CircularProgressIndicator(


          ),
          alignment: AlignmentDirectional.center,
        ): Container(
          color: Color(0xFFFFFFFF),
          child: ListView(
            children: [
              GestureDetector(
                onTap: (){
                  String url = homeModel.result.homeTopBanner[0].bannersUrl;
                  if(url != '#'||url.trim().isNotEmpty){
                    Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                      return new WebViewScreen(url:homeModel.result.homeTopBanner[0].bannersUrl.toString(),
                      title:homeModel.result.homeTopBanner[0].bannersTitle.toString() ,);
                    }));
                  }else{
                    Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                      return new ProductDetailsScreen(productId:homeModel.result.homeTopBanner[0].id.toString());
                    }));
                  }
                },
                child: Container(
                  width: width,

                  child:
                  CachedNetworkImage(
                    width: width,
                    height: 180.h,

                    fit: BoxFit.fill,
                    imageUrl:'${TAG_IMAGE_URL}${homeModel.result.homeTopBanner[0].path}',
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
              Container(margin: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                children: [
                  Text('NEW IN',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.normal,
                    fontSize: screenUtil.setSp(14)
                  ),),
                  Text('Beauty Starts here, world best brand',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.normal,
                          fontSize: screenUtil.setSp(14)
                      ))
                ],
              ),),
              Container(
                height: 200.h,

                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                  return
                    GestureDetector(
                      onTap: (){


                        Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                          return new ProductDetailsScreen(productId:homeModel.result.newInProduct[index].id.toString());
                        }));

                      },
                      child: Container(
                      margin: EdgeInsetsDirectional.only(start: 10.w),
                      width: 160.w,
                      child: Column(
                        children: [
                          Expanded(child:    CachedNetworkImage(
                            width: width,


                            fit: BoxFit.fill,
                            imageUrl:'${TAG_IMAGE_URL}${homeModel.result.newInProduct[index].imagePath}',
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
                          flex: 3,),
                          Expanded(flex:1,child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                Expanded(flex:2,child: Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(

                                      homeModel.result.newInProduct[index].productsName,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: screenUtil.setSp(8),
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                )),
                                Expanded(flex:1,child: Text(

                                  homeModel.result.newInProduct[index].productsPrice+" KWD",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                                      color: Color(0xFFEFA18B),
                                      fontSize: screenUtil.setSp(7),
                                      fontWeight: FontWeight.w600
                                  ),
                                )),
                                Expanded(flex:1,child: Text(

                                  homeModel.result.newInProduct[index].productsPrice+" KWD",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(

                                      color: Color(0xFF000000),
                                      fontSize: screenUtil.setSp(10),
                                      fontWeight: FontWeight.bold
                                  ),
                                ))
                              ],
                            ),

                          ))
                        ],
                      ),

                  ),
                    );
                }, separatorBuilder: (context,index){
                  return Container(width: 15.h,
                    color: Color(0xFFFFFFFF),);
                }, itemCount: homeModel.result.newInProduct.length),
              ),
              Container(margin: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h,
              ),
                child: shopButton('Shop Now', context),
              ),
              GestureDetector(
                onTap: (){
                  String url = homeModel.result.homeMiddleBanner[0].bannersUrl;
                  if(url != "#"||url.trim().isNotEmpty){
                    Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                      return new WebViewScreen(url:homeModel.result.homeTopBanner[0].bannersUrl.toString(),
                        title:homeModel.result.homeMiddleBanner[0].bannersTitle.toString() ,);
                    }));
                  }else{
                    Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                      return new ProductDetailsScreen(productId:homeModel.result.homeMiddleBanner[0].id.toString());
                    }));
                  }
                },
                child: Container(
                  width: width,

                  child:
                  CachedNetworkImage(
                    width: width,
                    height: 180.h,

                    fit: BoxFit.fill,
                    imageUrl:'${TAG_IMAGE_URL}${homeModel.result.homeMiddleBanner[0].path}',
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
              Container(
                height: 230.h,
                margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  children: [
                    Container(
                      height: 180.h,

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
                        items: homeModel.result.bannerCarousel.map((item) =>
                            Stack(

                              children: [
                                GestureDetector(
                                  onTap: (){
                                    String url = item.bannersUrl;
                                    if(url != '#'||url.trim().isNotEmpty){
                                      Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                                        return new WebViewScreen(url:item.bannersUrl.toString(),
                                          title:item.bannersTitle.toString() ,);
                                      }));
                                    }else{
                                      Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                                        return new ProductDetailsScreen(productId:item.id.toString());
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
                                            imageUrl:'${TAG_IMAGE_URL}${item.path}',
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
                                      Expanded(flex:1,child: Text(item.bannersTitle,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.normal,
                                            fontSize: screenUtil.setSp(14)
                                        ),))
                                    ],
                                  ),
                                ),

                              ] ,
                            )).toList(),

                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: homeModel.result.bannerCarousel.map((item) {
                        int index =homeModel.result.bannerCarousel.indexOf(item);
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
              Container(margin: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  children: [
                    Text('PICKED FOR YOU',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.normal,
                          fontSize: screenUtil.setSp(14)
                      ),),
                    Text('Beauty Starts here, world best brand',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.normal,
                            fontSize: screenUtil.setSp(14)
                        ))
                  ],
                ),),
              Container(
                height: 200.h,

                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                              return new ProductDetailsScreen(productId:homeModel.result.pickedForYou[index].id.toString());
                            }));
                          },
                          child: Container(
                          margin: EdgeInsetsDirectional.only(start: 10.w),
                          width: 160.w,
                          child: Column(
                            children: [
                              Expanded(child:
                              CachedNetworkImage(
                                width: width,


                                fit: BoxFit.fill,
                                imageUrl:'${TAG_IMAGE_URL}${homeModel.result.pickedForYou[index].imagePath}',
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
                                flex: 3,),
                              Expanded(flex:1,child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    Expanded(flex:2,child: Container(
                                      alignment: AlignmentDirectional.centerStart,
                                      child: Text(

                                        homeModel.result.pickedForYou[index].productsName,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: screenUtil.setSp(8),
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    )),
                                    Expanded(flex:1,child: Text(

                                      homeModel.result.pickedForYou[index].productsPrice+" KWD",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          color: Color(0xFFEFA18B),
                                          fontSize: screenUtil.setSp(7),
                                          fontWeight: FontWeight.w600
                                      ),
                                    )),
                                    Expanded(flex:1,child: Text(

                                      homeModel.result.pickedForYou[index].productsPrice+" KWD",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(

                                          color: Color(0xFF000000),
                                          fontSize: screenUtil.setSp(10),
                                          fontWeight: FontWeight.bold
                                      ),
                                    ))
                                  ],
                                ),

                              ))
                            ],
                          ),

                      ),
                        );
                    }, separatorBuilder: (context,index){
                  return Container(width: 15.h,
                    color: Color(0xFFFFFFFF),);
                }, itemCount: homeModel.result.pickedForYou.length),
              ),
              Container(margin: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h,
              ),
                child: shopButton('Shop Now', context),
              ),
            ],
          ),
        ),


      ),
    );
  }
  TextButton shopButton(String text,BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFF000000),
      minimumSize: Size(width, 30.h),
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      shape:  RoundedRectangleBorder(
        side: BorderSide(
            width: 1.0,
            color: Color(0xFF063B36)
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0.w)),
      ),
      backgroundColor: Color(0xFFFFFFFF),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {
        Navigator.pushNamed(context, CategoriesScreen.id);

      },
      child: Text(text,style: TextStyle(
          color: Color(0xFF063B36),
          fontSize: screenUtil.setSp(10),
          fontWeight: FontWeight.bold
      ),),
    );
  }
  void isLoggedIn() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLoggedIn = sharedPreferences.getBool(kIsLogin)??false;
    if(isLoggedIn){
      Navigator.pop(context);

      Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
        return new WishListScreen();
      }));
    }else{
      Navigator.pop(context);

      Navigator.of(context,rootNavigator: true).pushReplacement(new MaterialPageRoute(builder: (BuildContext context){
        return new LoginScreen();
      }));

    }
  }
  void myAccount() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLoggedIn = sharedPreferences.getBool(kIsLogin)??false;
    if(isLoggedIn){
      Navigator.pop(context);

      Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
        return new MyAccountScreen();
      }));
    }else{
      Navigator.pop(context);

      Navigator.of(context,rootNavigator: true).pushReplacement(new MaterialPageRoute(builder: (BuildContext context){
        return new LoginScreen();
      }));

    }
  }
}
