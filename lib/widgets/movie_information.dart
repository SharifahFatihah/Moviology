import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';

//display movie information
class MovieInformation extends StatelessWidget {
  const MovieInformation({required this.movieModel, Key? key})
      : super(key: key);

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 20);
    const rowSpacer = SizedBox(width: 10);

    print(movieModel.ratings.length);

    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _moviePhoto(movieModel),
                  const SizedBox(width: 25),
                  _cardDetails(movieModel, spacer)
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [_moreDetails(movieModel, spacer, rowSpacer)],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardDetails(MovieModel movieModel, SizedBox spacer) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
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
                    const Icon(
                      Icons.video_camera_back,
                      color: Colors.white,
                      size: 35,
                    ),
                    Text(
                      movieModel.genre,
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Genre',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          spacer,
          SizedBox(
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
                    const Icon(
                      Icons.watch_later,
                      color: Colors.white,
                      size: 35,
                    ),
                    Text(
                      movieModel.runtime,
                      // style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Duration',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          spacer,
          SizedBox(
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
                    const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 35,
                    ),
                    Text(
                      movieModel.ratings.first.value,
                    ),
                    const Text(
                      'Rating',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _moviePhoto(MovieModel movieModel) {
    return Expanded(
      flex: 4,
      child: Hero(
        tag: movieModel.poster,
        child: Container(
          width: 200,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(movieModel.poster),
            ),
          ),
        ),
      ),
    );
  }

  Widget _moreDetails(
      MovieModel movieModel, SizedBox spacer, SizedBox rowSpacer) {
    return Flexible(
      flex: 2,
      child: Column(
        children: [
          spacer,
          Text(
            movieModel.title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          spacer,
          const Text(
            'Plot Summary',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            movieModel.plot,
            style: const TextStyle(color: Colors.grey),
          ),
          spacer,
          const Text(
            'Cast',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            movieModel.actors,
            style: const TextStyle(color: Colors.grey),
          ),
          spacer,
          const Text(
            'Award',
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            movieModel.awards,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
