import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Text('Circular Indicator'),
          CircularProgressIndicator(
              strokeWidth: 5,
              backgroundColor: Color.fromARGB(31, 0, 30, 255)),
          SizedBox(height: 20),
          Text('Circular Indicator Controlled'),
          _ControlledProgressIndicator(),
          SizedBox(height: 20),
          Text('Square Indicator'),
          SquareProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 50), (value) {
          return (value + 2) / 100;
        }),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                    value: progressValue,
                    strokeWidth: 5,
                    backgroundColor: Colors.black12),
                const SizedBox(width: 20),
                Expanded(child: LinearProgressIndicator(value: progressValue))
              ],
            ),
          );
        });
  }
}

class SquareProgressIndicator extends StatelessWidget {
  const SquareProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.black12,
        shape: BoxShape.rectangle,
      ),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 5,
          backgroundColor: Color.fromARGB(31, 0, 30, 255),
        ),
      ),
    );
  }
}