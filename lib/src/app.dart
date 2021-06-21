import 'package:flutter/material.dart';
import 'resourses/networking.dart';
import 'ui/movies_list.dart';

class App extends StatelessWidget {
  Networking network = Networking();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MoviesList(),
      ),
    );
  }
}
