import 'package:movie_app/models/movie_model.dart';

//state
abstract class MovieState {}

class MovieInitial extends MovieState {} //no need for this app

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final MovieModel movieModel;

  MovieLoaded({required this.movieModel});
}

class MovieError extends MovieState {
  final String errorMessage;

  MovieError({required this.errorMessage});
}
