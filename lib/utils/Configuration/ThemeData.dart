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
  MaterialColor primarySwatch = Colors.blue;
  TextStyle text1Style = TextStyle(fontSize: 36);
  static const LargeTextSize = 26.0;
  static const MediumTextSize = 20.0;
  static const BodyTextSize = 16.0;

  static const String FontNameDefault = 'PoiterOne';
  static const String FontNameTitle = 'Montserrat';

  Color kPrimaryColor = Color.fromARGB(255, 48, 49, 53);
//Color kPrimaryColor = Color(0xFFEC407A);
  Color kSecondaryColor = Color.fromARGB(255, 248, 235, 235);
// Color kSecondaryColor = Color(0xFFD6D6D6);
  Color kBackgroundColor = Color(0xFF28292E);

//Color kAccentColor = Color(0xFF8FECFF);
  Color kAccentColor = Colors.white;

  static var mySystemTheme = SystemUiOverlayStyle.light
      .copyWith(systemNavigationBarColor: Color(0xFF28292E));

  TextStyle thefirNameStyle = TextStyle();

  ThemeData basicTheme() => ThemeData(
        brightness: Brightness.dark,
        primaryColor: kPrimaryColor,

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey[900]),
        )),

        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'PTSansNarrow',
            fontSize: 16,
            color: Colors.white,
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
