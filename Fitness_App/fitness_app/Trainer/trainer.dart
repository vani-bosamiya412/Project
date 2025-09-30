import 'package:flutter/material.dart';

class TrainerScreen extends StatelessWidget {
  const TrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trainers = [
      {"name": "Alex Johnson", "specialty": "HIIT & Cardio", "icon": Icons.person, "color": Colors.orange},
      {"name": "Sophia Lee", "specialty": "Yoga & Meditation", "icon": Icons.self_improvement, "color": Colors.green},
      {"name": "Michael Smith", "specialty": "Strength Training", "icon": Icons.fitness_center, "color": Colors.red},
      {"name": "Emma Davis", "specialty": "Pilates & Stretching", "icon": Icons.accessibility_new, "color": Colors.blue},
      {"name": "Daniel Brown", "specialty": "Functional Training", "icon": Icons.sports_handball, "color": Colors.purple},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        title: Text(
          "Trainers",
          style: TextStyle(letterSpacing: 1.2, fontSize: 28, fontFamily: "Luckiest Guy"),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: trainers.length,
        itemBuilder: (context, index) {
          final trainer = trainers[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: trainer['color'] as Color,
                radius: 30,
                child: Icon(trainer['icon'] as IconData, color: Colors.white, size: 30),
              ),
              title: Text(trainer['name'] as String, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(trainer['specialty'] as String),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
                onPressed: () {

                },
                child: Text(
                  "Contact",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Luckiest Guy",
                    letterSpacing: 1,),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}