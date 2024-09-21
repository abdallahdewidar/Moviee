import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieeapp/Core/MoviesCategory/Genres.dart';

class CategoriesItem extends StatelessWidget {
     const CategoriesItem({super.key,required this.model, required this.onPress});
   final Genres model;
  final Function() onPress;

   @override
  Widget build(BuildContext context) {
     List<String> names=["Action", "Adventure", "Animation", "Comedy", "Crime", "Drama", "Family"];
    return InkWell(
      onTap: onPress,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: REdgeInsets.all(15.0),
            child: Container(
              height: 170.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                image: DecorationImage(
                  image: AssetImage(names.contains(model.name)?
                  "assets/images/${model.name}.jpeg":"assets/images/images.jpeg"),
                  fit: BoxFit.fill,
                )
              ),
            ),
          ),
          Center(
            child: Text(
              model.name??"",style: Theme.of(context).textTheme.titleMedium?..copyWith(fontSize: 15.sp,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}
