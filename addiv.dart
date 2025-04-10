import 'package:app/parts/infowidget.dart';
import 'package:flutter/material.dart';

class AddStockItemScreen extends StatelessWidget {
  final Function(String, int, String) onItemAdded;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  String status = "Available";

  AddStockItemScreen({super.key, required this.onItemAdded});

  void _saveItem(BuildContext context) {
    if (nameController.text.isNotEmpty &&
        quantityController.text.isNotEmpty &&
        int.tryParse(quantityController.text) != null) {
      int quantity = int.parse(quantityController.text);
      onItemAdded(nameController.text, quantity, status);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Stock'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Stock Item Name",
                prefixIcon: const Icon(Icons.inventory, color: Colors.teal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: quantityController,
              decoration: InputDecoration(
                hintText: "Quantity",
                prefixIcon:
                    const Icon(Icons.confirmation_number, color: Colors.teal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: status,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: ["Available", "Low Stock", "Out of Stock"]
                  .map((status) =>
                      DropdownMenuItem(value: status, child: Text(status)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  status = value;
                }
              },
            ),
            const SizedBox(height: 20),
            CustomSaveButton(
              onPressed: () => _saveItem(context),
            ),
          ],
        ),
      ),
    );
  }
}

class StockDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const StockDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.teal, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title:
            const Text("Stock Details", style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Item: ${item['name']}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Quantity: ${item['quantity']}",
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Status: ${item['status']}",
                style: TextStyle(
                  fontSize: 16,
                  color:
                      item['status'] == "Low Stock" ? Colors.red : Colors.green,
                )),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
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
                  "Back to Stock",
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
    );
  }
}
