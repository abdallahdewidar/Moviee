import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: REdgeInsets.all(30.0),
        child: TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[700],
              prefixIcon: Padding(
                padding: REdgeInsets.all(20.0),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 15.sp,
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(
                      width: 3.w,
                      style: BorderStyle.solid,
                      color: Colors.white))),
        ),
      ),
    ));
  }
}
