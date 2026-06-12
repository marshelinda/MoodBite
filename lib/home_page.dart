import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 90,
              color: Color(0xFF94B4A4),
            ),
            const SizedBox(height: 16),
            const Text(
              'Selamat Datang di MoodBite!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E35),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/',
                ); // Logika logout kembali ke awal
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF94B4A4),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
