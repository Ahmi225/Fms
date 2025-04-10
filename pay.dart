import 'package:app/parts/infowidget.dart';
import 'package:app/addpay.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayScreenState();
}

class _PayScreenState extends State<Pay> {
  bool showClients = true;
  List<String> all = [];
  List<String> rec = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Payments'),
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
            child: all.isEmpty && rec.isEmpty
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
                    itemCount: showClients ? all.length : rec.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          showClients ? all[index] : rec[index],
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
                all.add(newEntry);
              } else {
                rec.add(newEntry);
              }
            });
          }
        },
      ),
    );
  }
}
