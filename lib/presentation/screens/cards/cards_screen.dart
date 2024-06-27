import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>> {
  { 'elevation' : 0.0, 'label' : 'Elevation 0' },
  { 'elevation' : 1.0, 'label' : 'Elevation 1' },
  { 'elevation' : 2.0, 'label' : 'Elevation 2' },
  { 'elevation' : 3.0, 'label' : 'Elevation 3' },
  { 'elevation' : 4.0, 'label' : 'Elevation 4' },
  { 'elevation' : 5.0, 'label' : 'Elevation 5' },
};

class CardsSreen extends StatelessWidget {
  const CardsSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarjetas')
        )
      );
  }
}

