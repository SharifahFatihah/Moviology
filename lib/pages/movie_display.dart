import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/states/movie_cubit.dart';
import 'package:movie_app/states/movie_state.dart';
import 'package:movie_app/widgets/movie_list.dart';

class MovieDisplay extends StatelessWidget {
  const MovieDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MovieCubit cubit = BlocProvider.of<MovieCubit>(context)
    //   ..fetchMovie(movieModel);

    return Center(
      child: BlocBuilder<MovieCubit, MovieState>(
        bloc: BlocProvider.of<MovieCubit>(context),
        builder: ((context, state) {
          // if (state is MovieInitial) {
          //   return MovieList(movieModel: state.movieModel);
          // }
          if (state is MovieLoading) {
            return const CircularProgressIndicator();
          }
          if (state is MovieLoaded) {
            //movie_information widget to display info
            return MovieList(movieModel: state.movieModel);
          }

          return Text(
              state is MovieError ? state.errorMessage : 'Unknown error.');
        }),
      ),
    );
  }
}
