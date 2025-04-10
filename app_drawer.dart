import 'package:app/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Ahmed",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              "ahmiuet22@gmail.com",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/form.png"),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/loom.png"), // Background image
                fit: BoxFit.cover, // Covers the entire header
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle, color: Colors.teal[900]),
                  title: Text(
                    "Profile",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[900],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.teal[900]),
                  title: Text(
                    "Settings",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[900],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/settings");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help, color: Colors.teal[900]),
                  title: Text(
                    "Help & Support",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[900],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/help");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info, color: Colors.teal[900]),
                  title: Text(
                    "About App",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[900],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/about");
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.red),
                  title: Text(
                    "Logout",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/logout");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
