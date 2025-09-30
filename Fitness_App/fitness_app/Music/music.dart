import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playlists = [
      {"name": "HIIT Beats", "duration": "30 min", "icon": Icons.music_note, "color": Colors.orange},
      {"name": "Yoga Calm", "duration": "45 min", "icon": Icons.music_video, "color": Colors.green},
      {"name": "Cardio Pump", "duration": "20 min", "icon": Icons.headphones, "color": Colors.red},
      {"name": "Strength Motivation", "duration": "40 min", "icon": Icons.library_music, "color": Colors.blue},
      {"name": "Cool Down", "duration": "15 min", "icon": Icons.audiotrack, "color": Colors.purple},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        title: Text(
          "Music",
          style: TextStyle(letterSpacing: 1.2, fontSize: 28, fontFamily: "Luckiest Guy"),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          final playlist = playlists[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: playlist['color'] as Color,
                radius: 30,
                child: Icon(playlist['icon'] as IconData, color: Colors.white, size: 30),
              ),
              title: Text(
                playlist['name'] as String,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${playlist['duration']}"),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
                onPressed: () {

                },
                child: Icon(Icons.play_arrow, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}