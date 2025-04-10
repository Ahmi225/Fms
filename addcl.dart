import 'package:app/parts/infowidget.dart';
import 'package:flutter/material.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _businessIdController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _billingAddressController =
      TextEditingController();
  String? selectedType; // Initially no selection

  @override
  void dispose() {
    _companyNameController.dispose();
    _businessIdController.dispose();
    _contactNumberController.dispose();
    _emailController.dispose();
    _billingAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: 'Add Client'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Company Details",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _companyNameController,
                      decoration: const InputDecoration(
                        labelText: "Company Name",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _businessIdController,
                      decoration: const InputDecoration(
                        labelText: "Business ID",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Contact Information",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _contactNumberController,
                      decoration: const InputDecoration(
                        labelText: "Contact Number",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _billingAddressController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: "Billing Address",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: 150, // مناسب چوڑائی
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                if (_companyNameController.text.isNotEmpty) {
                  // Pass the entered company name back to the previous screen
                  Navigator.pop(context, _companyNameController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Company Name is required")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
