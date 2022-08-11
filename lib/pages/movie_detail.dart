import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/states/movie_cubit.dart';
import 'package:movie_app/states/movie_state.dart';
import 'package:movie_app/widgets/movie_information.dart';
import 'package:movie_app/widgets/watch_later_list.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/widgets/movie_list.dart';

import 'package:movie_app/pages/watch_later.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({required this.movieName, Key? key}) : super(key: key);

  final String movieName;

  @override
  Widget build(BuildContext context) {
    MovieCubit cubit = BlocProvider.of<MovieCubit>(context)
      ..fetchMovie(movieName);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Text(
              'MVG',
              style: TextStyle(
                  fontFamily: 'RubikMarkerHatch',
                  fontSize: 30,
                  color: Colors.purpleAccent),
            ),
            Text('Movie Detail'),
          ],
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HomePage()));
                },
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
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
        child: BlocBuilder<MovieCubit, MovieState>(
          bloc: BlocProvider.of<MovieCubit>(context),
          builder: ((context, state) {
            if (state is MovieLoading) {
              return const CircularProgressIndicator();
            }
            if (state is MovieLoaded) {
              //movie_information widget to display info
              return MovieInformation(movieModel: state.movieModel);
            }

            return Text(
                state is MovieError ? state.errorMessage : 'Unknown error.');
          }),
        ),
      ),
    );
  }
}

// class MovieDetail extends StatefulWidget {
//   const MovieDetail({required this.movieName, required this.index, Key? key}) : super(key: key);

//   final String movieName;
//   final int index;

//   @override
//   State<MovieDetail> createState() => _MovieDetailState();
// }

// class _MovieDetailState extends State<MovieDetail> {
//   @override
//   Widget build(BuildContext context) {

//     MovieCubit cubit = BlocProvider.of<MovieCubit>(context)
//       ..fetchMovie(movieName);

//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: const <Widget>[
//             Text(
//               'MVG',
//               style: TextStyle(
//                   fontFamily: 'RubikMarkerHatch',
//                   fontSize: 40,
//                   color: Colors.purpleAccent),
//             ),
//             Text('Movie Detail'),
//           ],
//         ),
//         actions: <Widget>[
//           Padding(
//               padding: const EdgeInsets.only(right: 20.0),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => const HomePage()));
//                 },
//                 child: const Icon(
//                   Icons.search,
//                   size: 26.0,
//                 ),
//               )),
//         ],
//         backgroundColor: Colors.black,
//         elevation: 15,
//         shadowColor: Colors.purpleAccent.shade400,
//       ),
//       body: Center(
//         child: BlocBuilder<MovieCubit, MovieState>(
//           bloc: BlocProvider.of<MovieCubit>(context),
//           builder: ((context, state) {
//             if (state is MovieLoading) {
//               return const CircularProgressIndicator();
//             }
//             if (state is MovieLoaded) {
//               //movie_information widget to display info
//               return MovieInformation(movieModel: state.movieModel);
//             }

//             return Text(
//                 state is MovieError ? state.errorMessage : 'Unknown error.');
//           }),
//         ),
//       ),
//     );
//   }
// }
