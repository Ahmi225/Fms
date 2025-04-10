import 'package:app/parts/infowidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/addsp.dart';
import 'package:app/addcl.dart';

class ClientSupplierScreen extends StatefulWidget {
  const ClientSupplierScreen({super.key});

  @override
  State<ClientSupplierScreen> createState() => _ClientSupplierScreenState();
}

class _ClientSupplierScreenState extends State<ClientSupplierScreen> {
  bool showClients = true;
  List<String> clients = [];
  List<String> suppliers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Client & Suppliers'),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => setState(() => showClients = true),
                child: Text(
                  "Clients",
                  style: GoogleFonts.poppins(
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
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: !showClients ? Colors.teal[900] : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: showClients ? clients.length : suppliers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    showClients ? clients[index] : suppliers[index],
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                  leading: Icon(showClients ? Icons.person : Icons.business),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[900],
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () async {
          final newEntry = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => showClients
                  ? const AddClientScreen()
                  : const AddsupplierScreen(),
            ),
          );
          if (newEntry != null && newEntry is String) {
            setState(() {
              showClients ? clients.add(newEntry) : suppliers.add(newEntry);
            });
          }
        },
      ),
    );
  }
}
