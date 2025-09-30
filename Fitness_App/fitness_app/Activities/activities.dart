import 'package:flutter/material.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {"name": "Running", "duration": "5 km", "icon": Icons.directions_run, "color": Colors.orange},
      {"name": "Cycling", "duration": "10 km", "icon": Icons.directions_bike, "color": Colors.green},
      {"name": "Swimming", "duration": "30 min", "icon": Icons.pool, "color": Colors.blue},
      {"name": "Hiking", "duration": "8 km", "icon": Icons.terrain, "color": Colors.red},
      {"name": "Rowing", "duration": "20 min", "icon": Icons.rowing, "color": Colors.purple},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        title: Text(
          "Activities",
          style: TextStyle(letterSpacing: 1.2, fontSize: 28, fontFamily: "Luckiest Guy"),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: activity['color'] as Color,
                radius: 30,
                child: Icon(activity['icon'] as IconData, color: Colors.white, size: 30),
              ),
              title: Text(activity['name'] as String, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Duration/Distance: ${activity['duration']}"),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
                onPressed: () {

                },
                child: Text(
                  "View",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Luckiest Guy", letterSpacing: 1,),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}