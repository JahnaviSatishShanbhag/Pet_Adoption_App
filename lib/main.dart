import 'package:flutter/material.dart';
import 'package:pet_adoption_app/screens/petdesc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './screens/auth_screen.dart';
import './screens/category_animals_screen.dart';
import './screens/home_screen.dart';
import './screens/pet_screen.dart';
import './screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return HomeScreen();
          }
          else
          {
            return AuthScreen();
          }
        },
      ),
      routes: {
        CategoryAnimalsScreen.routeName: (context) => CategoryAnimalsScreen(),
        PetScreen.routeName: (context) => PetScreen(),
        PetDesc.routeName: (context) => PetDesc(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}
