import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieeapp/Style/App%20stlyle.dart';
import 'package:movieeapp/firebase_options.dart';
import 'package:movieeapp/screens/BrowserCategory/CategoryList.dart';


import 'featuters/Home screen/Home screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,

  );
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
        return  MaterialApp(
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
        );
      },

    );

  }
}




