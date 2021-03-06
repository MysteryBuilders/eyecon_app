


import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';



class NameTextField extends StatelessWidget {
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

   NameTextField({Key key, @required this.hint,@required this.icon,@required this.onClick, this.mText}) : super(key: key);

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


              textAlign: TextAlign.start,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.emailAddress ,
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



                    fillColor: Color(0xFFF5F5F5),
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
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

    if (!emailValid) {
      return "Please Enter Your Email Address";
    }

    return null;
  }

}