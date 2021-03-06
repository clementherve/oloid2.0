import 'package:flutter/material.dart';

class OloidTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      cardTheme: const CardTheme(color: Color(0xff4c566a)),
      primaryColor: const Color(0xffd08770), // 0xffff9f00
      backgroundColor: const Color(0xff434c5e),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff4c566a),
        unselectedItemColor: Color(0xffffffff),
        selectedItemColor: Color(0xffd08770),
      ),
      textTheme: const TextTheme(
        button: TextStyle(color: Color(0xffffffff)),
        bodyText1: TextStyle(color: Color(0xffd8dee9)),
        bodyText2: TextStyle(color: Color(0xffc2c8d2)),
      ),
    );
  }

  static ThemeData lighTheme() {
    return ThemeData(
      cardTheme: const CardTheme(color: Color(0xffe5e9f0)),
      primaryColor: const Color(0xffd08770), // 0xffff9f00
      backgroundColor: const Color(0xffd8dee9),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xffd8dee9),
        unselectedItemColor: Color(0xff4c566a),
        selectedItemColor: Color(0xffd08770),
      ),
      textTheme: const TextTheme(
        button: TextStyle(color: Color(0xff4c566a)),
        bodyText1: TextStyle(color: Color(0xff4c566a)),
        bodyText2: TextStyle(color: Color(0xff4c566a)),
      ),
    );
  }
}
