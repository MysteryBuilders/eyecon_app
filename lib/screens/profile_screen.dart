import 'dart:convert';

import 'package:eyecon_app/api/eyecon_services.dart';
import 'package:eyecon_app/model/country_model.dart'as Model;
import 'package:eyecon_app/model/login_model.dart';
import 'package:eyecon_app/model/update_profile_model.dart';
import 'package:eyecon_app/providers/model_hud.dart';
import 'package:eyecon_app/screens/main_screen.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:eyecon_app/utilities/shared_prefs.dart';
import 'package:eyecon_app/widgets/user_name_edit.dart';
import 'package:eyecon_app/widgets/user_name_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ScreenUtil screenUtil = ScreenUtil();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String name;
  String email;
  String dateofBirth;
  String country;
  LoginModel loginModel;
  DateTime _selectedDate  = DateTime.now();
  Model.CountryModel countryModel;
  String dob = null;
  bool isFemale = false;
  bool isMale = true;
  String gender ="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser().then((value) {
      setState(() {

        loginModel = value;
        dob = loginModel.data[0].dob;
        print(dob);
        if(dob != null){
          _selectedDate =DateFormat("dd-MM-yyyy").parse(dob);

        }else{
          _selectedDate  = DateTime.now();
        }

        if(loginModel.data[0].nationality != null){
          country = loginModel.data[0].nationality;
        }else{
         country = "";
        }
        gender = loginModel.data[0].gender;
        if(gender!= null){
          if(gender == 'Male'){
             isFemale = false;
             isMale = true;
          }else{
            isFemale = true;
            isMale = false;
          }
        }

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
        backgroundColor: Color(0xFFFFFFFF),
        appBar:   AppBar(
          centerTitle: true,
          title:Container(
            width: screenUtil.screenWidth,
            child: Center(
              child: Text('My Account',
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

            color: Color(0xFFF9F9F9),

            child: loginModel == null?
            Container(
              child: CircularProgressIndicator(


              ),
              alignment: AlignmentDirectional.center,
            )
                :

            Container(
              margin: EdgeInsets.all(10.h),
              width: width,
              height: height,
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,



                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Text(
                    'Fist Name*',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: screenUtil.setSp(12),
                    ),

                  ),
                  Container(

                    child: UserNameEditTextField(hint:"",onClick: (value){
                      name= value;

                    },
                        mText:loginModel.data[0].fullName
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    'Date of Birth*',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: screenUtil.setSp(12),
                    ),

                  ),
                  GestureDetector(
                    onTap: (){
                      _showDatePicker();
                    },
                    child:
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
                          child: Text( DateFormat.yMMMMd().format(_selectedDate))),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    'Nationality',
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

                          hint:  Text(loginModel.data[0].nationality == null?"Select Country" :loginModel.data[0].nationality,
                            textAlign: TextAlign.start,
                            style: TextStyle(

                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,
                                fontSize: screenUtil.setSp(12)
                            ),),
                          onChanged: (Model.Data age){
                            country = age.countriesName;

                          },
                          customWidgets: countryModel.data.map((p) => buildAgeRow(p)).toList(),
                          isExpanded: true,
                          showUnderline: false,
                        ),),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    'Select Gender',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: screenUtil.setSp(12),
                    ),

                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      GestureDetector(
                        onTap: (){
                          if(!isMale){
                            isMale = true;
                            isFemale = false;
                            setState(() {

                            });
                          }
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/images/male.png',
                            height: 60.h,width:30.w ,
                              color:isMale?Color(0xFFDC8E77): Color(0xFF000000),
                            ),
                            SizedBox(height: 10.h,),
                            Text('Male',
                            style: TextStyle(
                              color: isMale?Color(0xFFDC8E77):Color(0xFF000000),
                              fontSize: screenUtil.setSp(15)
                            ),)
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          if(!isFemale){
                            isFemale = true;
                            isMale = false;
                            setState(() {

                            });
                          }
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/images/female.png',
                              height: 60.h,width:30.w ,
                              color: isFemale?Color(0xFFDC8E77):Color(0xFF000000),
                            ),
                            SizedBox(height: 10.h,),
                            Text('Female',
                              style: TextStyle(
                                  color: isFemale?Color(0xFFDC8E77):Color(0xFF000000),
                                  fontSize: screenUtil.setSp(15)
                              ),)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  shopButton('Save',context)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<LoginModel> getUser()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String loginData = sharedPreferences.getString(kUserModel);
    eyeconServices services = eyeconServices();
    countryModel = await services.country();
    final body = json.decode(loginData);
    LoginModel   loginModel = LoginModel.fromJson(body);
    return loginModel;
  }
  void _showDatePicker() {
    showDatePicker(
        context: context,

        initialDate: _selectedDate,
        //which date will display when user open the picker
        firstDate: DateTime.now().add(Duration(days: -36500)),
        //what will be the previous supported year in picker
        lastDate: DateTime
            .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
      });
    });
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
        validate(context);


      },
      child: Text(text,style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: screenUtil.setSp(15),
          fontWeight: FontWeight.bold
      ),),
    );
  }

  void validate(BuildContext context) async{

    if(_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      String gender ="";
      if(isFemale){
        gender = "Female";
      }
      if(isMale){
        gender = "Male";
      }
      final modelHud = Provider.of<ModelHud>(context, listen: false);
      modelHud.changeIsLoading(true);
      Map map = Map();
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      map['customers_id'] = loginModel.data[0].id.toString();
      map['customers_full_name'] = name;
      map['customers_telephone'] = loginModel.data[0].phone;
      map['customers_gender'] = gender;
      map['customers_dob'] = formatter.format(_selectedDate);
      map['customers_nationality'] = country;
     eyeconServices services = eyeconServices();
     UpdateProfileModel updateProfileModel =await services.updateProfile(map);
     String status = updateProfileModel.success;

     if(status == "1"){
       SharedPref sharedPref = SharedPref();
       String _fullName = await sharedPref.readString('email');
       String _password = await sharedPref.readString('password');
       Map map = Map();
       map['email'] = _fullName;
       map['password'] = _password;

       eyeconServices services = eyeconServices();

       LoginModel loginModel = await services.login(map);
       String success = loginModel.success;
       modelHud.changeIsLoading(false);
       if(success == "1"){
         modelHud.changeIsLoading(false);
         await sharedPref.save(kUserModel, loginModel);
         await sharedPref.saveBool(kIsLogin, true);
         await sharedPref.saveString("email", _fullName);
         await sharedPref.saveString("password", _password);

         Navigator.pushReplacementNamed(context, MainScreen.id);
       }


     }else{
       modelHud.changeIsLoading(false);
     }
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text(updateProfileModel.message)));

    }
  }
}
