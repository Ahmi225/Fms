import 'package:app/parts/infowidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddSaleOrderScreen extends StatelessWidget {
  final Function(String, String) onOrderAdded;
  final TextEditingController customerController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  AddSaleOrderScreen({super.key, required this.onOrderAdded});

  void _saveOrder(BuildContext context) {
    if (customerController.text.isNotEmpty && totalController.text.isNotEmpty) {
      onOrderAdded(customerController.text, totalController.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'New Sale Order'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: customerController,
                decoration: InputDecoration(
                  hintText: "Customer Name",
                  prefixIcon: const Icon(Icons.person, color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: totalController,
                decoration: InputDecoration(
                  hintText: "Total Amount",
                  prefixIcon:
                      const Icon(Icons.attach_money, color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.maxFinite,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => _saveOrder(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Save Order",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetailsScreen extends StatelessWidget {
  final Map<String, String> order;

  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.teal, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:
            const Text("Order Details", style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Customer: ${order['customer']}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Total Amount: \$${order['total']}",
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text("Status: ${order['status']}",
                  style: const TextStyle(fontSize: 16, color: Colors.blue)),
              const SizedBox(height: 20),
              SizedBox(
                width: double.maxFinite,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Back to Orders",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
