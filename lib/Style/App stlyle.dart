import 'dart:ui';

import 'package:flutter/material.dart';

class Appstyle{
  static  Color primaycolor= Color(0xff1A1A1A);
  static  Color selecttab= Color(0xffFFBB3B);
  static  Color unselecttab= Color(0xffB5B4B4);
  static ThemeData Theme= ThemeData(
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.white
      )
    ),
scaffoldBackgroundColor: primaycolor,
bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: selecttab,
  unselectedItemColor: unselecttab,
  ),
  );
}