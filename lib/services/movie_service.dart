import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/moviesearch_model.dart';

//fetch API information

class MovieService {
  //method
  Future<MovieModel> fetchMovieInformation(String movieName) async {
    //http://www.omdbapi.com/?i=tt3896198&apikey=86435894 //i:id, t:title
    const String apiKey = '86435894';
    final Uri url = Uri(
      scheme: 'http',
      host: 'www.omdbapi.com',
      // path: '',
      queryParameters: {'t': movieName, 'apikey': apiKey},
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load movie information.');
    }
  }

  Future<MovieModel> fetchAllMovies(String movieName) async {
    //http://www.omdbapi.com/?i=tt3896198&apikey=86435894 //i:id, t:title
    const String apiKey = '86435894';
    final Uri url = Uri(
      scheme: 'http',
      host: 'www.omdbapi.com',
      // path: '',
      queryParameters: {'s': movieName, 'apikey': apiKey},
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load movie information.');
    }
  }
}
