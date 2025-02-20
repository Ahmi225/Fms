import 'package:flutter/material.dart';
import 'package:app/parts/infowidget.dart';
// Import the InfoWidget

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal[900],
        title: const Text(
          "Factory Dashboard",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Feature Grid Section
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: featureList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row for better spacing
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return InfoWidget(
                    title: featureList[index]["title"]!,
                    icon: featureList[index]["icon"]!,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Task List Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: factoryTasks.length,
                itemBuilder: (context, index) {
                  final task = factoryTasks[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(task["icon"], color: Colors.teal),
                      title: Text(
                        task["title"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(task["description"]!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Feature List Data - Updated Factory Management System Features
List<Map<String, dynamic>> featureList = [
  {"title": "Inventory Check", "icon": Icons.inventory},
  {"title": "New Order", "icon": Icons.shopping_cart},
  {"title": "Supplier Payments", "icon": Icons.payment},
  {"title": "Employee Attendance", "icon": Icons.people},
  {"title": "Sales Report", "icon": Icons.bar_chart},
  {"title": "Expense Analysis", "icon": Icons.money_off},
  {"title": "Product Quality", "icon": Icons.check_circle},
];

// Task List Data
List<Map<String, dynamic>> factoryTasks = [
  {
    "title": "Verify Stock Levels",
    "description": "Ensure all items are updated in the inventory system.",
    "icon": Icons.inventory,
  },
  {
    "title": "Process New Orders",
    "description": "Review and approve incoming factory orders.",
    "icon": Icons.shopping_cart,
  },
  {
    "title": "Release Supplier Payments",
    "description": "Confirm and process pending supplier invoices.",
    "icon": Icons.payment,
  },
  {
    "title": "Check Employee Attendance",
    "description": "Verify daily employee attendance records.",
    "icon": Icons.people,
  },
  {
    "title": "Generate Sales Report",
    "description": "Analyze and create a daily sales report.",
    "icon": Icons.bar_chart,
  },
  {
    "title": "Expense Optimization",
    "description": "Review expense logs and identify areas for cost-cutting.",
    "icon": Icons.money_off,
  },
  {
    "title": "Final Quality Inspection",
    "description":
        "Inspect products before dispatch to ensure quality standards.",
    "icon": Icons.check_circle,
  },
];
