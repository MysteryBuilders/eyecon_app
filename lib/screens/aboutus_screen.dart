import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/model/page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
class AboutUsScreen extends StatefulWidget {
  String pageName;
  String pageId;
   AboutUsScreen({Key key,@required this.pageName,@required this.pageId}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  Future<PageModel> page() async{


    eyeconServices services = eyeconServices();
    PageModel home = await services.page(widget.pageId);
    return home;
  }
  PageModel pageModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page().then((value) {
      setState(() {
        pageModel = value;
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
            child: Text(widget.pageName,
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
        child:  pageModel== null?
        Container(
          child: CircularProgressIndicator(


          ),
          alignment: AlignmentDirectional.center,
        )
        :ListView(
          padding: EdgeInsets.zero,
          children: [
            HtmlWidget(


              pageModel.pagesData[0].description,
              textStyle: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                  fontSize: screenUtil.setSp(
                      12)

              ),
            ),
          ],
        ),
      ),
    );
  }
}
