import 'package:app/parts/infowidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app/addprod.dart';

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
      appBar: CustomAppBar(title: 'Products'),
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
