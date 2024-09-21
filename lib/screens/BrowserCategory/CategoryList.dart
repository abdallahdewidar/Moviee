import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieeapp/Core/ApiManager.dart';
import 'package:movieeapp/screens/BrowserCategory/CategoryContent.dart';
import 'package:movieeapp/Core/CategoryList/Results.dart';
import 'package:movieeapp/Core/MoviesCategory/Genres.dart';

class CategoryList extends StatefulWidget {
  static const String routeName = "CategoryList";

  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Genres;
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(args.name ?? "",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(
              height: 40.h,
            ),
            FutureBuilder(
              future: ApiManager.getCategoryList(args.id??28),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Column(
                    children: [
                      Text(
                        snapshot.error.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: const Text("Try Again"))
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data?.success == false) {
                  print("data error");
                  return Column(
                    children: [
                      Text(
                        snapshot.data?.statusMessage ?? "",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: const Text("Try Again"))
                    ],
                  );
                }
                List<Result> films = snapshot.data?.results ?? [];
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder:(context, index) => const Divider(),
                    itemCount: films.length,
                    itemBuilder: (context, index) {
                      return CategoryContent(text: films[index].title.toString(),
                      description: films[index].overview.toString(),);
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}