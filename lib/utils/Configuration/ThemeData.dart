import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

class MyTheme {
  static final MyTheme _myTheme = MyTheme._instance();

  factory MyTheme() {
    return _myTheme;
  }
  MyTheme._instance();
  Color primarySwatch = Color.fromARGB(255, 94, 94, 94);
  TextStyle text1Style = TextStyle(fontSize: 36);
  static const LargeTextSize = 26.0;
  static const MediumTextSize = 20.0;
  static const BodyTextSize = 16.0;

  static const String FontNameDefault = 'PoiterOne';
  static const String FontNameTitle = 'Montserrat';

  Color kPrimaryColor = Color.fromARGB(255, 255, 255, 255);
//Color kPrimaryColor = Color(0xFFEC407A);
  Color kSecondaryColor = Color.fromARGB(255, 97, 97, 97);
// Color kSecondaryColor = Color(0xFFD6D6D6);
  Color kBackgroundColor = Color.fromARGB(255, 255, 255, 255);

//Color kAccentColor = Color(0xFF8FECFF);
  Color kAccentColor = Color.fromARGB(255, 49, 49, 49);

  static var mySystemTheme = SystemUiOverlayStyle.light
      .copyWith(systemNavigationBarColor: Color.fromARGB(255, 255, 255, 255));

  TextStyle thefirNameStyle = TextStyle();

  ThemeData basicTheme() => ThemeData(
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,

        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 97, 97, 97),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 235, 235, 235)),
        )),

        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'PTSansNarrow',
            fontSize: 16,
            color: Color.fromARGB(255, 46, 46, 46),
          ),
          //Освоено
          bodyText1: TextStyle(
            fontFamily: FontNameDefault,
            fontSize: BodyTextSize,
            color: Colors.green,
          ),
        ),

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),

        accentColor: Colors.white,
        buttonTheme: ButtonThemeData(
          height: 80,
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.accent,
        ),

        // bottomAppBarColor: Colors.deepPurple,
        // cardColor: Colors.orange.shade100,
        // scaffoldBackgroundColor: Colors.yellow,
      );
}
