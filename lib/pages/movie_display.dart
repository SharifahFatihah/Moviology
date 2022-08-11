import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/states/movie_cubit.dart';
import 'package:movie_app/states/movie_state.dart';
import 'package:movie_app/widgets/movie_list.dart';

class MovieDisplay extends StatelessWidget {
  const MovieDisplay({required this.movieName, Key? key}) : super(key: key);

  final String movieName;

  @override
  Widget build(BuildContext context) {
    MovieCubit cubit = BlocProvider.of<MovieCubit>(context)
      ..fetchMovieList(movieName);

    return Center(
      child: BlocBuilder<MovieCubit, MovieState>(
        bloc: BlocProvider.of<MovieCubit>(context),
        builder: ((context, state) {
          if (state is MovieLoading) {
            return const CircularProgressIndicator();
          }
          if (state is MovieLoaded) {
            //movie_information widget to display info
            // final movieModel = state.movieModel;

            // return ListView.builder(
            //   itemCount: movieModel.length,
            //   itemBuilder: (context, index) => Card(
            //     child: ListTile(
            //       title: Text(movieModel.title),
            //       leading: CircleAvatar(
            //         backgroundImage: NetworkImage(movieModel.poster),
            //       ),
            //     ),
            //   ),
            // );
            return MovieList(movieModel: state.movieModel);
          }

          return Text(
              state is MovieError ? state.errorMessage : 'Unknown error.');
        }),
      ),
    );
  }
}
