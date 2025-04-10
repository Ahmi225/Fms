import 'package:app/parts/infowidget.dart';
import 'package:flutter/material.dart';

class AddsupplierScreen extends StatefulWidget {
  const AddsupplierScreen({super.key});

  @override
  State<AddsupplierScreen> createState() => _AddsupplierScreenState();
}

class _AddsupplierScreenState extends State<AddsupplierScreen> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _businessIdController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _billingAddressController =
      TextEditingController();

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
        appBar: CustomAppBar(title: 'Add Supplier'),
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
          child: ElevatedButton(
            onPressed: () {
              String newSupplier = _companyNameController.text.trim();
              if (newSupplier.isNotEmpty) {
                Navigator.pop(context, newSupplier); // Pass data back
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
    );
  }
}
