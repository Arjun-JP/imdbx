import 'package:flutter/material.dart';
import 'package:imdbx/screens/home_screen.dart';

class PopularPeopleDetails extends StatelessWidget {
  final List pepoplelist;
  final int index;
  const PopularPeopleDetails(
      {super.key, required this.index, required this.pepoplelist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            width: 100,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                    image: NetworkImage(
                        path + pepoplelist[index]['profile_path']))),
          ),
          Text(
            pepoplelist[index]['name'],
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          Text(
            (pepoplelist[index]['id']).toString(),
            style: const TextStyle(color: Color.fromARGB(255, 13, 13, 13)),
          ),
          Text(
            (pepoplelist[index]['media_type']).toString(),
            style: const TextStyle(color: Color.fromARGB(255, 13, 13, 13)),
          ),
        ],
      ),
    );
  }
}
