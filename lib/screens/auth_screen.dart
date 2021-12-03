import 'package:flutter/material.dart';

import '../widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(79,121,66,0.6),
      body:AuthForm(),
    );
  }
}