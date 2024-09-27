import 'package:flutter/material.dart';
import 'package:movieeapp/Core/ApiManager.dart';
import 'package:movieeapp/Core/models/recomended_movies/Recomended.dart';
import 'package:movieeapp/screens/tabs%20screen/home_tab/home_sections/bottom_section/recomended_list.dart';

class RecommendedLogic extends StatelessWidget {
  const RecommendedLogic({super.key});

  @override
  Widget build(BuildContext context) {
      return FutureBuilder<Recommended?>(
      future: ApiManager.getRecommendedMovies(),
      builder: (context, snapShot) {
        if (snapShot.data?.success == false) {
          return Column(
            children: [
              Text(snapShot.data?.statusMessage ?? ''),
              ElevatedButton(
                onPressed: () {
                                    debugPrint("@@@@@@@@@@@@@@@@@@@@@@@@@@@");
                 ApiManager.getRecommendedMovies();
                }  ,
                child: Text("Retry"),
              )
            ],
          );
        } else if (snapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapShot.hasError) {
          return Column(
            children: [
              Text(
                "Error: ${snapShot.error}",
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  print(snapShot.error.toString());
                  ApiManager.getRecommendedMovies();
                },
                child: Text("Retry"),
              )
            ],
          );
        }
        var moviesList = snapShot.data?.results ?? [];
        return RecommendedList(movies: moviesList,);
      },
    );
  }
  }
