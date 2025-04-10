import 'package:app/parts/infowidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddInvoiceScreen extends StatefulWidget {
  const AddInvoiceScreen({super.key});

  @override
  State<AddInvoiceScreen> createState() => _AddInvoiceScreenState();
}

class _AddInvoiceScreenState extends State<AddInvoiceScreen> {
  final TextEditingController _invoiceNumberController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _invoiceType = "Pending";
  final List<String> _invoiceTypes = ["Paid", "Pending", "Overdue"];

  @override
  void dispose() {
    _invoiceNumberController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Add Invoice'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _invoiceNumberController,
                decoration: InputDecoration(
                  labelText: "Invoice Number",
                  labelStyle: GoogleFonts.poppins(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter invoice number" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Amount",
                  labelStyle: GoogleFonts.poppins(),
                ),
                validator: (value) => value!.isEmpty ? "Enter amount" : null,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                value: _invoiceType,
                decoration: InputDecoration(
                  labelText: "Invoice Type",
                  labelStyle: GoogleFonts.poppins(),
                ),
                items: _invoiceTypes
                    .map((item) =>
                        DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (value) => setState(() => _invoiceType = value!),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Select Date",
                  labelStyle: GoogleFonts.poppins(),
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() => _dateController.text =
                        pickedDate.toLocal().toString().split(' ')[0]);
                  }
                },
                validator: (value) => value!.isEmpty ? "Select a date" : null,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, {
                        "invoiceNumber": _invoiceNumberController.text.trim(),
                        "amount": _amountController.text.trim(),
                        "invoiceType": _invoiceType,
                        "date": _dateController.text.trim(),
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Save Invoice",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
