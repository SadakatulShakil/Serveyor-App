import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serveyor_app/View/Screen/Dashboard/Profile/EditProfileScreen.dart';

import '../../Login/LoginScreen.dart';
import 'ChangePasswordScreen.dart';

class AccountSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings', style: GoogleFonts.mulish(),),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 16.0, top: 16.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              // Add your onPressed code here!
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            backgroundColor: Colors.redAccent,
            label: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.white,),
                    SizedBox(width: 20),
                    Text('Logout', style: GoogleFonts.mulish(color: Colors.white, fontSize: 17),),
                  ],
                )),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView(
          children: [
            SettingsListTile(
              icon: Icons.person_outline,
              title: 'Personal Information',
              onTap: () {
                // Navigate to Personal Information page
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
            SettingsListTile(
              icon: Icons.lock_open,
              title: 'Change Password',
              onTap: () {
                // Navigate to Personal Information page
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              },
            ),
            SettingsListTile(
              icon: Icons.security_outlined,
              title: 'Privacy Policy',
              onTap: () {
                // Navigate to Personal Information page
              },
            ),
            SettingsListTile(
              icon: Icons.info_outline,
              title: 'About App',
              onTap: () {
                // Navigate to About page
              },
            ),
            SettingsListTile(
              icon: Icons.help_outline,
              title: 'Help and Support',
              onTap: () {
                // Navigate to Help and Support page
              },
            ),
            SettingsListTile(
              icon: Icons.update,
              title: 'Version 1.2',
              onTap: () {
                // Show version info or check for updates
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: GoogleFonts.mulish()),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}