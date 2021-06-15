import 'package:eyecon_app/providers/model_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class WebViewScreen extends StatefulWidget {
  String url;
  String title;
   WebViewScreen({Key key,@required this.url,@required this.title}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  bool isLoading=true;
  final _key = UniqueKey();
  InAppWebViewController webView;
  @override
  Widget build(BuildContext context) {
    final modelHud = Provider.of<ModelHud>(context,listen: false);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
        appBar:   AppBar(
          centerTitle: true,
          title:Container(
            width: screenUtil.screenWidth,
            child: Center(
              child: Text(widget.title,
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
        child:    Stack(
          children: <Widget>[
            InAppWebView(

              initialUrlRequest:
              URLRequest(url: Uri.parse(widget.url)),


              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(


                  preferredContentMode: UserPreferredContentMode.MOBILE,

                ),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },


              onLoadStart: (InAppWebViewController controller, Uri url) {
                modelHud.changeIsLoading(true);
              },
              onLoadStop: (InAppWebViewController controller, Uri url) async {
                modelHud.changeIsLoading(false);
                print(url);

              },
            ),

          ],
        ) ,
      ),


    );
  }
}
