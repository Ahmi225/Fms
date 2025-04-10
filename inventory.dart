import 'package:app/parts/infowidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/addiv.dart';

class AddStockPage extends StatefulWidget {
  const AddStockPage({super.key});

  @override
  State<AddStockPage> createState() => _AddStockPageState();
}

class _AddStockPageState extends State<AddStockPage> {
  List<Map<String, dynamic>> stockItems = [];

  void _addStockItem(String name, int quantity, String status) {
    setState(() {
      stockItems.add({"name": name, "quantity": quantity, "status": status});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Inventory'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: stockItems.length,
                itemBuilder: (context, index) {
                  final item = stockItems[index];
                  return Card(
                    child: ListTile(
                      title: Text("Item: ${item['name']}"),
                      subtitle: Text("Quantity: ${item['quantity']}"),
                      trailing: Text(
                        item['status'],
                        style: TextStyle(
                          color: item['status'] == "Low Stock"
                              ? Colors.red
                              : Colors.green,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StockDetailsScreen(item: item),
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
      floatingActionButton: CustomFAB(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddStockItemScreen(
              onItemAdded: _addStockItem,
            ),
          ),
        ),
      ),
    );
  }
}
