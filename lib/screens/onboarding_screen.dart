import 'package:flutter/material.dart';
import 'package:newshive/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Data untuk setiap halaman onboarding
  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/img intro 1.png",
      "title": "The World at Your Fingertips",
      "description":
          "Get 24/7 updates on global news – from breaking politics to cultural trends, all in one place."
    },
    {
      "image": "assets/images/img intro 2.png",
      "title": "Tailored to Your Curiosity",
      "description":
          "Select your interests and receive handpicked stories. Technology, sports, or entertainment – we've got you covered"
    },
    {
      "image": "assets/images/img intro 3.png",
      "title": "Trusted Updates in Real-Time",
      "description":
          "Instant alerts for breaking news, rigorously fact-checked by our editors before they reach you."
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Bagian utama yang berisi halaman-halaman yang bisa digeser
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  // Menggunakan widget terpisah untuk konten halaman agar lebih rapi
                  return OnboardingPageContent(
                    image: _onboardingData[index]['image']!,
                    title: _onboardingData[index]['title']!,
                    description: _onboardingData[index]['description']!,
                  );
                },
              ),
            ),
            // Indikator titik (dots) di bawah PageView
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingData.length,
                (index) => buildDot(index: index),
              ),
            ),
            const SizedBox(height: 60),

            // Bagian tombol di bagian bawah
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              // Cek jika ini adalah halaman terakhir atau bukan
              child: _currentPage == _onboardingData.length - 1
                  // Jika halaman terakhir, tampilkan tombol "Get Started"
                  ? SizedBox(
                      width: double.infinity,
                      child: _buildButton('Get Started', () {
                        // Aksi ketika Get Started ditekan: Pindah ke halaman Login
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      }),
                    )
                  // Jika bukan halaman terakhir, tampilkan tombol "Skip" dan "Next"
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Tombol Skip
                        TextButton(
                          onPressed: () {
                            // Langsung loncat ke halaman terakhir
                             _pageController.jumpToPage(_onboardingData.length - 1);
                          },
                          child: const Text('Skip', style: TextStyle(color: Colors.grey, fontSize: 16)),
                        ),
                        // Tombol Next
                        _buildButton('Next', () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // Method untuk membuat widget tombol utama agar tidak duplikasi kode
  Widget _buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF3A4E93), // Warna utama dari desain
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
      ),
      child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    );
  }

  // Method untuk membuat titik indikator dengan animasi
  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: _currentPage == index ? 24 : 8, // Titik aktif lebih panjang
      decoration: BoxDecoration(
        color: _currentPage == index ? const Color(0xFF3A4E93) : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

// Widget terpisah untuk konten setiap halaman Onboarding.
// Ini membuat kode utama lebih bersih dan mudah dibaca.
class OnboardingPageContent extends StatelessWidget {
  final String image, title, description;

  const OnboardingPageContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image, height: 300, fit: BoxFit.contain),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF212121), // Warna teks utama
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.5, // Jarak antar baris
            ),
          ),
        ],
      ),
    );
  }
}