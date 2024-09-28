import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieeapp/Core/CategoryList/CategoryListResponse.dart';
import 'package:movieeapp/Core/MoviesCategory/MoviesCategoriesResponse.dart';
import 'package:movieeapp/Core/models/new_relases/Upcomming.dart';
import 'package:movieeapp/Core/models/popular/Popular.dart';
import 'package:movieeapp/Core/models/recomended_movies/Recomended.dart';
import 'package:movieeapp/Core/simsir%20response/simir%20response.dart';

class ApiManager {
  static const String apiKey = "64cafca5c6a014721825b917540c92f1";
  static const String baseUrl = "api.themoviedb.org";
static const String popularApi = "/3/movie/popular";
static const String upcomingApi  ='/3/movie/upcoming';
static const String topRatedMovieApi  ='/3/movie/top_rated';
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
  static Future<Popular?> getPopularMovies() async {
Uri url=Uri.https(ApiManager.baseUrl,ApiManager.popularApi,{'api_key':ApiManager.apiKey});
try {
      var response = await http.get(url);
            var jsonBody = jsonDecode(response.body);
      var object= Popular.fromJson(jsonBody);
      print(object.results?[0].posterPath);
      return object;
      
    } catch (error) {
      throw Exception('Error fetching sources: $error');
    }}
static Future<Upcoming?> getNewReleasedMovies() async {
Uri url=Uri.https(ApiManager.baseUrl,ApiManager.upcomingApi,{'api_key':ApiManager.apiKey});
try {
      var response = await http.get(url);
var jsonBody = jsonDecode(response.body);
      return Upcoming.fromJson(jsonBody);
    } catch (error) {
      throw Exception('Error fetching sources: $error');
    }}
static Future<Recommended?> getRecommendedMovies() async {
Uri url=Uri.https(ApiManager.baseUrl,ApiManager.topRatedMovieApi,{'api_key':ApiManager.apiKey});
try {
      var response = await http.get(url);
var jsonBody = jsonDecode(response.body);
      return Recommended.fromJson(jsonBody);
    } catch (error) {
      throw Exception('Error fetching sources: $error');
    }}
  static Future<SimilarResponse> similrmovies(int MovieId) async {
    Uri similrUrl = Uri.https(
        baseUrl, "/3/discover/movie", {
      "api_key": apiKey,

    });
    http.Response response = await http.get(similrUrl);
    var json = jsonDecode(response.body);
    SimilarResponse similarResponse = SimilarResponse.fromJson(json);
    return similarResponse;
  }
}
