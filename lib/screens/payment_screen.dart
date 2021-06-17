import 'package:eyecon_app/model/cart_model.dart';
import 'package:eyecon_app/providers/model_hud.dart';
import 'package:eyecon_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:eyecon_app/model/address_model.dart'as Address;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
class PaymentScreen extends StatefulWidget {
  List<CartModel> cartList;
  Address.Data addressModel;
  double totalPaidAmount;
  String currency;
  String url;
  PaymentScreen({Key key,@required this.cartList,@required this.addressModel
    ,@required this.totalPaidAmount ,@required this.currency,@required this.url}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  bool isLoading=true;
  final _key = UniqueKey();
  InAppWebViewController webView;
  @override
  Widget build(BuildContext context) {
    final modelHud = Provider.of<ModelHud>(context,listen: false);
    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
      title: Container(
      alignment: AlignmentDirectional.center,
      child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.h),
      child: Text(
      'Payment',
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
        body:  InAppWebView(

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
            if (url.toString().contains('merchantTxnId')) {
              Navigator.pushNamedAndRemoveUntil(context, MainScreen.id, (route) => false);


            }
          },
        ),
      ),
    );
  }
}
