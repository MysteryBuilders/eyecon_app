
import 'dart:convert';

import 'package:eyecon_app/model/edit_address_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/model/address_model.dart' as AddModel;
import 'package:eyecon_app/model/add_address_model.dart';
import 'package:eyecon_app/model/city_model.dart' as City;
import 'package:eyecon_app/model/country_model.dart' as Model;
import 'package:eyecon_app/model/login_model.dart';
import 'package:eyecon_app/providers/model_hud.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:eyecon_app/widgets/area_textfield.dart';
import 'package:eyecon_app/widgets/instructions_textfield.dart';
import 'package:eyecon_app/widgets/phone_edittext.dart';
import 'package:eyecon_app/widgets/phone_textfield.dart';
import 'package:eyecon_app/widgets/user_name_edit.dart';
import 'package:eyecon_app/widgets/user_name_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EditAddressScreen extends StatefulWidget {
  AddModel.Data addressModel;
   EditAddressScreen({Key key,@required this.addressModel}) : super(key: key);

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  ScreenUtil screenUtil = ScreenUtil();

  String name;
  String phoneNumber;
  Model.CountryModel countryModel;
  String countryId = "";
  City.CityModel cityModel;
  String cityId ="";
  String country ="";
  String city ="";
  String zoneId ="";
  String area="";
  String block ="";
  String avenue ="";
  String address ="";
  String floor ="";
  String flat ="";
  String latitiude ="";
  String longitude ="";
  String instructions ="";
  String houseNo="";
  FocusNode _focusName;
  FocusNode _focusPhone;
  FocusNode _focusArea;
  FocusNode _focusBlock;
  FocusNode _focusAvenue;
  FocusNode _focusAdress;
  FocusNode _focusHouseNo;
  FocusNode _focusFloor;
  FocusNode _focusFlat;
  FocusNode _focusInstruction;

  Future<LoginModel> getUser()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String loginData = sharedPreferences.getString(kUserModel);
    eyeconServices services = eyeconServices();
    countryModel = await services.country();
    final body = json.decode(loginData);
    LoginModel   loginModel = LoginModel.fromJson(body);
    return loginModel;
  }
  LoginModel loginModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser().then((value) {
      setState(() {
        loginModel = value;
        name = widget.addressModel.name.toString();
        phoneNumber = widget.addressModel.mobile.toString();
        countryId = widget.addressModel.countriesId.toString();
        city = widget.addressModel.city.toString();
        zoneId = widget.addressModel.zoneId.toString();
        area = widget.addressModel.area.toString();
        block= widget.addressModel.block.toString();
        avenue = widget.addressModel.avenue.toString();
        address = widget.addressModel.street.toString();
        floor = widget.addressModel.floor.toString();
        flat = widget.addressModel.flat.toString();
        houseNo = widget.addressModel.houseno.toString();
        instructions = widget.addressModel.instructions.toString();

      });
    });

  }
  Future<void> cities(String countryId) async{

    cityModel = null;
    final modelHud = Provider.of<ModelHud>(context, listen: false);
    modelHud.changeIsLoading(true);
    eyeconServices services = eyeconServices();
    Map map = Map();
    map['country_id'] =countryId;
    cityModel = await services.city(map);
    modelHud.changeIsLoading(false);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    _focusName= new FocusNode();
    _focusPhone= new FocusNode();
    _focusArea= new FocusNode();
    _focusBlock= new FocusNode();
    _focusAvenue= new FocusNode();
    _focusAdress= new FocusNode();
    _focusHouseNo= new FocusNode();
    _focusFloor= new FocusNode();
    _focusFlat= new FocusNode();
    _focusInstruction= new FocusNode();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Color(0xFFFFFFFF),
          appBar:   AppBar(
            centerTitle: true,
            title:Container(
              width: screenUtil.screenWidth,
              child: Center(
                child:
                Text('Edit Address',
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
          body:
          Form(
            key: _globalKey,
            child: Container(
              margin: EdgeInsets.all(10.h),
              child: loginModel == null?
              Container(
                child: CircularProgressIndicator(


                ),
                alignment: AlignmentDirectional.center,
              )
                  :
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name*',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(12),
                      ),

                    ),
                    Container(

                      child: UserNameEditText(hint:"",onClick: (value){
                        name= value;

                      },
                        f: _focusName,
                        mText: name,


                      ),
                    ),
                    SizedBox(width: width,
                      height: 10.h,),
                    Text(
                      'Phone Number*',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(12),
                      ),

                    ),
                    Container(

                      child: PhoneEditText(hint:"",onClick: (value){
                        phoneNumber= value;

                      },
                        f: _focusPhone,
                        mText: phoneNumber,
                      ),
                    ),
                    SizedBox(width: width,
                      height: 10.h,),
                    Text(
                      'Country *',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(12),
                      ),

                    ),
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      width: width,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFFF),
                        borderRadius:BorderRadius.all(Radius.circular(4)),
                        border: Border.all(
                          color: Color(0xFFdcdcdc),
                        ),
                      ),
                      child: Container(margin: EdgeInsets.all(10.w),
                        child: DropDown<Model.Data>(





                          items: countryModel.data,

                          hint:  Text(country,
                            textAlign: TextAlign.start,
                            style: TextStyle(

                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,
                                fontSize: screenUtil.setSp(12)
                            ),),
                          onChanged: (Model.Data age){
                            countryId = age.countriesId.toString();
                            country = age.countriesName.toString();

                            cities(countryId);

                          },
                          customWidgets: countryModel.data.map((p) => buildAgeRow(p)).toList(),
                          isExpanded: true,
                          showUnderline: false,
                        ),),
                    ),
                    SizedBox(width: width,
                      height: 10.h,),
                    Text(
                      'City*',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(12),
                      ),

                    ),
                    Container(
                      child: cityModel== null?
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        width: width,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFFF),
                          borderRadius:BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                            color: Color(0xFFdcdcdc),
                          ),
                        ),
                        child:     Text(city,
                          textAlign: TextAlign.start,
                          style: TextStyle(

                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w500,
                              fontSize: screenUtil.setSp(12)
                          ),),
                      )
                          :
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        width: width,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFFF),
                          borderRadius:BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                            color: Color(0xFFdcdcdc),
                          ),
                        ),
                        child: Container(margin: EdgeInsets.all(10.w),
                          child: DropDown<City.Data>(





                            items: cityModel.data,

                            hint:
                            Text(city,
                              textAlign: TextAlign.start,
                              style: TextStyle(

                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: screenUtil.setSp(12)
                              ),),
                            onChanged: (City.Data age){
                              cityId = age.id.toString();
                              city = age.name;
                              latitiude = age.latitude;
                              longitude = age.longitude;
                              zoneId = age.zoneId.toString();

                            },
                            customWidgets: cityModel.data.map((p) => buildCityRow(p)).toList(),
                            isExpanded: true,
                            showUnderline: false,
                          ),),
                      ),
                    ),
                    SizedBox(width: width,
                      height: 10.h,),
                    Text(
                      'Area *',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(12),
                      ),

                    ),
                    Container(

                      child: AreaTextField(hint:"",onClick: (value){
                        area= value;

                      },
                        f: _focusArea,
                        mText: area,

                      ),
                    ),
                    SizedBox(width: width,
                      height: 10.h,),
                    Text(
                      'Block *',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(12),
                      ),

                    ),
                    Container(

                      child: AreaTextField(hint:"",onClick: (value){
                        block= value;

                      },
                        f: _focusBlock,
                        mText: block,
                      ),
                    ),
                    SizedBox(width: width,
                      height: 10.h,),
                    Text(
                      'Avenue *',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(12),
                      ),

                    ),
                    Container(

                      child: AreaTextField(hint:"",onClick: (value){
                        avenue= value;

                      },
                        f: _focusAvenue,
                        mText: avenue,
                      ),
                    ),
                    SizedBox(width: width,
                      height: 10.h,),
                    Text(
                      'Address *',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(12),
                      ),

                    ),
                    Container(

                      child: AreaTextField(hint:"",onClick: (value){
                        address= value;

                      },
                        f: _focusAdress,
                        mText: address,
                      ),
                    ),
                    SizedBox(width: width,
                      height: 10.h,),
                    Text(
                      'House No *',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(12),
                      ),

                    ),
                    Container(

                      child: AreaTextField(hint:"",onClick: (value){
                        houseNo= value;

                      },
                        f: _focusHouseNo,
                      ),
                    ),
                    SizedBox(width: width,
                      height: 10.h,),
                    Text(
                      'Floor *',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(12),
                      ),

                    ),
                    Container(

                      child: AreaTextField(hint:"",onClick: (value){
                        floor= value;

                      },
                        mText: floor,

                      ),
                    ),
                    SizedBox(width: width,
                      height: 10.h,),
                    Text(
                      'Flat *',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(12),
                      ),

                    ),
                    Container(

                      child: AreaTextField(hint:"",onClick: (value){
                        flat= value;

                      },
                        f: _focusFlat,
                        mText: flat,
                      ),
                    ),
                    SizedBox(width: width,
                      height: 10.h,),
                    Text(
                      'Instructions *',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: screenUtil.setSp(12),
                      ),

                    ),
                    Container(

                      child: InstructionsEditText(hint:"",onClick: (value){
                        instructions= value;

                      },
                        f: _focusInstruction,
                        mText: instructions,
                      ),
                    ),
                    SizedBox(width: width,
                      height: 10.h,),
                    addButton('Edit Address',context),
                    SizedBox(width: width,
                      height: 30.h,),
                  ],
                ),
              )
              ,
            ),
          ),
        ),
      );
  }
  Widget buildAgeRow(Model.Data data) {
    return Container(






        alignment: AlignmentDirectional.centerStart,

        child: Text(data.countriesName ,
          style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w500,
              fontSize: screenUtil.setSp(12)
          ),));
  }
  Widget buildCityRow(City.Data data) {
    return Container(






        alignment: AlignmentDirectional.centerStart,

        child: Text(data.name ,
          style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w500,
              fontSize: screenUtil.setSp(12)
          ),));
  }
  TextButton addButton(String text,BuildContext context){
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
        validate(context);

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

  void validate(BuildContext context) async {
    if(_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      Map<String,String> map = Map();
      map['address_id'] = widget.addressModel.addressId.toString();
      map['entry_fullname']= name;
      map['entry_street_address']= address;
      map['entry_postcode']= "700015";
      map['entry_city']= city;
      map['entry_mobile']= phoneNumber;
      map['entry_state']= country;
      map['entry_country_id']= countryId;
      map['entry_zone_id']= zoneId;
      map['customers_id']= loginModel.data[0].id.toString();
      String mGender = loginModel.data[0].gender.toString().toLowerCase() ;
      String gender ="";
      if(mGender == 'female'){
        gender = 'f';
      }else{
        gender = 'm';
      }
      map['entry_gender']= gender;
      map['entry_company']= 'NEO';
      map['entry_latitude']= latitiude;
      map['entry_longitude']= longitude;
      map['entry_fullname']= name;
      map['entry_block']= block;
      map['entry_area']= area;
      map['entry_avenue']= avenue;
      map['entry_houseno']= houseNo;
      map['entry_floor']= floor;
      map['entry_flat']= flat;
      map['entry_instructions']= instructions;
      map['entry_nationality']= country;
      map['is_default']= '1';
      eyeconServices services = eyeconServices();
      EditAddressModel addressModel = await services.editAddress(map);
      String status = addressModel.success;
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text(addressModel.message)));
      if(status == '1'){
        Navigator.of(context).pop({'selection':true});


      }
    }

  }
}