import 'package:flutter/material.dart';

class PurchaseOrdersPage extends StatefulWidget {
  const PurchaseOrdersPage({super.key});

  @override
  State<PurchaseOrdersPage> createState() => _PurchaseOrdersPageState();
}

class _PurchaseOrdersPageState extends State<PurchaseOrdersPage> {
  List<Map<String, String>> purchaseOrders = [
    {"supplier": "ABC Suppliers", "total": "500.00", "status": "Pending"},
    {"supplier": "XYZ Wholesalers", "total": "1,200.00", "status": "Completed"},
  ];

  void _addPurchaseOrder(String supplier, String total) {
    setState(() {
      purchaseOrders
          .add({"supplier": supplier, "total": total, "status": "Pending"});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Purchase Orders",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
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
                        trailing: Text(order['status']!,
                            style: const TextStyle(color: Colors.blue)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PurchaseOrderDetailsScreen(order: order),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPurchaseOrderScreen(
                          onOrderAdded: _addPurchaseOrder),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Add New Purchase Order",
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

class AddPurchaseOrderScreen extends StatelessWidget {
  final Function(String, String) onOrderAdded;
  final TextEditingController supplierController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  AddPurchaseOrderScreen({super.key, required this.onOrderAdded});

  void _saveOrder(BuildContext context) {
    if (supplierController.text.isNotEmpty && totalController.text.isNotEmpty) {
      onOrderAdded(supplierController.text, totalController.text);
      Navigator.pop(context);
    }
  }

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
        title: const Text("New Purchase Order",
            style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: supplierController,
                decoration: InputDecoration(
                  hintText: "Supplier Name",
                  prefixIcon: const Icon(Icons.business, color: Colors.teal),
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

class PurchaseOrderDetailsScreen extends StatelessWidget {
  final Map<String, String> order;

  const PurchaseOrderDetailsScreen({super.key, required this.order});

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
        title: const Text("Purchase Order Details",
            style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Supplier: ${order['supplier']}",
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
