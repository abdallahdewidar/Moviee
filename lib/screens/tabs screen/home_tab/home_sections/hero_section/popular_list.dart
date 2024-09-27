import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieeapp/Core/CategoryList/Results.dart';

class PopularMoviesItem extends StatefulWidget {
  List<Result> movies;
  PopularMoviesItem({super.key, required this.movies});

  @override
  State<PopularMoviesItem> createState() => _PopularMoviesItemState();
}

class _PopularMoviesItemState extends State<PopularMoviesItem> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          height: 289.h,
          viewportFraction: 1,
          padEnds: false,
          animateToClosest: false,
          disableCenter: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          aspectRatio: 217 / 412,
          enlargeCenterPage: false,
        ),
        itemCount: widget.movies.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return Container(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 289.h,
                ),
                Image.network(
                  'https://image.tmdb.org/t/p/w500${widget.movies[itemIndex].backdropPath}',
                  height: 217.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  left: 21.w,
                  child: Image.network(
                    width: 130.w,
                    height: 200.h,
                    'https://image.tmdb.org/t/p/w500${widget.movies[itemIndex].posterPath}',
                  ),
                ),
                Positioned(
                  bottom: 40.h,
                  left: 160.w,
                  child: Text(
                    widget.movies[itemIndex].originalTitle ?? '',
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Positioned(
                  bottom: 25.h,
                  left: 160.w,
                  child: Text("2019  PG-13  2h 7m",
                      style: GoogleFonts.inter(
                          color: Color(0xffB5B4B4),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400)),
                ),
                Positioned(
                    bottom: 160.h,
                    left: 21.w,
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        widget.movies[itemIndex].isWatched ?? false
                            ? 'assets/images/watched_mark.svg'
                            : 'assets/images/unwatched_mark.svg',
                        width: 27.w,
                        height: 36.h,
                      ),
                      onTap: () {
                        setState(() {
                          widget.movies[itemIndex].isWatched =
                              !widget.movies[itemIndex].isWatched!;
                        });
                      },
                    )),
              ],
            ),
          );
        });
  }
}
