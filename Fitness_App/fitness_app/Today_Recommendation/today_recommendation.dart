import 'package:flutter/material.dart';

class TodayRecommendationScreen extends StatelessWidget {
  const TodayRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendations = [
      {
        "name": "HIIT Workout",
        "duration": "15 min",
        "calories": "150 cal",
        "icon": Icons.fitness_center,
        "color": Colors.orange
      },
      {
        "name": "Morning Yoga",
        "duration": "20 min",
        "calories": "100 cal",
        "icon": Icons.self_improvement,
        "color": Colors.green
      },
      {
        "name": "Cardio Blast",
        "duration": "25 min",
        "calories": "200 cal",
        "icon": Icons.directions_run,
        "color": Colors.red
      },
      {
        "name": "Strength Training",
        "duration": "30 min",
        "calories": "300 cal",
        "icon": Icons.fitness_center,
        "color": Colors.blue
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        title: Text(
          "Today's Recommendations",
          style: TextStyle(letterSpacing: 1.2, fontSize: 28, fontFamily: "Luckiest Guy"),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final rec = recommendations[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: rec['color'] as Color,
                radius: 30,
                child: Icon(rec['icon'] as IconData, color: Colors.white, size: 30),
              ),
              title: Text(rec['name'] as String, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${rec['duration']} | ${rec['calories']}"),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
                onPressed: () {

                },
                child: Text(
                  "Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Luckiest Guy",
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}