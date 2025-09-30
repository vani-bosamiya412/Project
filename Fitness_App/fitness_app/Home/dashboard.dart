import 'package:fitness_app/Activities/activities.dart';
import 'package:fitness_app/Music/music.dart';
import 'package:fitness_app/Today_Recommendation/today_recommendation.dart';
import 'package:flutter/material.dart';

import '../Nutrition/nutrition.dart';
import '../Progress/progress.dart';
import '../Trainer/trainer.dart';
import '../Workouts/workout.dart';

class FitnessDashboard extends StatelessWidget {
  const FitnessDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        title: Text("Home", style: TextStyle(letterSpacing: 1.2, fontSize: 30, fontFamily: "Luckiest Guy"),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            Text(
              "Welcome To FitTrack",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text("Ready for your workout today?"),

            SizedBox(height: 20),

            // Quick Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard("Calories", "250", Icons.local_fire_department,),
                _buildStatCard("Steps", "1,200", Icons.directions_walk),
                _buildStatCard("Workout", "45 min", Icons.fitness_center),
              ],
            ),

            SizedBox(height: 20),

            // Features Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 1.2,
              children: [
                _buildFeatureCard("Workouts", Icons.fitness_center, Colors.orange, context),
                _buildFeatureCard("Nutrition", Icons.restaurant, Colors.green, context),
                _buildFeatureCard("Progress", Icons.bar_chart, Colors.blue, context),
                _buildFeatureCard("Music", Icons.music_note, Colors.purple, context),
                _buildFeatureCard("Trainer", Icons.person, Colors.red, context),
                _buildFeatureCard("Activities", Icons.directions_bike, Colors.teal, context),
              ],
            ),

            SizedBox(height: 20),

            // Recommendation
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Icon(Icons.fitness_center, size: 40, color: Colors.pinkAccent),
                title: Text("Today’s Recommendation"),
                subtitle: Text("Try 15 min HIIT workout today"),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TodayRecommendationScreen()));
                  },
                  child: Text("Start"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: Colors.pinkAccent, size: 30),
            SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(String title, IconData icon, Color color, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          if (title == "Workouts") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutScreen()),);
          } else if (title == "Nutrition") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NutritionScreen()),);
          } else if (title == "Progress") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProgressScreen()),);
          } else if (title == "Music") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MusicScreen()),);
          } else if (title == "Trainer") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TrainerScreen()),);
          } else if (title == "Activities") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ActivitiesScreen()),);
          }
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: color),
              SizedBox(height: 8),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}