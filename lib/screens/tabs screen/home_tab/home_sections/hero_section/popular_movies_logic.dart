import 'package:flutter/material.dart';
import 'package:movieeapp/Core/ApiManager.dart';
import 'package:movieeapp/Core/models/popular/Popular.dart';
import 'package:movieeapp/screens/tabs%20screen/home_tab/home_sections/hero_section/popular_list.dart';


class PopularMoviesLogic extends StatelessWidget {
  const PopularMoviesLogic({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Popular?>(
      future: ApiManager.getPopularMovies(),
      builder: (context, snapShot) {
        if (snapShot.data?.success == false) {
          return Column(
            children: [
              Text(snapShot.data?.statusMessage ?? ''),
              ElevatedButton(
                onPressed: () {
                 ApiManager.getPopularMovies();
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
                  ApiManager.getPopularMovies();
                },
                child: Text("Retry"),
              )
            ],
          );
        }
        var moviesList = snapShot.data?.results ?? [];
        return PopularMoviesItem (movies: moviesList,);
      },
    );
  }
}
