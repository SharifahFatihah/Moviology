import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/watch_later.dart';

//display movie information
class WatchLaterList extends StatelessWidget {
  const WatchLaterList({required this.movieModel, Key? key}) : super(key: key);

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 20);
    const rowSpacer = SizedBox(width: 10);

    return SingleChildScrollView(
      child: Container(),
    );
  }
}
