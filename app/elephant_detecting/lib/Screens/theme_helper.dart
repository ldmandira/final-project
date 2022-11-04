import 'package:flutter/material.dart';

class ThemeHelper {
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor = Color(0xFFA7BCC7);
  static const Color appBarColor = Color(0xFF063e39);
  static const Color topicColor = Color(0xFFFFFFFF);
}

class MyThemes{
  static final primaryColor = Colors.teal;
  static final darkTheme =  ThemeData(
    primaryColorDark: primaryColor,

  );

  static final lightTheme= ThemeData(
    primaryColor: primaryColor,
  );
}