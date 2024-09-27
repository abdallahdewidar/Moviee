import 'package:flutter/material.dart';
import 'package:movieeapp/Core/ApiManager.dart';
import 'package:movieeapp/Core/models/new_relases/Upcomming.dart';
import 'package:movieeapp/screens/tabs%20screen/home_tab/home_sections/mid_section/new_release_list.dart';


class NewReleasesLogic extends StatelessWidget {
  const NewReleasesLogic({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Upcoming?>(
      future: ApiManager.getNewReleasedMovies(),
      builder: (context, snapShot) {
        if (snapShot.data?.success == false) {
          return Column(
            children: [
              Text(snapShot.data?.statusMessage ?? ''),
              ElevatedButton(
                onPressed: () {
                 ApiManager.getNewReleasedMovies();
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
                  ApiManager.getNewReleasedMovies();
                },
                child: Text("Retry"),
              )
            ],
          );
        }
        var moviesList = snapShot.data?.results ?? [];
        return NewReleasesList(movies: moviesList,);
      },
    );
  }
}
