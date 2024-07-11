import 'package:flutter/material.dart';
class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  void ShowCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:  const Text('Hello World'),
              action: SnackBarAction(
                label: 'Aceptar',
                onPressed: () { ShowCustomSnackbar(context);}
                ),
              duration: const Duration(seconds: 3),
            )
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              child: const Text('Licencias'),
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Use esta licensia.')
                  ]
                );
              }
            ),

            FilledButton.tonal(
              child: const Text('Mostrar díalogo'),
              onPressed: () {}
              ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ShowCustomSnackbar(context),
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_rounded)),
    );  
  }
}