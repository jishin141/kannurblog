import 'package:flutter/material.dart';
import 'package:kannurblog/beachpage.dart';
import 'package:kannurblog/homepage.dart';
import 'package:kannurblog/pages.dart';
import 'package:kannurblog/spashscreen.dart';
import 'package:kannurblog/viewpoints.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
