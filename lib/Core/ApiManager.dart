import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieeapp/Core/CategoryList/CategoryListResponse.dart';
import 'package:movieeapp/Core/MoviesCategory/MoviesCategoriesResponse.dart';

class ApiManager {
  static const String apiKey = "64cafca5c6a014721825b917540c92f1";
  static const String baseUrl = "api.themoviedb.org";

  static Future<MoviesCategoriesResponse> getMoviesCategories() async {
    Uri apiUrl = Uri.https(
        baseUrl, "/3/genre/movie/list", {"api_key": apiKey});
    http.Response response = await http.get(apiUrl);
    var json = jsonDecode(response.body);
    MoviesCategoriesResponse categoriesResponse =
        MoviesCategoriesResponse.fromJson(json);
    return categoriesResponse;
  }
  static Future<CategoryListResponse> getCategoryList(dynamic genreId) async{
    Uri listUrl= Uri.https(baseUrl,"/3/discover/movie",{
      "api_key":apiKey,
      "with_genres":genreId.toString()
    });
    http.Response response = await http.get(listUrl);
    var json =jsonDecode(response.body);
    CategoryListResponse listResponse = CategoryListResponse.fromJson(json);
    return listResponse;
  }
}
