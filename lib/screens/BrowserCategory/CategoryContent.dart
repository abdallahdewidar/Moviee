import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryContent extends StatelessWidget {
  const CategoryContent({super.key, required this.text,required this.description});
  final String text;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
              image:  DecorationImage(
                  image: AssetImage("assets/images/images.jpeg"),
                  fit: BoxFit.fill)),
        ),
        SizedBox(width: 10.w,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 1,
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(description,
              style: const TextStyle(
                color: Colors.grey
              ),),
            ],
          ),
        ),
      ],
    );
  }
}
