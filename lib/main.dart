import 'package:flutter/material.dart';
import 'package:pet_adoption_app/screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet adoption app',
      theme: ThemeData(
        primarySwatch: Colors.blue ,
        // accentColor:Colors.brown,
      ),
      home: AuthScreen(),
    );
  }
}
