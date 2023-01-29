import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:imdbx/screens/home_screen.dart';
import 'package:imdbx/widgets/tittle.dart';

class MovieDetails extends StatelessWidget {
  final List moviedetails;
  final int index;

  const MovieDetails(
      {super.key, required this.moviedetails, required this.index});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: appbar,
      body: SizedBox(
        height: (height - MediaQuery.of(context).padding.top) * 1,
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          path + moviedetails[index]['backdrop_path']))),
            ),
            Positioned(
              top: height * .2,
              left: width * .05,
              right: width * .05,
              bottom: 0,
              child: Container(
                height: height * 8,
                width: width * .8,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 5, 5, 5),
                    borderRadius: BorderRadius.circular(10)),
                child: Card(
                  elevation: 50,
                  color: Colors.black,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 180,
                              width: 110,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(path +
                                          moviedetails[index]['poster_path']))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Flexible(
                                      child: SizedBox(
                                        width: width * .45,
                                        child: Text(
                                          (moviedetails[index]['title'])
                                                  .toString()
                                                  .isEmpty
                                              ? 'NA'
                                              : moviedetails[index]['title'],
                                          overflow: TextOverflow.clip,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      (moviedetails[index]['release_date'])
                                              .toString()
                                              .isEmpty
                                          ? 'NA'
                                          : moviedetails[index]['release_date'],
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      (moviedetails[index]['popularity']
                                              .toString()
                                              .isEmpty
                                          ? 'NA'
                                          : moviedetails[index]['popularity']
                                              .toString()),
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      (moviedetails[index]['original_language']
                                                  .toString() ==
                                              'en'
                                          ? 'English'
                                          : moviedetails[index]
                                                  ['original_language']
                                              .toString()),
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .45,
                                    child: RatingBar.builder(
                                      initialRating: (moviedetails[index]
                                              ['vote_average']) /
                                          2,
                                      minRating: (moviedetails[index]
                                              ['vote_average']) /
                                          2,
                                      maxRating: (moviedetails[index]
                                              ['vote_average']) /
                                          2,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 30,
                                      tapOnlyMode: false,
                                      updateOnDrag: false,
                                      unratedColor: const Color.fromARGB(
                                          255, 251, 250, 210),
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color:
                                            Color.fromARGB(255, 247, 232, 16),
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Tittle(
                            movielist: moviedetails,
                            tittle: 'Overview',
                            fontWeight: FontWeight.bold,
                            fontsize: 20,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        Text(
                          (moviedetails[index]['overview']).toString().isEmpty
                              ? 'Not avilable'
                              : moviedetails[index]['overview'],
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
