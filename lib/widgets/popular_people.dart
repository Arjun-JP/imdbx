import 'package:flutter/material.dart';
import 'package:imdbx/widgets/people_details.dart';

import '../screens/home_screen.dart';

class PopularPeopleList extends StatelessWidget {
  final List movielist;
  final String image;
  PopularPeopleList({
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
            height: 178,
            child: ListView.builder(
                controller: controller,
                itemCount: movielist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(5),
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              image: DecorationImage(
                                  image: NetworkImage(path +
                                      movielist[index]['profile_path']))),
                        ),
                        Text(
                          movielist[index]['name'],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onTap: () {
                      print(movielist);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => PopularPeopleDetails(
                                index: index,
                                pepoplelist: movielist,
                              ))));
                    },
                  );
                }),
          ),
        ]);
  }
}
