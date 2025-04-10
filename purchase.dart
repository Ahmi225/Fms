import 'package:app/parts/infowidget.dart';
import 'package:flutter/material.dart';
import 'package:app/addpur.dart';

class PurchaseOrdersPage extends StatefulWidget {
  const PurchaseOrdersPage({super.key});

  @override
  State<PurchaseOrdersPage> createState() => _PurchaseOrdersPageState();
}

class _PurchaseOrdersPageState extends State<PurchaseOrdersPage> {
  List<Map<String, String>> purchaseOrders = [];

  void _addPurchaseOrder(String supplier, String total) {
    setState(() {
      purchaseOrders.add({
        "supplier": supplier,
        "total": total,
        "status": "Pending",
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Purchase Orders'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: purchaseOrders.length,
                  itemBuilder: (context, index) {
                    final order = purchaseOrders[index];
                    return Card(
                      child: ListTile(
                        title: Text("Supplier: ${order['supplier']}"),
                        subtitle: Text("Total: \$${order['total']}"),
                        trailing: Text(
                          order['status']!,
                          style: const TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddPurchaseOrderScreen(
                                onOrderAdded: _addPurchaseOrder,
                              ),
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPurchaseOrderScreen(
                onOrderAdded: _addPurchaseOrder,
              ),
            ),
          );
        },
      ),
    );
  }
}
