import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/states/bookmarks.dart';

//display movie information
class WatchLaterList extends StatelessWidget {
  const WatchLaterList({required this.movieModel, Key? key}) : super(key: key);

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: SizedBox(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide.none,
            ),
            color: Colors.grey.shade900,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          backgroundBlendMode: BlendMode.color,
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: NetworkImage(movieModel.poster),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieModel.title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              movieModel.genre,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              movieModel.runtime,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              movieModel.rated,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<BookmarkCubit>(context)
                              .removeBookmark(movieModel);
                        },
                        child: const Icon(
                          Icons.cancel,
                          size: 26.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
