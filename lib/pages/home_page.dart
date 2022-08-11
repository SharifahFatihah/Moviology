// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movie_app/pages/movie_detail.dart';
import 'package:movie_app/pages/movie_display.dart';
import 'package:movie_app/widgets/category.dart';

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
        title: Text(
          'MVG',
          style: TextStyle(
              fontFamily: 'RubikMarkerHatch',
              fontSize: 40,
              color: Colors.purpleAccent),
        ),
        actions: <Widget>[
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
      body: SingleChildScrollView(
          child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 400,
            height: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'images/posterr.png',
                    ),
                    fit: BoxFit.fitWidth),
              ),
              child: Center(
                child: Text(
                  'Moviology',
                  style: TextStyle(
                      fontFamily: 'SecularOne',
                      fontSize: 40,
                      color: Colors.purpleAccent),
                ),
              ),
            ),
          ),

          SizedBox(
            width: 350,
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
          SizedBox(height: 50),
          const Text(
            'Online Movie Database',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 350,
            height: 400,
            child: Text(
              'MVG is the short form for Moviology, an app devoted to movies, films, series and TV shows that contains general information about their ratings and more.',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
          ),

          // SizedBox(
          //   height: 15,
          // ),
          // Category(),
          // SizedBox(
          //   height: 400,
          //   child: MovieDisplay(),
          // ),
        ],
      )),
    );
  }
}
