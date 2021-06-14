


import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';



class InstructionsEditText extends StatelessWidget {
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

  InstructionsEditText({Key key, @required this.hint,@required this.icon,@required this.onClick, this.mText,@required this.f}) : super(key: key);

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
              initialValue: mText,
              focusNode: f,

              keyboardType: TextInputType.multiline,


              enableInteractiveSelection: true,
              onSaved: onClick,

              maxLines: 50,
              minLines: 1,

              textInputAction: TextInputAction.newline,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,


              textCapitalization: TextCapitalization.sentences,



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
    String errorMessage ;

    if(value.length == 0){
      errorMessage = "";

    }
    return errorMessage;
  }







}