import 'package:flutter/material.dart';
import 'package:newshive/screens/register_screen.dart'; // Akan dibuat selanjutnya
import 'package:newshive/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Hello\nAgain!',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A4E93),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Welcome back you've been missed",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 48),

              // Form
              const CustomTextField(
                labelText: 'Email',
                hintText: 'Email',
              ),
              const SizedBox(height: 24),
              const CustomTextField(
                labelText: 'Password',
                hintText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password ?',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Tombol Login
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi login (simulasi)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3A4E93),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 40),

              // Link ke Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: const Text('Sign Up', style: TextStyle(color: Color(0xFF3A4E93))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}