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
      child: SizedBox(
        width: 100.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Colors.white.withOpacity(0.5),
              width: 1,
            ),
          ),
          elevation: 20,
          shadowColor: Colors.purpleAccent,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // const Icon(
                //   Icons.watch_later,
                //   color: Colors.white,
                //   size: 35,
                // ),
                Text(
                  movieModel.title,
                ),
                // const Text(
                //   'Duration',
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
