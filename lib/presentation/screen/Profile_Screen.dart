
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text('Profile'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60,),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile_image.png'), // Add your image asset
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Mahin',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'App developer',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              _buildMenuItem(context, Icons.edit, 'Edit Profile', () {
                // Navigate to edit profile screen
              }),
              _buildMenuItem(context, Icons.history, 'Order History', () {
                // Navigate to order history screen
              }),
              _buildMenuItem(context, Icons.notifications, 'Notifications', () {
                // Navigate to notifications screen
              }),
              _buildMenuItem(context, Icons.local_shipping, 'Pick Up Information', () {
                // Navigate to pick up information screen
              }),
              _buildMenuItem(context, Icons.account_balance, 'Bank Account Information', () {
                // Navigate to bank account information screen
              }),
              _buildMenuItem(context, Icons.mobile_friendly, 'Mobile Financial Accounts', () {
                // Navigate to mobile financial accounts screen
              }),
              _buildMenuItem(context, Icons.security, 'Privacy & Security', () {
                // Navigate to privacy & security screen
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.indigo), // Icon added here
        title: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}