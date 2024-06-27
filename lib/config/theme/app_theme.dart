import 'package:flutter/material.dart';

const colorList = <  > [
    Colors.blue,
    Colors.black,
    Colors.yellow,
    Colors.green
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    required this.selectedColor
  }) : assert (
    selectedColor >= 0,
    'El color se debe encontrar entre 0 y 1'
  ),
  assert (
    selectedColor >= 0,
    'El color se debe encontrar entre 0 y 1'
  );

}