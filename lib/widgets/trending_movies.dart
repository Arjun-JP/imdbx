import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdbx/screens/movie_details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../screens/home_screen.dart';

class TrendingMovies extends StatelessWidget {
  final List movielist;
  TrendingMovies({super.key, required this.movielist});
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 420,
            child: PageView.builder(
                controller: controller,
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CarouselSlider.builder(
                    itemCount: 6,
                    itemBuilder: (context, index, realIndex) {
                      return InkWell(
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Container(
                                //   padding: const EdgeInsets.all(10),
                                //   margin: const EdgeInsets.all(5),
                                //   width: 270,
                                //   height: 150,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(30),
                                //       image: DecorationImage(
                                //           image: NetworkImage(
                                //               path + movielist[index]['backdrop_path']),
                                //           fit: BoxFit.cover)),
                                // ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(5),
                                  width: 300,
                                  height: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(50),
                                          topLeft: Radius.circular(50)),
                                      image: DecorationImage(
                                          image: NetworkImage(path +
                                              movielist[index]['poster_path']),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                            Positioned(
                              top: height * .5,
                              right: width * .01,
                              child: Text(
                                '${index + 1}',
                                style: GoogleFonts.londrinaOutline(
                                    color: const Color.fromARGB(234, 255, 9, 9),
                                    fontSize: 100,
                                    fontWeight: FontWeight.w900),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => MovieDetails(
                                    moviedetails: movielist,
                                    index: index,
                                  ))));
                        },
                      );
                    },
                    options: CarouselOptions(
                      height: 700,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.linearToEaseOut,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      viewportFraction: 0.8,
                      scrollDirection: Axis.horizontal,
                      pauseAutoPlayOnTouch: true,
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: SmoothPageIndicator(
                  controller: controller, // PageController
                  count: 6,
                  effect: const WormEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      type: WormType.normal,
                      paintStyle: PaintingStyle.fill,
                      dotColor: Color.fromARGB(
                          255, 124, 145, 156)), // your preferred effect
                  onDotClicked: (index) {}),
            ),
          )
        ]);
  }
}
