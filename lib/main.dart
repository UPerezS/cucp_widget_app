import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cucp_widget_app/config/router/app_router.dart';
import 'package:cucp_widget_app/config/theme/app_theme.dart';
import 'package:cucp_widget_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).getTheme(),
      home: const HomeScreen()
    );
  }
}