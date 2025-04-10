import 'package:app/parts/infowidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/addin.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final List<Map<String, String>> _invoices = [];

  void _addInvoice() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddInvoiceScreen()),
    );

    if (result != null) {
      setState(() {
        _invoices.add(result);
      });
    }
  }

  void _deleteInvoice(int index) {
    setState(() {
      _invoices.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: 'Invoices'),
        body: _invoices.isEmpty
            ? Center(
                child: Text(
                  "No invoices available yet.",
                  style: GoogleFonts.poppins(),
                ),
              )
            : ListView.builder(
                itemCount: _invoices.length,
                itemBuilder: (context, index) {
                  final invoice = _invoices[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        "Invoice Number: ${invoice['invoiceNumber']}",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Amount: ${invoice['amount']}",
                        style: GoogleFonts.poppins(),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.black),
                        onPressed: () => _deleteInvoice(index),
                      ),
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal[900],
          foregroundColor: Colors.white,
          onPressed: _addInvoice,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
