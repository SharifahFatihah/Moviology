// import 'package:flutter/material.dart';
// import 'package:movie_app/models/movie_model.dart';
// import 'package:movie_app/models/search_list.dart';

// //display movie information
// class MovieList extends StatelessWidget {
//   const MovieList({required this.movieModel, Key? key}) : super(key: key);

//   final MovieModel movieModel;

//   @override
//   Widget build(BuildContext context) {
//     // print(movieModel.ratings.length);

//     return ListView.builder(
//       itemCount: movieSearch.search.length,
//       itemBuilder: (context, index) => Card(
//         child: ListTile(
//           title: Text(movieSearch.search[index].title),
//           leading: CircleAvatar(
//             backgroundImage: NetworkImage(movieSearch.search[index].poster),
//           ),
//         ),
//       ),
//     );

//     // return GridView.builder(
//     //     scrollDirection: Axis.vertical,
//     //     shrinkWrap: true,
//     //     physics: const NeverScrollableScrollPhysics(),
//     //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     //       crossAxisCount: 5,
//     //       crossAxisSpacing: 5.0,
//     //       mainAxisSpacing: 5.0,
//     //     ),
//     //     itemCount: movieModel.length,
//     //     itemBuilder: (BuildContext context, int index) {
//     //       return Column(mainAxisSize: MainAxisSize.min, children: [
//     //         Container(
//     //             padding: const EdgeInsets.all(10),
//     //             width: 100,
//     //             height: 100,
//     //             color: Colors.deepPurple[700],
//     //             child: Column(
//     //               mainAxisAlignment: MainAxisAlignment.center,
//     //               children: [
//     //                 Image(
//     //                     width: 200,
//     //                     height: 300,
//     //                     image: NetworkImage('${movieModel.poster}')),
//     //                 const SizedBox(height: 5),
//     //                 Text('${movieModel.title}',
//     //                     style: const TextStyle(
//     //                         fontSize: 10, fontWeight: FontWeight.bold)),
//     //                 const SizedBox(height: 5),
//     //                 Text(
//     //                   '${movieModel.genre}',
//     //                 ),
//     //               ],
//     //             )),
//     //       ]);
//     //     });
//   }
// }
