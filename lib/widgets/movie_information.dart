import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';

//display movie information
class MovieInformation extends StatelessWidget {
  const MovieInformation({required this.movieModel, Key? key})
      : super(key: key);

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    // print(movieModel.ratings.length);
    return Card(
      color: Colors.blueGrey[600],
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Image(
                width: 200,
                height: 300,
                image: NetworkImage('${movieModel.poster}'),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Genre: ${movieModel.genre}'),
                    const SizedBox(height: 10),
                    Text(
                      'Duration: ${movieModel.runtime}',
                      // style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    // Text('Rating: ${movieModel.ratings[index].source}'),
                    // Text('Rating: ${movieModel.ratings.first.source}'),
                  ],
                ),
              )
            ]),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 500,
                  child: Text(
                    '${movieModel.title}',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 330,
                        height: 100,
                        child: Text('${movieModel.plot}')),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.water,
                      color: Colors.amber,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${movieModel.ratings.first.source}: ${movieModel.ratings.first.value}',
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.water,
                      color: Colors.amber,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${movieModel.awards}',
                      // style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.upload_sharp,
                      color: Colors.amber,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${movieModel.actors}',
                      // style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
