// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_anim/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Trips',
      home: Home(),
    );
  }
}
