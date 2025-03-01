import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Clients & Suppliers",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
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
                  : const AddSupplierScreen(),
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

// Add Supplier Screen
class AddSupplierScreen extends StatelessWidget {
  const AddSupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddEntityScreen(title: "Add Supplier");
  }
}

// Add Client Screen
class AddClientScreen extends StatelessWidget {
  const AddClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AddEntityScreen(title: "Add Client");
  }
}

// Generic Form Screen for Adding Clients or Suppliers
class AddEntityScreen extends StatefulWidget {
  final String title;
  const AddEntityScreen({super.key, required this.title});

  @override
  State<AddEntityScreen> createState() => _AddEntityScreenState();
}

class _AddEntityScreenState extends State<AddEntityScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            widget.title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection("Company Details", [
                _buildTextField(_nameController, "Company Name"),
                _buildTextField(_idController, "Business ID"),
              ]),
              const SizedBox(height: 15),
              _buildSection("Contact Information", [
                _buildTextField(_contactController, "Contact Number"),
                _buildTextField(_emailController, "Email"),
                _buildTextField(_addressController, "Billing Address",
                    maxLines: 3),
              ]),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              String name = _nameController.text.trim();
              if (name.isNotEmpty) {
                Navigator.pop(context, name);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Company Name is required")),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal[900],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              "Save",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.poppins(fontSize: 14),
        ),
      ),
    );
  }
}
