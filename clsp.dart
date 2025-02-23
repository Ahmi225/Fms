import 'package:flutter/material.dart';

class ClientSupplierScreen extends StatefulWidget {
  const ClientSupplierScreen({super.key});

  @override
  State<ClientSupplierScreen> createState() => _ClientSupplierScreenState();
}

class _ClientSupplierScreenState extends State<ClientSupplierScreen> {
  bool showClients = true; // Initially showing clients

  List<String> clients = [];
  List<String> suppliers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        iconTheme:
            const IconThemeData(color: Colors.white), // Back button white
        title: const Text(
          "Clients & Suppliers",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Tab Switch (Clients / Suppliers)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => setState(() => showClients = true),
                child: Text(
                  "Clients",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: showClients ? Colors.teal[900] : Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => setState(() => showClients = false),
                child: Text(
                  "Suppliers",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: !showClients ? Colors.teal[900] : Colors.grey,
                  ),
                ),
              ),
            ],
          ),

          const Divider(),

          // List of Clients or Suppliers
          Expanded(
            child: ListView.builder(
              itemCount: showClients ? clients.length : suppliers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(showClients ? clients[index] : suppliers[index]),
                  leading: Icon(showClients ? Icons.person : Icons.business),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Action when clicking on a client/supplier
                  },
                );
              },
            ),
          ),
        ],
      ),

      // Floating Action Button to Add Client/Supplier
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[900],
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          _showAddDialog(context);
        },
      ),
    );
  }

  // Dialog to Add Client/Supplier
  void _showAddDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add ${showClients ? 'Client' : 'Supplier'}"),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "Enter name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (showClients) {
                    clients.add(nameController.text);
                  } else {
                    suppliers.add(nameController.text);
                  }
                });
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
