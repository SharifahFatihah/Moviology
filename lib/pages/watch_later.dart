import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/states/bookmarks.dart';
import 'package:movie_app/states/movie_cubit.dart';
import 'package:movie_app/states/movie_state.dart';
import 'package:movie_app/widgets/watch_later_list.dart';
import 'package:movie_app/pages/home_page.dart';

class WatchLater extends StatelessWidget {
  const WatchLater({
    this.movieName,
    Key? key,
  }) : super(key: key);

  final String? movieName;
  // final String movieRate;
  // final String movieDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Text(
              'MVG',
              style: TextStyle(
                  fontFamily: 'RubikMarkerHatch',
                  fontSize: 30,
                  color: Colors.purpleAccent),
            ),
            Text('Watch Later'),
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
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.video_library,
                  size: 26.0,
                ),
              )),
        ],
        backgroundColor: Colors.black,
        elevation: 15,
        shadowColor: Colors.purpleAccent.shade400,
      ),
      body: Center(
        child: BlocBuilder<BookmarkCubit, Set<MovieModel>>(
          builder: ((context, state) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                return WatchLaterList(movieModel: state.elementAt(index));
              },
            );
          }),
        ),
      ),
    );
  }
}
