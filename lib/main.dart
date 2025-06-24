// lib/main.dart
import 'package:flutter/material.dart';
import 'package:newshive/screens/splash_screen.dart'; // Import splash screen Anda

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Hive',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Poppins', // Contoh jika ingin menggunakan font custom
      ),
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      home: const SplashScreen(), // Mulai dari Splash Screen
    );
  }
}