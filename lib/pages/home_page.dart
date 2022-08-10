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
      appBar: AppBar(title: const Text('Moviology')),
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Movie Name',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
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
          // const Text(
          //   'Genre',
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(height: 15),
          // Column(
          //   children: [
          //     Category(),
          //     SizedBox(height: 15),
          //     MovieDisplay(movieName: _controller.text),
          //   ],
          // )
        ],
      )),
    );
  }
}
