import 'package:flutter/material.dart';
import 'dart:math';

class AnimateScreen extends StatefulWidget {

  static const String name = "animated_screen";

  const AnimateScreen({super.key});

  @override
  State<AnimateScreen> createState() => _AnimateScreenState();
}

class _AnimateScreenState extends State<AnimateScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 120;
    height = random.nextInt(500) + 120;
    borderRadius = random.nextInt(100) + 20;

    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1
    );

    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),

      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          width: width < 0 ? 0 : width,
          height: height < 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}