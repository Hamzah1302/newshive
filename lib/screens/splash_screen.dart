import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newshive/screens/onboarding_screen.dart'; // Kita akan buat file ini selanjutnya

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer untuk pindah halaman setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sesuaikan dengan warna background di Figma
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/images/news logo.png', // Pastikan nama file sesuai
              width: 150, // Sesuaikan ukurannya
            ),
            const SizedBox(height: 20),
            // Teks "News Hive"
            const Text(
              'News Hive',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333), // Ganti dengan warna dari Figma
              ),
            ),
            const SizedBox(height: 50),
            // Indikator Loading
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent), // Ganti dengan warna dari Figma
            ),
          ],
        ),
      ),
    );
  }
}