import 'package:app/parts/infowidget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class AddprodScreen extends StatefulWidget {
  const AddprodScreen({super.key});

  @override
  State<AddprodScreen> createState() => _AddprodScreenState();
}

class _AddprodScreenState extends State<AddprodScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _saleRateController = TextEditingController();
  final TextEditingController _purchaseRateController = TextEditingController();
  final TextEditingController _openingStockController = TextEditingController();
  String _selectedDate = "Opening Stock Date";

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: 'Add Product'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(_nameController, "Product Name"),
              _buildTextField(_productCodeController, "Product Code"),
              _buildTextField(_saleRateController, "Sale Rate", isNumber: true),
              _buildTextField(_purchaseRateController, "Purchase Rate",
                  isNumber: true),
              _buildTextField(_openingStockController, "Opening Stock",
                  isNumber: true),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedDate,
                    style: GoogleFonts.montserrat(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.teal),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              if (_nameController.text.trim().isEmpty ||
                  _productCodeController.text.trim().isEmpty) {
                return;
              }
              Navigator.pop(context, {
                'name': _nameController.text.trim(),
                'code': _productCodeController.text.trim(),
                'saleRate': _saleRateController.text.trim(),
                'purchaseRate': _purchaseRateController.text.trim(),
                'openingStock': _openingStockController.text.trim(),
                'date': _selectedDate,
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Save",
              style: GoogleFonts.poppins(
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

  Widget _buildTextField(TextEditingController controller, String label,
      {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.roboto(fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
