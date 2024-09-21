import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appstyle{
  static  Color primaycolor= Color(0xff1A1A1A);
  static  Color selecttab= Color(0xffFFBB3B);
  static  Color unselecttab= Color(0xffB5B4B4);
  static ThemeData Theme= ThemeData(
    textTheme:  TextTheme(
      titleMedium: TextStyle(
        fontSize: 25.sp,
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