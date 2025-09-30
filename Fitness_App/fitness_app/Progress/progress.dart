import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progressStats = [
      {"title": "Workouts Completed", "value": "12", "icon": Icons.fitness_center, "color": Colors.orange},
      {"title": "Calories Burned", "value": "3,500 cal", "icon": Icons.local_fire_department, "color": Colors.red},
      {"title": "Steps Taken", "value": "25,000", "icon": Icons.directions_walk, "color": Colors.green},
      {"title": "Hours Trained", "value": "8 hrs", "icon": Icons.access_time, "color": Colors.blue},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        title: Text(
          "Progress",
          style: TextStyle(letterSpacing: 1.2, fontSize: 28, fontFamily: "Luckiest Guy"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: progressStats.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final stat = progressStats[index];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(stat['icon'] as IconData, color: stat['color'] as Color, size: 40),
                    SizedBox(height: 12),
                    Text(
                      stat['value'] as String,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      stat['title'] as String,
                      style: TextStyle(color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}