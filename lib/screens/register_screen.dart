import 'package:flutter/material.dart';
import 'package:newshive/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  // Fungsi untuk menampilkan dialog sukses
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Otomatis tutup dialog dan pindah halaman setelah 2 detik
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Tutup dialog
          Navigator.of(context).pop(); // Kembali ke halaman login
        });

        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Color(0xFF3A4E93), size: 60),
                SizedBox(height: 16),
                Text(
                  'Sign Up Successful!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                'Hello',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                "Signup to get started",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 48),

              // Form
              const CustomTextField(labelText: 'Name', hintText: 'Name'),
              const SizedBox(height: 24),
              const CustomTextField(labelText: 'Phone Number', hintText: 'Phone Number'),
              const SizedBox(height: 24),
              const CustomTextField(labelText: 'Email', hintText: 'Email'),
              const SizedBox(height: 24),
              const CustomTextField(
                labelText: 'Password',
                hintText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 32),

              // Tombol Register
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Panggil dialog sukses
                    _showSuccessDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3A4E93),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Register', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 40),

              // Link ke Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Login', style: TextStyle(color: Color(0xFF3A4E93))),
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