import 'dart:async';

import 'package:flutter/material.dart';
import 'package:free_api_sample_ui_main/view/home_screen/home_screen.dart';
import 'package:free_api_sample_ui_main/view/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      //shared preference  onj
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //get stored token
      String storedtoken = prefs.getString("access") ?? "";

      //check token 
      if(storedtoken.isNotEmpty){
        //have tpken- navigate to homescreen
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      }else{
        //dont have token-navigate to login screen
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          Center(child: Text('Splash Screen', style: TextStyle(fontSize: 24))),
    );
  }
}
