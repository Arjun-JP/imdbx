import 'package:flutter/material.dart';
import 'package:imdbx/screens/home_screen.dart';

class GridViews extends StatelessWidget {
  final List movielist;
  const GridViews({super.key, required this.movielist});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar,
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(10),
        height: height * 1,
        width: width * 1,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 1.5 / 2,
                crossAxisSpacing: .1,
                mainAxisSpacing: .1),
            itemCount: movielist.length,
            itemBuilder: (BuildContext ctx, index) {
              return Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                child: Image(
                  image: NetworkImage(path + movielist[index]["poster_path"]),
                  fit: BoxFit.cover,
                ),
              );
            }),
      ),
    );
  }
}
