import 'package:flutter/material.dart';
import 'package:weather_app/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext contex) {
    return MaterialApp(
      home: const WeatherScreen(),
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      debugShowMaterialGrid: false,
    );
  }
}
