import 'package:fitness_app/Login/login.dart';
import 'package:fitness_app/Intro/Start/onboarding_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/splash_screen.jpg"),
          Container(color: Colors.black.withValues(alpha: 0.5),),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("FIT-TRACK", style: TextStyle(fontSize: 35, fontFamily: "Luckiest Guy", fontWeight: FontWeight.bold, color: Colors.grey[800], letterSpacing: 1.5, fontStyle: FontStyle.italic),),
                SizedBox(height: 15,),
                Text("Your Goals.\nYour Fit-Track.", style: TextStyle(fontSize: 40, fontFamily: "Luckiest Guy", letterSpacing: 1.5, color: Colors.white.withValues(alpha: 0.9), height: 1.2, fontStyle: FontStyle.italic),),
                SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
                    },
                    child: Text("START", style: TextStyle(fontSize: 20, fontFamily: "Luckiest Guy", letterSpacing: 1.5, color: Colors.white, fontStyle: FontStyle.italic),),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Text("Log In", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.grey[900], fontStyle: FontStyle.italic),),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          )
        ],
      ),
    );
  }
}