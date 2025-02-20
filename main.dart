import 'package:app/parts/dash.dart';
import 'package:flutter/material.dart';
import 'package:app/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo Text
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: "Power",
                            style: TextStyle(color: Colors.teal),
                          ),
                          TextSpan(
                            text: "Loom",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Subtitle
                    const Text(
                      "Factory Management System",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(height: 90), // Increased space

                    // Sign In Text (Moved Lower)
                    Column(
                      children: [
                        const Text("Have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 50), // Increased space
                  ],
                ),
              ),
            ),

            // "GET STARTED" Button at Bottom Right
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 150, // Adjust width if needed
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardScreen(),
                          ) // Navigate to ViewScreen
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "GET STARTED",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
