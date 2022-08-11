// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/pages/movie_detail.dart';
import 'package:movie_app/pages/movie_display.dart';
import 'package:movie_app/widgets/category.dart';
import 'package:movie_app/pages/watch_later.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;
  bool _isMovieNameEmpty = true;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();

    _controller.addListener(() {
      setState((() => _isMovieNameEmpty = _controller.text.isEmpty));
    });
    //Or directly write as one line
    // _controller.addListener(() => isMovieNameEmpty = _controller.text.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(
          'MVG',
          style: TextStyle(
              fontFamily: 'RubikMarkerHatch',
              fontSize: 40,
              color: Colors.purpleAccent),
        ),
        leadingWidth: 100,
        title: Text('Moviology'),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WatchLater()));
                },
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
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/mvg.png',
            // height: 100,
            width: 400,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Moviology',
              style: TextStyle(
                  fontFamily: 'SecularOne',
                  fontSize: 40,
                  color: Colors.purpleAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter Movie Name...',
                hintStyle: TextStyle(color: Colors.blueGrey.shade600),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                filled: true,
                fillColor: Colors.blueGrey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.blueGrey.shade600,
                    size: 30,
                  ),
                  onPressed: _isMovieNameEmpty
                      ? null
                      : (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetail(
                                        movieName: _controller.text,
                                      )));
                        }),
                ),
              ),
            ),
          ),
          const Text(
            'Genre',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Category(),
          SizedBox(
            height: 400,
            child: MovieDisplay(),
          ),
        ],
      )),
    );
  }
}
