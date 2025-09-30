import 'package:flutter/material.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meals = [
      {"name": "Breakfast - Oatmeal", "calories": "250 cal", "icon": Icons.breakfast_dining, "color": Colors.orange},
      {"name": "Snack - Fruit Bowl", "calories": "150 cal", "icon": Icons.emoji_food_beverage, "color": Colors.green},
      {"name": "Lunch - Grilled Veggies", "calories": "450 cal", "icon": Icons.lunch_dining, "color": Colors.red},
      {"name": "Dinner - Salad", "calories": "300 cal", "icon": Icons.dinner_dining, "color": Colors.blue},
      {"name": "Snack - Protein Shake", "calories": "200 cal", "icon": Icons.local_drink, "color": Colors.purple},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        title: Text(
          "Nutrition",
          style: TextStyle(letterSpacing: 1.2, fontSize: 28, fontFamily: "Luckiest Guy"),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: meal['color'] as Color,
                radius: 30,
                child: Icon(meal['icon'] as IconData, color: Colors.white, size: 30),
              ),
              title: Text(meal['name'] as String, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${meal['calories']}"),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
                onPressed: () {},
                child: Text(
                  "View",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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