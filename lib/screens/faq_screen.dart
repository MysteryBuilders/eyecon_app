
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';

import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/model/faq_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
class FaqScreen extends StatefulWidget {
  const FaqScreen({Key key}) : super(key: key);

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  FaqModel faqModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    faq().then((value) {
      setState(() {
        faqModel = value;
      });
    });
  }
  Future<FaqModel> faq() async{


    eyeconServices services = eyeconServices();
    FaqModel home = await services.faq();
    return home;
  }
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
     width = MediaQuery.of(context).size.width;
     height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar:   AppBar(
        centerTitle: true,
        title:Container(
          width: screenUtil.screenWidth,
          child: Center(
            child:
            Text('FAQ',
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
        margin: EdgeInsets.all(20.w),
        child: faqModel == null ?Container(
          child: CircularProgressIndicator(


          ),
          alignment: AlignmentDirectional.center,
        ):ListView.separated(itemBuilder: (context,index){
          return
            ConfigurableExpansionTile(


              header: _header(faqModel.data[index].question),
              children: [
                _buildItems(faqModel.data[index].answer)
                // + more params, see example !!
              ],
            );
        }, separatorBuilder: (context,index){
          return Container(
            width: width,
            height: 10.h,
            color: Color(0xFFFFFFFF),
          );
        }, itemCount: faqModel.data.length)
      ),
    );
  }
 Widget _header(String s) {
    return Container(
      width: width-40.w,

      height: 50.h,

      color:Color(0xFFF5F5F5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(s,

              style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,

                  fontSize: screenUtil.setSp(12)
              ),),
          ),
          Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xFF000000),size: 20.h,)
        ],

      ),
    );

  }

  Widget _buildItems(String answer) {
    return Container(
      width: width,
      height: 100.h,


      color:Color(0xFFFFFFFF),
      child: Container(
        padding: EdgeInsets.all(10.w),
        child: HtmlWidget(


          answer,
          textStyle: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w500,
              fontSize: screenUtil.setSp(
                  12)

          ),
        ),
      ),
    );
  }
}




