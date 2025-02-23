import 'package:app/clsp.dart';
import 'package:flutter/material.dart';
import 'package:app/prod.dart';
import 'package:app/parts/infowidget.dart';

// FeatureItem Class
class FeatureItem {
  final String title;
  final IconData icon;

  FeatureItem({required this.title, required this.icon});
}

// RecentActivity Class
class RecentActivity {
  final String title;
  final String date;

  RecentActivity({required this.title, required this.date});
}

// DashboardScreen Class
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal[900],
          title: const Text(
            "Dashboard",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Features Grid
              Expanded(
                flex: 2,
                child: Container(
                  decoration: _boxDecoration(),
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: featureList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (featureList[index].title == "Client / Supplier") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ClientSupplierScreen(),
                              ),
                            );
                          } else if (featureList[index].title ==
                              "Product / Service") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProductServiceScreen(),
                              ),
                            );
                          }
                        },
                        child: InfoWidget(
                          title: featureList[index].title,
                          icon: featureList[index].icon,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Recent Activities List
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Recent Activities",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: recentActivities.length,
                        itemBuilder: (context, index) {
                          return _recentActivityCard(
                            title: recentActivities[index].title,
                            date: recentActivities[index].date,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Box Decoration for UI Consistency
  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  // Recent Activity Card Widget
  Widget _recentActivityCard({required String title, required String date}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(12),
      decoration: _boxDecoration(),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color.fromRGBO(1, 54, 45, 1),
            radius: 20,
            child: Icon(Icons.notifications, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}

// Feature List for Dashboard
List<FeatureItem> featureList = [
  FeatureItem(title: "Invoice", icon: Icons.receipt_long),
  FeatureItem(title: "Client / Supplier", icon: Icons.group),
  FeatureItem(title: "Product / Service", icon: Icons.inventory),
  FeatureItem(title: "Payment", icon: Icons.payment),
  FeatureItem(title: "Purchase", icon: Icons.shopping_bag),
  FeatureItem(title: "Sale Order", icon: Icons.assignment),
  FeatureItem(title: "Purchase Order", icon: Icons.receipt),
  FeatureItem(title: "Inventory", icon: Icons.store),
  FeatureItem(title: "Expense", icon: Icons.money_off),
  FeatureItem(title: "Reports", icon: Icons.bar_chart_rounded),
];

// Recent Activities List
List<RecentActivity> recentActivities = [
  RecentActivity(title: "Invoice #1001 Generated", date: "Feb 20, 2025"),
  RecentActivity(title: "Payment Received from Client", date: "Feb 19, 2025"),
];
