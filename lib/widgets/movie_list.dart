import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';

//display movie information
class MovieList extends StatelessWidget {
  const MovieList({required this.movieModel, Key? key}) : super(key: key);

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    // print(movieModel.ratings.length);

    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
                padding: const EdgeInsets.all(10),
                width: 70,
                height: 70,
                color: Colors.deepPurple[700],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        width: 200,
                        height: 300,
                        image: NetworkImage('${movieModel.poster}')),
                    const SizedBox(height: 5),
                    Text('${movieModel.title}',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(
                      '${movieModel.genre}',
                    ),
                  ],
                )),
          ]);
        });
  }
}
