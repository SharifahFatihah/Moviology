import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/states/movie_cubit.dart';
import 'package:movie_app/states/movie_state.dart';
import 'package:movie_app/widgets/movie_information.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({required this.movieName, Key? key}) : super(key: key);

  final String movieName;

  @override
  Widget build(BuildContext context) {
    MovieCubit cubit = BlocProvider.of<MovieCubit>(context)
      ..fetchMovie(movieName);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Detail'),
      ),
      body: Center(
        child: BlocBuilder<MovieCubit, MovieState>(
          bloc: BlocProvider.of<MovieCubit>(context),
          builder: ((context, state) {
            if (state is MovieLoading) {
              return const CircularProgressIndicator();
            }
            if (state is MovieLoaded) {
              //movie_information widget to display info
              return MovieInformation(movieModel: state.movieModel);
            }

            return Text(
                state is MovieError ? state.errorMessage : 'Unknown error.');
          }),
        ),
      ),
    );
  }
}
