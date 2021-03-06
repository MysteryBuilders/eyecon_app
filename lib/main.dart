import 'dart:async';
import 'dart:io';


import 'package:eyecon_app/providers/cart_notifier.dart';
import 'package:eyecon_app/providers/model_hud.dart';
import 'package:eyecon_app/screens/categories_screen.dart';
import 'package:eyecon_app/screens/forget_password_screen.dart';
import 'package:eyecon_app/screens/login_screen.dart';
import 'package:eyecon_app/screens/main_screen.dart';
import 'package:eyecon_app/screens/register_screen.dart';
import 'package:eyecon_app/screens/splash_screen.dart';
import 'package:eyecon_app/utilities/constants.dart';
import 'package:flutter/material.dart';


import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'localization/localization_methods.dart';
import 'localization/set_localization.dart';
import 'package:intl/intl.dart';

import 'utilities/service_locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}



class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() {

    var f = new NumberFormat("###,###", "en_US");
    print(f.format(245315));

    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp> {
  String messageTitle = "Empty";
  String notificationAlert = "alert";


  Locale _local;
  void setLocale(Locale locale) {
    setState(() {
      _local = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {

        this._local = locale;
        print('LanguageCode = ${_local.languageCode}');
      });
    }).whenComplete((){
      setDefaultLang(_local.languageCode);
    });
    super.didChangeDependencies();
  }
  void setDefaultLang(String code) async{
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString(LANG_CODE, code);

  }

  String _messageText = "Waiting for message...";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    if (_local == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return

        ScreenUtilInit(


            builder:() =>

                MultiProvider(
                  providers: [
                    ChangeNotifierProvider<ModelHud>(create: (context) => ModelHud()),
                    ChangeNotifierProvider<CartNumber>(create: (context) => CartNumber()),

                  ],
                  child:

                  MaterialApp(


                    theme: ThemeData(


                        fontFamily: 'Cairo',
                      accentColor: kSecondaryColor,
                      primaryColor: kSecondaryColor,
                      colorScheme: ColorScheme.light(primary: const Color(0xFFE4937C)),
                      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),



                    ) ,
                    builder: (context, child) {
                      return MediaQuery(
                        child: child,
                        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      );
                    },



                    locale: _local,

                    supportedLocales: [
                      Locale('en', 'US'),
                      Locale('ar', 'KW')
                    ],
                    localizationsDelegates: [
                      SetLocalization.localizationsDelegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    localeResolutionCallback: (deviceLocal, supportedLocales) {
                      for (var local in supportedLocales) {
                        if (local.languageCode == deviceLocal.languageCode &&
                            local.countryCode == deviceLocal.countryCode) {
                          return deviceLocal;
                        }
                      }
                      print(supportedLocales.first.countryCode);
                      return supportedLocales.first;
                    }
                    ,
                    debugShowCheckedModeBanner: false,
                    initialRoute: SplashScreen.id,
                    routes: {
                      SplashScreen.id: (context) => SplashScreen(),
                      RegisterScreen.id: (context) => RegisterScreen(),
                      LoginScreen.id: (context) => LoginScreen(),
                      MainScreen.id: (context) => MainScreen(),
                      ForgetPasswordScreen.id: (context) => ForgetPasswordScreen(),
                      CategoriesScreen.id: (context) => CategoriesScreen(),
                              },

                  ),
                )
        );



    }
  }
}