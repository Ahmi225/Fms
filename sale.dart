import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/parts/infowidget.dart';
import 'package:app/addsale.dart';

class SaleOrdersPage extends StatefulWidget {
  const SaleOrdersPage({super.key});

  @override
  State<SaleOrdersPage> createState() => _SaleOrdersPageState();
}

class _SaleOrdersPageState extends State<SaleOrdersPage> {
  List<Map<String, String>> orders = [];

  void _addOrder(String customer, String total) {
    setState(() {
      orders.add({"customer": customer, "total": total, "status": "Pending"});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Sale Order'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return Card(
                      child: ListTile(
                        title: Text("Customer: ${order['customer']}"),
                        subtitle: Text("Total: \$${order['total']}"),
                        trailing: Text(order['status']!,
                            style: const TextStyle(color: Colors.blue)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OrderDetailsScreen(order: order),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFAB(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddSaleOrderScreen(
              onOrderAdded: _addOrder,
            ),
          ),
        ),
      ),
    );
  }
}
