import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_model.dart';

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

  // Future<List<MovieModel>> fetchAllMovies(String movieName, int page) async {
  //   //http://www.omdbapi.com/?i=tt3896198&apikey=86435894 //i:id, t:title
  //   const String apiKey = '86435894';
  //   final Uri url = Uri(
  //     scheme: 'http',
  //     host: 'www.omdbapi.com',
  //     // path: '',
  //     queryParameters: {'s': movieName, 'page': page, 'apikey': apiKey},
  //   );

  //   http.Response response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     final result = jsonDecode(response.body);
  //     Iterable list = result["Search"];
  //     return list.map((e) => MovieModel.fromJson(e)).toList();
  //   } else {
  //     throw Exception('Failed to load movie information.');
  //   }
  // }
}
