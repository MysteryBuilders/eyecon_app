


import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';




class PhoneEditText extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onClick;
  final String mText;
  BuildContext context;

  String _errorMessage(String str){
    switch(str){
      case 'Full Name':

        return 'Full Name Is Empty!';

    }
  }
  FocusNode f;

  PhoneEditText({Key key, @required this.hint,@required this.icon,@required this.onClick, this.mText,@required this.f}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    this.context = context;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController myController = TextEditingController()..text = mText;

    return Container(




      child:

      Stack(


        children: [

          Container(

            child: TextFormField(
              focusNode: f,
              initialValue: mText,
              textAlign: TextAlign.start,

              keyboardType: TextInputType.phone ,
              onSaved: onClick,
              textInputAction: TextInputAction.done,
              maxLines: 1,
              minLines: 1,





              validator: validateName,
              cursorColor: Color(0xFF000000),

              decoration:
              InputDecoration(
                  prefixIcon:
                  Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/kw.png',
                      width: 10.h,
                      height: 10.h,
                      fit: BoxFit.fill,
                    ),
                  ),

                  prefixText: '+965- ',
                  prefixStyle: TextStyle(
                    color: Color(0xFF000000),
                    fontSize:screenUtil.setSp(14),

                  ),



                  contentPadding: EdgeInsets.all(14.w),
                  isDense: true,

                  hintText: hint,



                  labelStyle: TextStyle(color: kLightGrayColor),
                  filled: true,



                  fillColor: Color(0xFFFFFFFF),
                  enabledBorder:
                  OutlineInputBorder(

                      borderSide: BorderSide(
                          color: Color(0xFFdcdcdc)
                          ,width: 1.w
                      )
                  ),
                  focusedBorder:
                  OutlineInputBorder(


                      borderSide: BorderSide(
                          color: Color(0xFFdcdcdc)
                          ,width: 1.w
                      )
                  )
                  // OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(20),
                  //     borderSide: BorderSide(
                  //         color: Colors.white
                  //     )
                  // )
                  ,
                  border:
                  OutlineInputBorder(


                      borderSide: BorderSide(
                          color: Color(0xFFFF0000),
                          width: 1.w
                      )
                  )


                // OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(20),
                //     borderSide: BorderSide(
                //         color: Colors.red
                //     )
              ),


            ),
          ),

        ],
      ),
    );

  }
  String validateName(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{8}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "";
    }
    else if (!regExp.hasMatch(value)) {
      return "";
    }
    return null;





  }

}