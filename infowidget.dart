import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const InfoWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey[300],
          child: Icon(icon, color: Colors.teal[900], size: 30),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
