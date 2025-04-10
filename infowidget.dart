import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const InfoWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.teal[900], size: 50),
        const SizedBox(height: 1),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal[900],
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomSaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomSaveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          "Save",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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

class CustomFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.teal[900],
      foregroundColor: Colors.white,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}

class Activity {
  String title;
  String description;
  String ondate;

  Activity(
      {required this.title, required this.description, required this.ondate});
}

class RecentActivitiesSection extends StatelessWidget {
  const RecentActivitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent Activities",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: activities.length,
              itemBuilder: (context, index) {
                Activity activity = activities[index];

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  elevation: 5,
                  color: Colors.white, // Set background color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    leading: Icon(
                      Icons.event_note,
                      color: Colors.teal[600],
                    ),
                    title: Text(
                      activity.title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          activity.description,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          activity.ondate,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<Activity> activities = [
  Activity(
      title: "Invoice #1234",
      description: " created for Client A.",
      ondate: "2 March 2025"),
  Activity(
      title: "Invoice #1234",
      description: " created for Client A.",
      ondate: "2 March 2025"),
  Activity(
      title: "Invoice #1234",
      description: " created for Client A.",
      ondate: "2 March 2025"),
]; // DashboardScreen Class

// Dashboard Total Card Widget
class DashboardTotalCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  const DashboardTotalCard({
    super.key,
    required this.title,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// FeatureItem Class
class FeatureItem {
  final String title;
  final IconData icon;

  FeatureItem({required this.title, required this.icon});
}

// Feature List
List<FeatureItem> featureList = [
  FeatureItem(title: "Invoice", icon: Icons.receipt_long),
  FeatureItem(title: "Client / Supplier", icon: Icons.group),
  FeatureItem(title: "Product", icon: Icons.inventory),
  FeatureItem(title: "Payment", icon: Icons.payment),
  FeatureItem(title: "Sale Order", icon: Icons.assignment),
  FeatureItem(title: "Purchase Order", icon: Icons.receipt),
  FeatureItem(title: "Inventory", icon: Icons.store),
  FeatureItem(title: "Expense", icon: Icons.money_off),
  FeatureItem(title: "Reports", icon: Icons.bar_chart_rounded),
];
