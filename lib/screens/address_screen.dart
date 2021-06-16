import 'dart:convert';


import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/model/address_model.dart' as AddModel;
import 'package:eyecon_app/model/login_model.dart';
import 'package:eyecon_app/screens/add_address_screen.dart';
import 'package:eyecon_app/screens/edit_address_screen.dart';
import 'package:eyecon_app/screens/preview_cart_screen.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AddressScreen extends StatefulWidget {
  bool isMyProfile;
   AddressScreen({Key key,@required this.isMyProfile}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  int selectedAddress =0;
  AddModel.AddressModel addressModel;
  List<bool> addresses = List();
  bool isAddressSelected(){
    bool selected = false;
    if(addresses.isNotEmpty) {
      for (int i = 0; i < addresses.length; i++) {
        bool isAddressSelected = addresses[i];
        if (isAddressSelected) {
          selected = true;
          selectedAddress = i;
          break;
        }
      }
    }
    return selected;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    address().then((value){
      setState(() {

        addressModel= value;
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
            child:
            Text('My Addresses',
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
          Container(
            child: widget.isMyProfile?
                Container():
            Container(
         child: isAddressSelected()?
         Center(
             child:
             GestureDetector(
               onTap: (){
                 Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: (BuildContext context){
                   return new PreviewCartScreen(addressModel:addressModel.data[selectedAddress]);
                 }));
               },
               child: Padding(
                 padding:  EdgeInsets.all(8.0),
                 child: Text('Continue',
                   textAlign: TextAlign.start,
                   style: TextStyle(
                       color: Color(0xFF000000),
                       fontWeight: FontWeight.bold,

                       fontSize: screenUtil.setSp(17)
                   ),),
               ),
             ),
         ): Container()

            ),
          )






        ],

      ),
      body: Container(
        margin: EdgeInsets.all(10.w),
        child: addressModel == null ?
        Container(
          child: CircularProgressIndicator(


          ),
          alignment: AlignmentDirectional.center,
        )
        : Container(

          child: Stack(
            children: [
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
                      height: 350.h,
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFFFFFFF),
                        elevation: 2.w,
                        shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(10),


                    ),
                        child: Container(
                          child: Container(
                            margin: EdgeInsets.all(10.w),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:2,
                                          child:
                                          Text('Name:',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFFE4937C),
                                                fontWeight: FontWeight.w500,

                                                fontSize: screenUtil.setSp(17)
                                            ),),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(addressModel.data[index].name,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.normal,

                                                fontSize: screenUtil.setSp(14)
                                            ),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:2,
                                          child: Text('Mobile :',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFFE4937C),
                                                fontWeight: FontWeight.w500,

                                                fontSize: screenUtil.setSp(17)
                                            ),),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(addressModel.data[index].mobile.toString(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.normal,

                                                fontSize: screenUtil.setSp(14)
                                            ),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:2,
                                          child: Text('Country:',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFFE4937C),
                                                fontWeight: FontWeight.w500,

                                                fontSize: screenUtil.setSp(17)
                                            ),),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(addressModel.data[index].countryName,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.normal,

                                                fontSize: screenUtil.setSp(14)
                                            ),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:2,
                                          child: Text('City:',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFFE4937C),
                                                fontWeight: FontWeight.w500,

                                                fontSize: screenUtil.setSp(17)
                                            ),),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(addressModel.data[index].city,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.normal,

                                                fontSize: screenUtil.setSp(14)
                                            ),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:2,
                                          child: Text('Block :',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFFE4937C),
                                                fontWeight: FontWeight.w500,

                                                fontSize: screenUtil.setSp(17)
                                            ),),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(addressModel.data[index].block,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.normal,

                                                fontSize: screenUtil.setSp(14)
                                            ),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:2,
                                          child: Text('Street :',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFFE4937C),
                                                fontWeight: FontWeight.w500,

                                                fontSize: screenUtil.setSp(17)
                                            ),),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(addressModel.data[index].street,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.normal,

                                                fontSize: screenUtil.setSp(14)
                                            ),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:2,
                                          child: Text('House No :',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFFE4937C),
                                                fontWeight: FontWeight.w500,

                                                fontSize: screenUtil.setSp(17)
                                            ),),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(addressModel.data[index].houseno.toString(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.normal,

                                                fontSize: screenUtil.setSp(14)
                                            ),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:2,
                                          child: Text('Floor :',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFFE4937C),
                                                fontWeight: FontWeight.w500,

                                                fontSize: screenUtil.setSp(17)
                                            ),),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(addressModel.data[index].floor.toString(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.normal,

                                                fontSize: screenUtil.setSp(14)
                                            ),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:2,
                                          child: Text('Flat :',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFFE4937C),
                                                fontWeight: FontWeight.w500,

                                                fontSize: screenUtil.setSp(17)
                                            ),),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(addressModel.data[index].flat.toString(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.normal,

                                                fontSize: screenUtil.setSp(14)
                                            ),),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:2,
                                          child: Text('Instructions :',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFFE4937C),
                                                fontWeight: FontWeight.w500,

                                                fontSize: screenUtil.setSp(17)
                                            ),),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(addressModel.data[index].instructions.toString(),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.normal,

                                                fontSize: screenUtil.setSp(14)
                                            ),),
                                        ),
                                      ],
                                    ),
                                    EditAddress('Edit Address',context,addressModel.data[0])
                                  ],
                                ),
                        Positioned.directional( textDirection:  Directionality.of(context),
                          top: 0,
                          end: 0,
                          child:
                          GestureDetector(
                            onTap: (){
                              for(int i =0;i<addresses.length;i++){
                                if(i == index){
                                  addresses[i]= true;
                                }else{
                                  addresses[i]= false;

                                }
                              }
                              setState(() {

                              });

                            },
                            child: Container(

                              child: widget.isMyProfile?
                                  Container()
                              :SizedBox(
                                  height: 20.h,
                                  width: 20.w, // fixed width and height
                                  child:addresses[index]?
                                  Icon(Icons.radio_button_checked_outlined,color: Color(0xFFEFA18B))
                                      :

                                  Icon(Icons.radio_button_off,color: Color(0xFFEFA18B))
                              ),
                            ),
                          )
                        )

                              ],
                            ),
                          ),
                        ),

                      ),
                    );
                  }, separatorBuilder: (context,index){
                    return Container(width: width,
                    height: 10.h,);
                  }, itemCount: addressModel.data.length),
                  Container(
                    width: width,
                    height: 50.h,
                  )
                ],
              ),
              Positioned.directional(textDirection:  Directionality.of(context),
                  bottom: 10.h,
                  child: shopButton('Add Address', context))
            ],
          ),

        ),
      ),
    );
  }
  Future _buttonTapped() async {
    Map results =  await Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
      return new AddAddressScreen();
    }));
    // push(new MaterialPageRoute<dynamic>(
    //   builder: (BuildContext context) {
    //     return new CurrencyScreen();
    //   },
    // ));

    if (results != null && results.containsKey('selection')) {
      addressModel = null;
      setState(() {

      });
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String loginData = sharedPreferences.getString(kUserModel);
      eyeconServices services = eyeconServices();

      final body = json.decode(loginData);
      Map map = Map();

      LoginModel   loginModel = LoginModel.fromJson(body);

      map['customers_id'] = loginModel.data[0].id.toString();
       addressModel = await services.address(map);
      for(int i =0;i<addressModel.data.length;i++){
        addresses.add(false);
      }
      setState(() {

      });
    }
  }
  Future _editTapped(AddModel.Data data) async {
    Map results =  await Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
      return new EditAddressScreen(addressModel: data);
    }));
    // push(new MaterialPageRoute<dynamic>(
    //   builder: (BuildContext context) {
    //     return new CurrencyScreen();
    //   },
    // ));

    if (results != null && results.containsKey('selection')) {
      addressModel = null;
      setState(() {

      });
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String loginData = sharedPreferences.getString(kUserModel);
      eyeconServices services = eyeconServices();

      final body = json.decode(loginData);
      Map map = Map();

      LoginModel   loginModel = LoginModel.fromJson(body);

      map['customers_id'] = loginModel.data[0].id.toString();
      addressModel = await services.address(map);
      for(int i =0;i<addressModel.data.length;i++){
        addresses.add(false);
      }
      setState(() {

      });
    }
  }
  TextButton shopButton(String text,BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFF000000),
      minimumSize: Size(width, 40.h ),

      shape:  RoundedRectangleBorder(

        borderRadius: BorderRadius.all(Radius.circular(5.0.w)),
      ),
      backgroundColor: Color(0xFF063B36),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {
        _buttonTapped();

      },
      child:
      Center(
        child: Text(text,style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: screenUtil.setSp(15),
            fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
  Future<AddModel.AddressModel> address()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String loginData = sharedPreferences.getString(kUserModel);
    eyeconServices services = eyeconServices();

    final body = json.decode(loginData);
    Map map = Map();

    LoginModel   loginModel = LoginModel.fromJson(body);
    String userId = loginModel.data[0].id.toString();
    map['customers_id'] = loginModel.data[0].id.toString();
    AddModel.AddressModel addressModel = await services.address(map);
    for(int i =0;i<addressModel.data.length;i++){
      addresses.add(false);
    }
    return addressModel;
  }
  TextButton EditAddress(String text,BuildContext context,AddModel.Data model){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Color(0xFF000000),
      minimumSize: Size(width, 30.h ),
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      shape:  RoundedRectangleBorder(

        borderRadius: BorderRadius.all(Radius.circular(5.0.w)),
      ),
      backgroundColor: Color(0xFFE4937C),
    );

    return TextButton(
      style: flatButtonStyle,
      onPressed: () {
        _editTapped(model);

      },
      child: Text(text,style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: screenUtil.setSp(14),
          fontWeight: FontWeight.normal
      ),),
    );
  }
}
