


import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';



class AreaTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onClick;
  final String mText;
  BuildContext context;
  FocusNode f;

  String _errorMessage(String str){
    switch(str){
      case 'Full Name':

        return 'Full Name Is Empty!';

    }
  }

  AreaTextField({Key key, @required this.hint,@required this.icon,@required this.onClick, this.mText,@required this.f}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(




      child:

      Stack(


        children: [

          Container(

            child: TextFormField(
              focusNode: f,
              initialValue: mText,

              textAlign: TextAlign.start,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text ,
              onSaved: onClick,
              textInputAction: TextInputAction.next,
              maxLines: 1,
              minLines: 1,





              validator: validateName,
              cursorColor: Color(0xFF000000),

              decoration:
              InputDecoration(


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

    if (value.trim().isEmpty) {
      return "";
    }

    return null;
  }

}