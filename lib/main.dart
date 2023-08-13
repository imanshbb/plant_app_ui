import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/splash_screen.dart';

//iman | PlantApp
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant app',
      home: SplashScreen(),
    );
  }
}
