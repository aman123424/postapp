import 'package:flutter/material.dart';
import 'home.dart';
import 'addpost.dart';
import 'editpost.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/addpost': (context) => AddPost(),
        'editpost': (context) => EditPost(),
      },
    );
  }
}