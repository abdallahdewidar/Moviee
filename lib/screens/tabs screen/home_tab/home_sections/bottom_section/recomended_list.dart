import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieeapp/Core/CategoryList/Results.dart';

class RecommendedList extends StatefulWidget {
  List<Result> movies;

  RecommendedList({super.key, required this.movies});

  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding:  REdgeInsets.symmetric(horizontal: 7.0),
            child: Column(
              children: [
               Stack(
                 children: [
                   ClipRRect(
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                   child: Container(
                      height: 125.h,
                   width: 96.87.w,
                   decoration: const BoxDecoration(
                   shape: BoxShape.circle,
                   ), // BoxDecoration
                   child: CachedNetworkImage(
                     width: 97.w,
                                    height: 128.h,
                                    fit: BoxFit.fill,
                            imageUrl:'https://image.tmdb.org/t/p/w500${widget.movies[index].posterPath}',
                            progressIndicatorBuilder: (context, url, downloadProgress) => 
                              CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                         ),// Image.asset
                   ), // Container
                   ),
                                              GestureDetector(child: SvgPicture.asset(widget.movies[index].isWatched??false?'assets/watched_mark.svg':'assets/unwatched_mark.svg'),onTap: (){setState((){widget.movies[index].isWatched=!widget.movies[index].isWatched!;});},),

                 ],
               ),
                Container(
                  decoration: const BoxDecoration(
                  color: Color(0xff343534),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),


),
                  padding: EdgeInsets.only(left: 6.w),
                   width: 97.w,
                  height: 80.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 7.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffFFA90A),
                            size: 10.sp,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text('${widget.movies[index].voteAverage}',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        widget.movies[index].originalTitle??'',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                 
                )
              ],
            ),
          );
        },
        
      ),
    );
  }
}

                  