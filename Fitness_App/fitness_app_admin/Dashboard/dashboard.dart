import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login/login.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("isLoggedIn");

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AdminLoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Dashboard", style: TextStyle(letterSpacing: 1.2, fontSize: 30, fontFamily: "Luckiest Guy"),
        ),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildDashboardCard(
            context,
            Icons.people,
            "Users",
            Colors.blueAccent,
                () {
              // Navigate to User Management Screen
              // Navigator.push(context, MaterialPageRoute(builder: (_) => UserManagementScreen()));
            },
          ),
          _buildDashboardCard(
            context,
            Icons.fitness_center,
            "Workouts",
            Colors.green,
                () {
              // Navigate to Workout Management Screen
            },
          ),
          _buildDashboardCard(
            context,
            Icons.restaurant_menu,
            "Nutrition",
            Colors.orange,
                () {
              // Navigate to Nutrition Management Screen
            },
          ),
          _buildDashboardCard(
            context,
            Icons.person,
            "Trainers",
            Colors.purple,
                () {
              // Navigate to Trainer Management Screen
            },
          ),
          _buildDashboardCard(
            context,
            Icons.notifications,
            "Notifications",
            Colors.redAccent,
                () {
              // Navigate to Notifications Management Screen
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, IconData icon, String title,
      Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color.withOpacity(0.1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}