import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key key}) : super(key: key);

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  CurrencyModel currencyModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currency().then((value) {
      setState(() {
        currencyModel = value;
      });
    });

  }
  Future<CurrencyModel> currency() async{


    eyeconServices services = eyeconServices();
    CurrencyModel home = await services.currency();
    return home;
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
            child: Text('Currency',
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
        child: currencyModel == null?
        Container(
          child: CircularProgressIndicator(


          ),
          alignment: AlignmentDirectional.center,
        ):
       ListView.separated(itemBuilder: (context,index){
         return ListTile(
           onTap: (){
             saveCurrency(currencyModel.data[index].title).then((value){
               Navigator.of(context).pop({'selection':value});
             });
           },
           trailing:SizedBox(
               height: 20.h,
               width: 20.w, // fixed width and height
               child: Icon(Icons.arrow_forward_ios_outlined,size: 20.w,color: Color(0xFF8B8B8B),)
           ),
           title: Text(currencyModel.data[index].title,
             style: TextStyle(
                 color: Color(0xFF000000),
                 fontSize: screenUtil.setSp(12),
                 fontWeight: FontWeight.normal
             ),),
         );
       }, separatorBuilder: (context,index){
         return Container(
           width: width,
           height: 1,
           color: Color(0x44707070),


         );
       }, itemCount: currencyModel.data.length)

      ),
    );
  }
  Future<String> saveCurrency(String curreny)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('currency', curreny);
    return curreny;
  }
}
