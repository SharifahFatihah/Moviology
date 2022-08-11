import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/movie_detail.dart';
import 'package:movie_app/states/movie_cubit.dart';
import 'package:movie_app/states/movie_state.dart';
import 'package:movie_app/widgets/movie_information.dart';
import 'package:movie_app/widgets/movie_list.dart';

class MovieDisplay extends StatelessWidget {
  const MovieDisplay({required this.movieName, Key? key}) : super(key: key);

  final String movieName;

  @override
  Widget build(BuildContext context) {
    MovieCubit cubit = BlocProvider.of<MovieCubit>(context)
      ..searchMovie(movieName);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Text(
              'MVG',
              style: TextStyle(
                  fontFamily: 'RubikMarkerHatch',
                  fontSize: 40,
                  color: Colors.purpleAccent),
            ),
            Text('Movie List'),
          ],
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HomePage()));
                },
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
        ],
        backgroundColor: Colors.black,
        elevation: 15,
        shadowColor: Colors.purpleAccent.shade400,
      ),
      body: Center(
        child: BlocBuilder<MovieCubit, MovieState>(
          bloc: BlocProvider.of<MovieCubit>(context),
          builder: ((context, state) {
            if (state is MovieLoading) {
              return const CircularProgressIndicator();
            }
            if (state is MovieListLoaded) {
              //movie_information widget to display info
              final movieSearch = state.movieSearch;

              return ListView.builder(
                itemCount: movieSearch.search.length,
                itemBuilder: (BuildContext context, index) => Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetail(
                                    movieName: movieSearch.search[index].title,
                                  )));
                      print('sini-------------: ${movieName[index]}');
                    },
                    title: Text(movieSearch.search[index].title),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(movieSearch.search[index].poster),
                    ),
                  ),
                ),
              );
            }

            return Text(
                state is MovieError ? state.errorMessage : 'Unknown error.');
          }),
        ),
      ),
    );
  }
}
