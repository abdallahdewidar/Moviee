import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieeapp/screens/BrowserCategory/CategoriesListView.dart';

class Browse extends StatelessWidget {
   const Browse({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: REdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: REdgeInsets.all(15.0),
                child: Text("Browser Category",
                style: Theme.of(context).textTheme.titleMedium,),
              ),
              SizedBox(height: 20.h),
             CategoriesListView()
            ],
          ),
        ),
      ),
    );
  }
}
