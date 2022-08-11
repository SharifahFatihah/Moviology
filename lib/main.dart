import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/states/bookmarks.dart';
import 'package:movie_app/states/movie_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<MovieCubit>(
        create: (context) => MovieCubit(),
      ),
      BlocProvider<BookmarkCubit>(
        create: (_) => BookmarkCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFD500F9),
        scaffoldBackgroundColor: const Color(0x1F000000),
      ),
      home: const HomePage(),
    );
  }
}
