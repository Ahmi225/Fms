import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to HomeScreen after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Static Image
            Image.asset(
              'assets/download.png', // Ensure this file exists in your assets folder
              width: 200,
              height: 200,
            ),

            const SizedBox(height: 40),

            // "Get Ready" Text
            Text(
              "Get Ready",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
