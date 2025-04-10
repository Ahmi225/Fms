import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '',
          style: GoogleFonts.poppins(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Titlecentc
            Text(
              'Expense Categories',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            const SizedBox(height: 20),

            // List of Expense Categories
            Expanded(
              child: ListView(
                children: [
                  ExpenseCard(title: "Raw Materials", amount: "\$400"),
                  ExpenseCard(title: "Labor Wages", amount: "\$140"),
                  ExpenseCard(title: "Utilities", amount: "\$520"),
                  ExpenseCard(title: "Maintenance", amount: "\$220"),
                  ExpenseCard(title: "Rent", amount: "\$300"),
                  ExpenseCard(title: "Supplies", amount: "\$4000"),
                  ExpenseCard(title: "Transport", amount: "700"),
                  ExpenseCard(title: "Insurance", amount: "\$1000"),
                ],
              ),
            ),

            // Add New Expense Button
          ],
        ),
      ),
    );
  }
}

// Expense Card Widget
class ExpenseCard extends StatelessWidget {
  final String title;
  final String amount;

  const ExpenseCard({super.key, required this.title, required this.amount});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Align items at both ends
        children: [
          Row(
            children: [
              Icon(
                Icons.circle, // Bullet point icon
                size: 15,
                color: Colors.black,
              ),
              const SizedBox(
                  width: 20), // Space between the bullet and the text
              Text(
                title, // Title on the left
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            amount, // Amount on the right
            style: GoogleFonts.poppins(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
