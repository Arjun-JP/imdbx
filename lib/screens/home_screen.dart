
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdbx/widgets/popular_people.dart';
import 'package:imdbx/widgets/trending_movies.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../widgets/tittle.dart';
import '../widgets/movie_list_view.dart';

const path = 'https://image.tmdb.org/t/p/w500/';
bool loading = true;
final appbar = AppBar(
  backgroundColor: Colors.black,
  elevation: 0,
  title: Text(
    'TMDBX',
    style: GoogleFonts.kaushanScript(fontSize: 30),
  ),
);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List upcomingmovies = [];
  List popularmovies = [];
  List topratedmovies = [];
  List romanticmovies = [];
  List populartvhows = [];
  List actors = [];
  // final customDio = Dio();

  final String apikey = 'f75b5d94da604eb234cccdb6caad016b';
  final accesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNzViNWQ5NGRhNjA0ZWIyMzRjY2NkYjZjYWFkMDE2YiIsInN1YiI6IjYzZDE1MjY4YTQxMGM4MTIzODVjYjA5NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tOvjCtRX3kKJVCcsGr8NwK6QWf0Yu_0oYVY8gq3OJ4Y';

  @override
  void initState() {
    loadMovies();
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        loading = false;
      });
    });
  }

  loadMovies() async {
    try {
      TMDB tmdbWithCustomLogs = TMDB(
        ApiKeys(apikey, accesstoken),
        logConfig: const ConfigLogger(
            showLogs: true,
            showErrorLogs: true,
            showInfoLogs: true,
            showUrlLogs: true,
            showWarningLogs: true),
        // dio: customDio
      );
      Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
      Map upComingresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
      Map popularresult = await tmdbWithCustomLogs.v3.movies.getPopular();
      Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
      Map popularpeople = await tmdbWithCustomLogs.v3.people.getPopular();
      Map populartvshowsresult = await tmdbWithCustomLogs.v3.tv.getPopular();

      setState(() {
        trendingmovies = trendingresult['results'];
        upcomingmovies = upComingresult['results'];
        popularmovies = popularresult['results'];
        topratedmovies = topratedresult['results'];
        populartvhows = populartvshowsresult['results'];
        actors = popularpeople['results'];
        print('actor:$actors');
      });
    } catch (err) {
      print('error:${err.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: appbar,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            if (loading) ...[
              const Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              ))
            ] else ...[
              SizedBox(
                  height: 450,
                  child: TrendingMovies(movielist: trendingmovies)),
               Tittle(movielist:trendingmovies ,
                  tittle: 'Upcoming Movies',
                  fontWeight: FontWeight.w500,
                  fontsize: 20,
                  color: const Color.fromARGB(255, 255, 255, 255)),
              SizedBox(
                height: 150,
                child: MovieListView(
                  movielist: upcomingmovies,
                  image: 'poster_path',
                ),
              ),
               Tittle(movielist: popularmovies,
                  tittle: 'Popular movies',
                  fontWeight: FontWeight.w500,
                  fontsize: 20,
                  color: Colors.white),
              SizedBox(
                  height: 150,
                  child: MovieListView(
                      movielist: popularmovies, image: 'poster_path')),
               Tittle( movielist: topratedmovies,
                  tittle: 'Toprated movies',
                  fontWeight: FontWeight.w500,
                  fontsize: 20,
                  color: Colors.white),
              SizedBox(
                  height: 150,
                  child: MovieListView(
                      movielist: topratedmovies, image: 'poster_path')),
               Tittle(movielist:populartvhows ,
                  tittle: 'Polular Tv Shows',
                  fontWeight: FontWeight.w500,
                  fontsize: 20,
                  color: Colors.white),
              SizedBox(
                  height: 150,
                  child: MovieListView(
                      movielist: populartvhows, image: 'poster_path')),
               Tittle(movielist: actors,
                  tittle: 'Populer People',
                  fontWeight: FontWeight.w500,
                  fontsize: 20,
                  color: Colors.white),
              SizedBox(
                  height: 180,
                  child: PopularPeopleList(
                      movielist: actors, image: 'backdrop_path')),
            ]
          ]),
        ));
    // throw UnimplementedError();
  }
}
