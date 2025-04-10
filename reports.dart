import 'package:app/parts/infowidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final Map<String, List<String>> reportCategories = {
    "Sales": [
      "Sale / Purchase / Payment Report",
      "Gross & Net Sale Payment Report",
      "Overall Sales Report",
    ],
    "Purchase": [
      "Sale / Purchase / Payment Report",
      "Gross & Net Purchase Payment Report",
      "Overall Purchase Report",
    ],
  };

  final Set<String> expandedCategories = {}; // Store expanded sections

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Reports'),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: reportCategories.entries.map((entry) {
          return _buildReportSection(entry.key, entry.value);
        }).toList(),
      ),
    );
  }

  Widget _buildReportSection(String title, List<String> reports) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        initiallyExpanded: expandedCategories.contains(title),
        onExpansionChanged: (expanded) {
          setState(() {
            if (expanded) {
              expandedCategories.add(title);
            } else {
              expandedCategories.remove(title);
            }
          });
        },
        title: Text(
          title.toUpperCase(),
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),
        children: reports.map((report) => _buildReportTile(report)).toList(),
      ),
    );
  }

  Widget _buildReportTile(String reportName) {
    return ListTile(
      title: Text(
        reportName,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReportDetailsScreen(reportTitle: reportName),
          ),
        );
      },
    );
  }
}

class ReportDetailsScreen extends StatelessWidget {
  final String reportTitle;

  const ReportDetailsScreen({super.key, required this.reportTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: reportTitle),
      body: Center(
        child: Text(
          "Detailed report for: $reportTitle",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
