import 'dart:async';

import 'package:fitness_app_admin/Dashboard/dashboard.dart';
import 'package:fitness_app_admin/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFDF9),
      body: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }

  void _navigateNext() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

    await Future.delayed(Duration(seconds: 3));

    if(isLoggedIn) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminLoginScreen()));
    }
  }
}
