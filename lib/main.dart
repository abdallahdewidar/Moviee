import 'package:flutter/material.dart';
import 'package:movieeapp/Style/App%20stlyle.dart';
import 'package:movieeapp/screens/Home%20screen/Home%20screen.dart';
import 'package:movieeapp/screens/tabs%20screen/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:Appstyle.Theme,
      routes:{
        HomeScreen.routename:(_)=>HomeScreen(),

      }
      ,
      initialRoute: HomeScreen.routename,
      // NewsDetials.routeName
    );

  }
}




