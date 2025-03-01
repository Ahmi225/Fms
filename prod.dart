import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProductScreen(),
  ));
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Map<String, String>> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Products",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Divider(),
          Expanded(
            child: products.isEmpty
                ? Center(
                    child: Text(
                      "No products available",
                      style: GoogleFonts.lato(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          products[index]['name']!,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          "Code: ${products[index]['code']}",
                          style: GoogleFonts.montserrat(fontSize: 14),
                        ),
                        leading: const Icon(Icons.shopping_cart),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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
          final newProduct = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddprodScreen()),
          );

          if (newProduct != null) {
            setState(() {
              products.add(newProduct);
            });
          }
        },
      ),
    );
  }
}

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
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: Text(
            "Add Product",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
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
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: Text(
              "Save",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
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
