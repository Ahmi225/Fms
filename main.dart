import 'package:app/login.dart';
import 'package:app/dash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/theme/theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/splash.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      themeMode: themeProvider.themeMode,
      home: SplashScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                        children: const [
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
                    const Text(
                      "Factory Management System",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[900],
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[900],
                    ),
                    child: const Text(
                      "GET STARTED",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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
