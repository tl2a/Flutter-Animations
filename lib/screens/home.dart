import 'package:flutter/material.dart';
import 'package:flutter_anim/shared/screenTitle.dart';
import 'package:flutter_anim/shared/tripList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bg.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                SizedBox(height: 30),
                SizedBox(
                  height: 160,
                  child: ScreenTitle(text: 'Flutter Trips'),
                ),
                Flexible(
                  child: TripList(),
                )
                //Sandbox(),
              ],
            )));
  }
}
