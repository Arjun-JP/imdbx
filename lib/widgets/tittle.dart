import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tittle extends StatelessWidget {
  final String tittle;
  final FontWeight fontWeight;
  final double fontsize;
  final Color color;
  const Tittle(
      {super.key,
      required this.tittle,
      required this.fontWeight,
      required this.fontsize,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListTile(
        title: Text(tittle,
            style: TextStyle(
                color: color, fontSize: fontsize, fontWeight: fontWeight)),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.right_chevron,
              size: 18,
              color: Color.fromARGB(255, 255, 255, 255),
            )),
      ),
    );
  }
}
