import 'dart:convert';
import 'dart:core';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/search_list.dart';

//fetch API information

class MovieService {
  //method
  Future<MovieModel> fetchMovieInformation(String movieName) async {
    //https://www.omdbapi.com/?t=batman&apikey=86435894 //i:id, t:title
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

  Future<MovieSearch> searchMovie(String movieName) async {
    //https://www.omdbapi.com/?s=Batman&apikey=86435894 //i:id, t:title
    const String apiKey = '86435894';
    final Uri url = Uri(
      scheme: 'http',
      host: 'www.omdbapi.com',
      // path: '',
      queryParameters: {'s': movieName, 'apikey': apiKey},
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return MovieSearch.fromJson(response.body);

      // final result = jsonDecode(response.body);
      // Iterable list = result["Search"];
      // return list.map((e) => MovieSearch.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load movie information.');
    }
  }
}
