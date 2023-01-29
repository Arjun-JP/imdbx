import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/movie_details.dart';

class MovieListView extends StatelessWidget {
  final List movielist;
  final String image;
  MovieListView({
    super.key,
    required this.movielist,
    required this.image,
  });
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: false,
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
                controller: controller,
                itemCount: movielist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(5),
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      path + movielist[index][image]),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                    onTap: () {
                      print(movielist);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => MovieDetails(
                                moviedetails: movielist,
                                index: index,
                              ))));
                    },
                  );
                }),
          ),
        ]);
  }
}
