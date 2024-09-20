import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieeapp/Style/App%20stlyle.dart';
import 'package:movieeapp/screens/BrowserCategory/CategoryList.dart';
import 'package:movieeapp/screens/Home%20screen/Home%20screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(412, 892),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:Appstyle.Theme,
        routes:{
          HomeScreen.routename:(_)=>HomeScreen(),
          CategoryList.routeName:(_)=>CategoryList()
        }
        ,
        initialRoute: HomeScreen.routename,
        // NewsDetials.routeName
      ),
    );

  }
}




