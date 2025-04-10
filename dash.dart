import 'package:app/profile.dart';
import 'package:app/purchase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/app_drawer.dart';
import 'package:app/clsp.dart';
import 'package:app/inventory.dart';
import 'package:app/invoice.dart';
import 'package:app/reports.dart';
import 'package:app/pay.dart';
import 'package:app/sale.dart';
import 'package:app/prod.dart';
import 'package:app/parts/infowidget.dart';
import 'package:app/expense.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardHome(),
    ReportsScreen(),
    ProfilePage(), // You can add a profile page here if needed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.teal[900],
          title: Text(
            "Dashboard",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        drawer: AppDrawer(),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart, color: Colors.white),
              label: "Reports",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.white),
                label: "Profile"),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.teal[900],
          selectedLabelStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 12,
          ),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class DashboardHome extends StatelessWidget {
  const DashboardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Make the entire content scrollable
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Feature Items Grid
            GridView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling in GridView
              itemCount: featureList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (featureList[index].title == "Client / Supplier") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ClientSupplierScreen(),
                        ),
                      );
                    } else if (featureList[index].title == "Product") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductScreen(),
                        ),
                      );
                    } else if (featureList[index].title == "Reports") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReportsScreen(),
                        ),
                      );
                    } else if (featureList[index].title == "Invoice") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InvoiceScreen(),
                        ),
                      );
                    } else if (featureList[index].title == "Payment") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Pay(),
                        ),
                      );
                    } else if (featureList[index].title == "Sale Order") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SaleOrdersPage(),
                        ),
                      );
                    } else if (featureList[index].title == "Inventory") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddStockPage(),
                        ),
                      );
                    } else if (featureList[index].title == "Expense") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExpensePage(),
                        ),
                      );
                    } else if (featureList[index].title == "Purchase Order") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PurchaseOrdersPage(),
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
            Divider(
              color: Colors.teal[900], // Adjust the divider color as needed
              thickness: 4,
            ),

            // Display Total Sales, Total Purchase, Payment Received, and Payment Paid
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                color: Colors.white, // Set background color to white
                child: Column(
                  children: [
                    // First row with Sales and Purchase
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: DashboardTotalCard(
                            title: "Sales",
                            amount: "\$0",
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DashboardTotalCard(
                            title: "Purchase",
                            amount: "\$0",
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10), // Space between rows

                    // Second row with Payment Received and Payment Paid
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: DashboardTotalCard(
                            title: "Payment Rec",
                            amount: "\$0",
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DashboardTotalCard(
                            title: "Payment Paid",
                            amount: "\$0",
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    // Third row with Total Balance and Total Payments
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: DashboardTotalCard(
                            title: "Total Balance",
                            amount: "\$0",
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DashboardTotalCard(
                            title: "Total Payments",
                            amount: "\$0",
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10), // Space between rows

            Divider(
              color: Colors.teal[900], // Adjust the divider color as needed
              thickness: 4,
            ),
            RecentActivitiesSection(),
          ],
        ),
      ),
    );
  }
}
