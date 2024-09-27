import 'package:flutter/material.dart.';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieeapp/screens/tabs%20screen/home_tab/home_sections/bottom_section/recommended_logic.dart';
import 'package:movieeapp/screens/tabs%20screen/home_tab/home_sections/hero_section/popular_movies_logic.dart';
import 'package:movieeapp/screens/tabs%20screen/home_tab/home_sections/mid_section/new_release_logic.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       PopularMoviesLogic(),
        SizedBox(
          height: 24.h,
        ),
       NewReleasesLogic(),
       SizedBox(height: 30.h,),
        Container(
          color: Color(0xff282A28),
          height: 276.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 27.w, bottom: 11.h, top: 13.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recommended",
                  style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 12.h,
                ),
               RecommendedLogic(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

