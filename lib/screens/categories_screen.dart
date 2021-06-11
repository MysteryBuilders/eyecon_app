import 'package:cached_network_image/cached_network_image.dart';
import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/model/categories_model.dart';
import 'package:eyecon_app/screens/products_screen.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:eyecon_app/widgets/action_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CategoriesScreen extends StatefulWidget {
  static String id = 'CategoriesScreen';
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  Future<CategoriesModel> categories() async{


    eyeconServices services = eyeconServices();
    CategoriesModel categoriesModel = await services.categories();
    return categoriesModel;
  }
  CategoriesModel categoriesModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories().then((value) {
      setState(() {
        categoriesModel = value;
      });
    });
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
              child: Image.asset('assets/images/header_icon.png',width:112.w ,
                height: 36.h,),
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

            NamedIcon(

              iconData: Icons.notifications,


              notificationCount:  2,),
            SizedBox(width: 5.w,),




          ],

        ),
      body: 
      Container(
        margin: EdgeInsets.all(10.h),
        child: categoriesModel == null?
        Container(
          child: CircularProgressIndicator(


          ),
          alignment: AlignmentDirectional.center,
        )  :
        ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,



          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),

          children: [
            Container(
              padding:  EdgeInsets.all(6.0.w),
              alignment: AlignmentDirectional.center,
              child: Text('Categories',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w500,

                    fontSize: screenUtil.setSp(16)
                ),),
            ),
            Center(
              child: Container(
                height: 2.h,
                width: 36.w,
                color: Color(0xFFEFA18B),

              ),
            ),
            Container(
              height: 20.h,

            ),
            Container(
              width: width,
              height: 125.h,
              decoration: BoxDecoration(
                color: Color(0xFFE4937C),
                borderRadius: BorderRadius.all(Radius.circular(5.w))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(categoriesModel.categoryBanner[0].bannersTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF063B36),
                        fontWeight: FontWeight.w500,

                        fontSize: screenUtil.setSp(17)
                    ),),
                  CachedNetworkImage(
                    width: 125.w,
                    height: 90.h,


                    fit: BoxFit.fill,
                    imageUrl:'${TAG_IMAGE_URL}${categoriesModel.categoryBanner[0].path}',
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

                  )
                ],
              ),
            ),
            Container(height: 10.h,),
            ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,



                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
              return  GestureDetector(
                onTap: (){
                  Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                    return new ProductsScreen(getCategories:categoriesModel.getCategories[index]);
                  }));
                },
                child: Container(
                  width: width,
                  height: 125.h,
                  decoration: BoxDecoration(
                      color: Color(0xFF063B36),
                      borderRadius: BorderRadius.all(Radius.circular(5.w))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(categoriesModel.getCategories[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFFE4937C),
                            fontWeight: FontWeight.w500,

                            fontSize: screenUtil.setSp(17)
                        ),),
                      CachedNetworkImage(
                        width: 125.w,
                        height: 90.h,


                        fit: BoxFit.fill,
                        imageUrl:'${TAG_IMAGE_URL}${categoriesModel.getCategories[index].categoryImagePath}',
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

                      )
                    ],
                  ),
                ),
              );
            }, separatorBuilder: (context,index){
              return Container(
                height: 10.h,
                width: width,

              );
            }, itemCount: categoriesModel.getCategories.length)
            
          ],
        ),
      ),
    );
  }
}
