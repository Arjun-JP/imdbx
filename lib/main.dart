import 'package:flutter/material.dart';
import 'package:imdbx/screens/home_screen.dart';

void main() {
  runApp(const Imdbx());
}

class Imdbx extends StatelessWidget {
  const Imdbx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          errorColor: Colors.red,
          primaryColor: Colors.blue,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.yellow)),
      home: const Home(),
    );
  }
}
