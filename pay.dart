import 'package:app/payscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayScreenState();
}

class _PayScreenState extends State<Pay> {
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
          "Payments",
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
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => setState(() => showClients = true),
                child: Text(
                  "All",
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: showClients ? Colors.teal[900] : Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => setState(() => showClients = false),
                child: Text(
                  "Received In",
                  style: GoogleFonts.roboto(
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
            child: clients.isEmpty && suppliers.isEmpty
                ? Center(
                    child: Text(
                      "No payments found",
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: showClients ? clients.length : suppliers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          showClients ? clients[index] : suppliers[index],
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        leading: Icon(
                          showClients ? Icons.person : Icons.business,
                          color: Colors.teal[900],
                        ),
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
            MaterialPageRoute(builder: (context) => const PaymentScreen()),
          );

          if (newEntry != null && newEntry is String) {
            setState(() {
              if (showClients) {
                clients.add(newEntry);
              } else {
                suppliers.add(newEntry);
              }
            });
          }
        },
      ),
    );
  }
}
