import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  HeartState createState() => HeartState();
}

class HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    // Custom animation value bind with controller - Explicit Amination
    colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(controller);

    // Listen to changing events
    controller.addListener(() {
      print(controller.value);
      print(colorAnimation.value);
    });

    // Listen to changing events status (Completed or Dismissed)
    controller.addStatusListener((status) => print(status));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: colorAnimation.value,
            size: 30,
          ),
          onPressed: () {
            controller.isCompleted
                ? controller.reverse()
                : controller.forward();
          },
        );
      },
    );
  }
}
