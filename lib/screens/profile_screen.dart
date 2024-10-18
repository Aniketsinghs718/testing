import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher
import 'login_screen.dart'; // Import your LoginScreen

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // User Avatar as an Icon
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blueAccent,
              child: Icon(
                Icons.person,
                size: 55,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            // User Name
            Text(
              'Aniket Singh',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // User Email
            Text(
              'Aniket718@ex.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 32),
            // Settings List
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(Icons.edit, 'Edit Profile', () {
                    // Navigate to edit profile screen
                  }),
                  _buildListTile(Icons.lock, 'Change Password', () {
                    // Navigate to change password screen
                  }),
                  _buildListTile(Icons.notifications, 'Notifications', () {
                    // Navigate to notifications settings screen
                  }),
                  _buildListTile(Icons.help, 'Help & Support', () {
                    _callSupport(); // Call the support function
                  }),
                  _buildListTile(Icons.logout, 'Log Out', () {
                    _logout(context); // Call the logout function
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title),
      onTap: onTap,
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
    );
  }

  void _callSupport() async {
    const phoneNumber = '8263042688';
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  void _logout(BuildContext context) {
    // Perform any logout operations here (e.g., clearing user data)

    // Navigate back to the login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LoginScreen()), // Ensure you have the LoginScreen
      (Route<dynamic> route) => false, // Remove all previous routes
    );
  }
}
