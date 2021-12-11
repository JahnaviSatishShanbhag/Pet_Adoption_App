import 'package:flutter/material.dart';

import './screens/auth_screen.dart';
import './screens/category_animals_screen.dart';
import './screens/home_screen.dart';
import './screens/pet_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<int, Color> color = {
    50: const Color.fromRGBO(255, 241, 175, .1),
    100: const Color.fromRGBO(255, 241, 175, .2),
    200: const Color.fromRGBO(255, 241, 175, .3),
    300: const Color.fromRGBO(255, 241, 175, .4),
    400: const Color.fromRGBO(255, 241, 175, .5),
    500: const Color.fromRGBO(255, 241, 175, .6),
    600: const Color.fromRGBO(255, 241, 175, .7),
    700: const Color.fromRGBO(255, 241, 175, .8),
    800: const Color.fromRGBO(255, 241, 175, .9),
    900: const Color.fromRGBO(255, 241, 175, 1),
  };

  @override
  Widget build(BuildContext context) {
    // int argbColor = Color.argb(255, 118, 118, 188);
    MaterialColor colorCustom = MaterialColor(0xFFFFF1AF, color);

    return MaterialApp(
      title: 'Pet adoption app',
      theme: ThemeData(
        primarySwatch: colorCustom,
        accentColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
        CategoryAnimalsScreen.routeName: (context) => CategoryAnimalsScreen(),
        PetScreen.routeName: (context) => PetScreen(),
      },
    );
  }
}
