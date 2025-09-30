import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workouts = [
      {"name": "HIIT", "duration": "15 min", "calories": "150 cal", "icon": Icons.fitness_center, "color": Colors.orange},
      {"name": "Yoga", "duration": "30 min", "calories": "120 cal", "icon": Icons.self_improvement, "color": Colors.green},
      {"name": "Cardio", "duration": "20 min", "calories": "200 cal", "icon": Icons.directions_run, "color": Colors.red},
      {"name": "Strength", "duration": "45 min", "calories": "350 cal", "icon": Icons.fitness_center, "color": Colors.blue},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        title: Text(
          "Workouts",
          style: TextStyle(letterSpacing: 1.2, fontSize: 28, fontFamily: "Luckiest Guy"),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: workout['color'] as Color,
                radius: 30,
                child: Icon(workout['icon'] as IconData, color: Colors.white, size: 30),
              ),
              title: Text(workout['name'] as String, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${workout['duration']} | ${workout['calories']}"),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
                onPressed: () {},
                child: Text("Start", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Luckiest Guy", letterSpacing: 1),),
              ),
            ),
          );
        },
      ),
    );
  }
}