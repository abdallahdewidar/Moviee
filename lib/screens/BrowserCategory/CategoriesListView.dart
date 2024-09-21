import 'package:flutter/material.dart';
import 'package:movieeapp/Core/ApiManager.dart';
import 'package:movieeapp/Core/MoviesCategory/Genres.dart';
import 'package:movieeapp/screens/BrowserCategory/CategoryList.dart';
import 'CategoriesItem.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getMoviesCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.error.toString(),
                  style: const TextStyle(color: Colors.white)),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getMoviesCategories();
                  },
                  child: const Text("Try Again"))
            ],
          );
        }
        if (snapshot.data?.success == false) {
          return Column(
            children: [
              Text(
                snapshot.data?.status_message ?? "",
                style: const TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getMoviesCategories();
                  },
                  child: const Text("Try Again"))
            ],
          );
        }
        List<Genres> genres = snapshot.data?.genres ?? [];
        return Expanded(
          child: GridView.builder(
            itemCount: genres.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return CategoriesItem(
                model: genres[index],
                onPress: () {
                  Navigator.pushNamed(context, CategoryList.routeName,
                      arguments: genres[index]);
                },
              );
            },
          ),
        );
      },
    );
  }
}
