import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  HeartState createState() => HeartState();
}

class HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  late Animation<double> sizeAnimation;
  late Animation<double> curve;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Custom curve for the animation controller and use it instead of directly using the controller
    curve = CurvedAnimation(parent: controller, curve: Curves.slowMiddle);

    // Custom animation value bind with controller - Explicit Amination
    colorAnimation =
        ColorTween(begin: Colors.grey[400], end: Colors.red).animate(curve);

    // Custom defined Tween Sequences
    sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 2), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 2, end: 1), weight: 50),
    ]).animate(curve);

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
          icon: Transform.scale(
            scale: sizeAnimation.value,
            // origin: Offset.zero,
            // alignment: Alignment.center,
            child: Icon(
              Icons.favorite,
              color: colorAnimation.value,
              size: 30,
            ),
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
