import 'package:flutter/material.dart';

//display movie information
class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> genres = <String>[
      'Horror',
      'Drama',
      'Comedy',
      'Thriller',
      'Action',
    ];

    // final List<Icon> icons = <Icon>[
    //   Icon(Icons.add),
    //   Icon(Icons.add),
    //   Icon(Icons.add),
    //   Icon(Icons.add),
    //   Icon(Icons.add),
    // ];

    // return ListView.builder(
    //   scrollDirection: Axis.vertical,
    //   shrinkWrap: true,
    //   itemCount: genres.length, //get entries length
    //   // scrollDirection: Axis.horizontal, //scroll the screen horizontal
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       height: 50,
    //       color: Colors.amber,
    //       child: Center(child: Text(' ${genres[index]}')), //return data
    //     );
    //   },
    // );

    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount: genres.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(children: [
            Container(
                width: 70,
                height: 70,
                color: Colors.deepPurple[700],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(' ${genres[index]}'),
                    const SizedBox(height: 5),
                    const Icon(Icons.arrow_circle_right_outlined)
                  ],
                )),
          ]);
        });

    // return Card(
    //   color: Colors.blueGrey[600],
    //   child: Column(
    //     mainAxisSize: MainAxisSize.max,
    //     children: [
    //       const SizedBox(height: 10),
    //       Container(
    //         padding: const EdgeInsets.all(10),
    //         child: Row(children: [
    //           Image(
    //             width: 200,
    //             height: 300,
    //             image: NetworkImage('${movieModel.poster}'),
    //           ),
    //           const SizedBox(height: 10),
    //           Container(
    //             padding: const EdgeInsets.only(left: 20),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text('Genre: ${movieModel.genre}'),
    //                 const SizedBox(height: 10),
    //                 Text(
    //                   'Duration: ${movieModel.runtime}',
    //                   // style: TextStyle(fontSize: 20),
    //                 ),
    //                 const SizedBox(height: 10),
    //               ],
    //             ),
    //           )
    //         ]),
    //       ),
    //     ],
    //   ),
    // );
  }
}
