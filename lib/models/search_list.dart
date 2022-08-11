// To parse this JSON data, do
//
//     final movieModel = movieModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class MovieSearch {
  MovieSearch({
    required this.search,
    required this.totalResults,
    required this.response,
  });

  final List<Search> search;
  final String totalResults;
  final String response;

  factory MovieSearch.fromJson(String str) =>
      MovieSearch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieSearch.fromMap(Map<String, dynamic> json) => MovieSearch(
        search: List<Search>.from(json["Search"].map((x) => Search.fromMap(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
      );

  Map<String, dynamic> toMap() => {
        "Search": List<dynamic>.from(search.map((x) => x.toMap())),
        "totalResults": totalResults,
        "Response": response,
      };
}

class Search {
  Search({
    required this.title,
    required this.year,
    required this.imdbId,
    // required this.type,
    required this.poster,
  });

  final String title;
  final String year;
  final String imdbId;
  // final Type type;
  final String poster;

  factory Search.fromJson(String str) => Search.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Search.fromMap(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        // type: typeValues.map[json["Type"]],
        poster: json["Poster"],
      );

  Map<String, dynamic> toMap() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        // "Type": typeValues.reverse[type],
        "Poster": poster,
      };
}

// enum Type { MOVIE, SERIES }

// final typeValues = EnumValues({"movie": Type.MOVIE, "series": Type.SERIES});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
