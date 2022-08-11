import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/states/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieLoading());

//create fetchMovie method & call/control state(movie_state)
  Future<void> fetchMovie(String movieName) async {
    MovieService movieService = MovieService();
    emit(MovieLoading());

    try {
      MovieModel movieModel =
          await movieService.fetchMovieInformation(movieName);

      // print('printing length');
      // print(movieModel.ratings.length);

      emit(
        MovieLoaded(movieModel: movieModel),
      );
    } catch (e) {
      emit(MovieError(errorMessage: e.toString()));
    }
  }

  Future<void> fetchMovieList(String movieName) async {
    MovieService movieService = MovieService();
    emit(MovieLoading());

    try {
      MovieModel movieModel =
          (await movieService.fetchAllMovies(movieName)) as MovieModel;

      // print('printing length');
      // print(movieModel.ratings.length);

      emit(
        MovieLoaded(movieModel: movieModel),
      );
    } catch (e) {
      emit(MovieError(errorMessage: e.toString()));
    }
  }
}
