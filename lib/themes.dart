import 'package:flutter/material.dart';

import 'package:dash/constants.dart';

//LIGHT THEME
ThemeData lightTheme() {
  return ThemeData(
    primaryColor: Color(0xFFe7e9f0),
    primaryColorLight: Color(0xFFcde5f2),
    primaryColorDark: Colors.black,
    accentColor: Color(0xFF3ebbfe),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Open Sans",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: textColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1:
        TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.normal),
    bodyText1:
        TextStyle(color: Color(0xFFa8abb2), fontWeight: FontWeight.normal),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Color(0xFFc1c5d1)),
    textTheme: TextTheme(
      headline6: TextStyle(color: secondaryColor, fontSize: 18),
    ),
  );
}

//DARK THEME
ThemeData darkTheme() {
  return ThemeData(
    primaryColor: Color(0xFF46487f),
    primaryColorLight: Color(0xFFcde5f2),
    primaryColorDark: Color(0xFF1e1e4e),
    accentColor: Color(0xFFf8cc3c),
    scaffoldBackgroundColor: Color(0xFF2b2d5c),
    fontFamily: "Open Sans",
    appBarTheme: darkAppBarTheme(),
    textTheme: darkTextTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme darkAppBarTheme() {
  return AppBarTheme(
    color: Color(0xFF2b2d5c),
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Color(0xFF888bca)),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0xFF888bca), fontSize: 18),
    ),
  );
}

TextTheme darkTextTheme() {
  return TextTheme(
    headline1:
        TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.normal),
    bodyText1:
        TextStyle(color: Color(0xFF888bca), fontWeight: FontWeight.normal),
  );
}
