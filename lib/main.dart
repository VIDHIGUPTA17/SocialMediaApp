import 'package:flutter/material.dart';
import 'package:project/screens/homepage.dart';
import 'package:project/screens/photo_post_screen.dart';
import 'package:project/screens/text_post_screen.dart';
import 'package:project/screens/video_post_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Nav Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/textPost': (context) => TextPostScreen(),
        '/videoPost': (context) => VideoPostScreen(),
        '/photoPost': (context) => PhotoPostScreen(),
      },
    );
  }
}
