import 'dart:ui';

import 'package:flutter/material.dart';

class Appstyle{
  static  Color primaycolor= Color(0xff1A1A1A);
  static  Color selecttab= Color(0xffFFBB3B);
  static  Color unselecttab= Color(0xffB5B4B4);
  static ThemeData Theme= ThemeData(
scaffoldBackgroundColor: primaycolor,
bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: selecttab,
  unselectedItemColor: unselecttab,
  ),
  );
}