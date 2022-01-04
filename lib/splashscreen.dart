import 'package:flutter/material.dart';
import 'package:pet_adoption_app/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 100), () {
      print("After 3 seconds");

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyApp()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "hello"),
          ),
        ],
      ),
    );
  }
}
