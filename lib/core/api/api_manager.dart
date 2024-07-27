import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/features/browse/data/models/category_response.dart';
import 'package:movie_app/features/browse/data/models/movieDiscover_response.dart';
import 'package:movie_app/features/homeTab/data/models/popular_response.dart';
import 'package:movie_app/features/homeTab/data/models/recomended_response.dart';
import 'package:movie_app/features/search/data/models/search_response.dart';
import '../../features/homeTab/data/models/moreLikeThis_Response.dart';
import '../../features/homeTab/data/models/releases_response.dart';

class ApiManager {
  static Future<ReleasesResponse> getReleases() async {
    var uri = Uri.https("api.themoviedb.org", "/3/movie/upcoming");

    http.Response response = await http.get(uri, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNDg5OGY4MjQ5N2MwOWM2OTU3Y2VhODQyYjhhZDIzZCIsInN1YiI6IjY2MjRkZWFjY2I1YzhlMDE4NzQwNzg2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-koD4BztdeRlbaiQpd2BLmXdx4tzD_zoufZFNXmLFLY"
    });

    final json = jsonDecode(response.body);
    return ReleasesResponse.fromJson(json);
  }

  static Future<RecomendedResponse> getRecomended() async {
    var uri = Uri.https("api.themoviedb.org", "/3/movie/top_rated");

    http.Response response = await http.get(uri, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNDg5OGY4MjQ5N2MwOWM2OTU3Y2VhODQyYjhhZDIzZCIsInN1YiI6IjY2MjRkZWFjY2I1YzhlMDE4NzQwNzg2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-koD4BztdeRlbaiQpd2BLmXdx4tzD_zoufZFNXmLFLY"
    });

    final json = jsonDecode(response.body);
    return RecomendedResponse.fromJson(json);
  }

  static Future<PopularResponse> getPopular() async {
    var uri = Uri.https("api.themoviedb.org", "/3/movie/popular");

    http.Response response = await http.get(uri, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNDg5OGY4MjQ5N2MwOWM2OTU3Y2VhODQyYjhhZDIzZCIsInN1YiI6IjY2MjRkZWFjY2I1YzhlMDE4NzQwNzg2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-koD4BztdeRlbaiQpd2BLmXdx4tzD_zoufZFNXmLFLY"
    });

    final json = jsonDecode(response.body);
    return PopularResponse.fromJson(json);
  }

  static Future<MoreLikeThisResponse> getSimilar(int movieID) async {
    var uri = Uri.https("api.themoviedb.org", "/3/movie/${movieID}/similar");

    http.Response response = await http.get(uri, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNDg5OGY4MjQ5N2MwOWM2OTU3Y2VhODQyYjhhZDIzZCIsInN1YiI6IjY2MjRkZWFjY2I1YzhlMDE4NzQwNzg2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-koD4BztdeRlbaiQpd2BLmXdx4tzD_zoufZFNXmLFLY"
    });

    final json = jsonDecode(response.body);
    return MoreLikeThisResponse.fromJson(json);
  }

  static Future<SearchResponse> getSearch(String movieName) async {
    var uri = Uri.https(
        "api.themoviedb.org", "/3/search/movie", {'query': movieName});

    http.Response response = await http.get(uri, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNDg5OGY4MjQ5N2MwOWM2OTU3Y2VhODQyYjhhZDIzZCIsInN1YiI6IjY2MjRkZWFjY2I1YzhlMDE4NzQwNzg2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-koD4BztdeRlbaiQpd2BLmXdx4tzD_zoufZFNXmLFLY"
    });

    final json = jsonDecode(response.body);
    return SearchResponse.fromJson(json);
  }

  static Future<CategoryResponse> getCategories() async {
    var uri = Uri.https("api.themoviedb.org", "/3/genre/movie/list");
    http.Response response = await http.get(uri, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNDg5OGY4MjQ5N2MwOWM2OTU3Y2VhODQyYjhhZDIzZCIsInN1YiI6IjY2MjRkZWFjY2I1YzhlMDE4NzQwNzg2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-koD4BztdeRlbaiQpd2BLmXdx4tzD_zoufZFNXmLFLY"
    });

    final json = jsonDecode(response.body);
    return CategoryResponse.fromJson(json);
  }

  static Future<MovieDiscoverResponse> getMovieDiscover(String genreId) async {
    https: //api.themoviedb.org/3/discover/movie?with_genres=12
    var uri = Uri.https(
        "api.themoviedb.org",
        "/3/discover/movie",
        {'with_genres': genreId},);
    http.Response response = await http.get(uri, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNDg5OGY4MjQ5N2MwOWM2OTU3Y2VhODQyYjhhZDIzZCIsInN1YiI6IjY2MjRkZWFjY2I1YzhlMDE4NzQwNzg2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-koD4BztdeRlbaiQpd2BLmXdx4tzD_zoufZFNXmLFLY"
    });

    final json = jsonDecode(response.body);
    return MovieDiscoverResponse.fromJson(json);
  }
}
