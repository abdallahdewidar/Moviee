import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieeapp/Core/CategoryList/Results.dart';

class NewReleasesList extends StatefulWidget {
  List<Result> movies;

  NewReleasesList({super.key, required this.movies});

  @override
  State<NewReleasesList> createState() => _NewReleasesListState();
}

class _NewReleasesListState extends State<NewReleasesList> {
  bool watched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff282A28),
        width: double.infinity,
        height: 190.h,
        child: Padding(
          padding: EdgeInsets.only(left: 27.w, bottom: 7.h, top: 13.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "New Releases",
                style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: Stack(
                        children: [
                         
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 97.w, height: 128.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ), // BoxDecoration
                              child:CachedNetworkImage(
                 width: 97.w,
                                height: 128.h,
                                fit: BoxFit.fill,
         imageUrl:'https://image.tmdb.org/t/p/w500${widget.movies[index].posterPath}',
         progressIndicatorBuilder: (context, url, downloadProgress) => 
           CircularProgressIndicator(value: downloadProgress.progress),
         errorWidget: (context, url, error) => Icon(Icons.error),
      ),
                            ), // Container
                          ),
                           GestureDetector(child: SvgPicture.asset(widget.movies[index].isWatched??false?'assets/watched_mark.svg':'assets/unwatched_mark.svg'),onTap: (){setState((){widget.movies[index].isWatched=!widget.movies[index].isWatched!;});},),
                        ],
                      ),
                    );
                  },
                  itemCount: widget.movies.length,
                ),
              ),
            ],
          ),
        ));
  }
}
