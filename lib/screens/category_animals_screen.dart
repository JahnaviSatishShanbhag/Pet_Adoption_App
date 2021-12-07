import 'package:flutter/material.dart';

class CategoryAnimalsScreen extends StatelessWidget {

  static const routeName='/category-animals';

  @override
  Widget build(BuildContext context) {
    // Map<String,String> routeArgs=ModalRoute.of(context)!.settings.arguments as Map<String,String>;

    return Scaffold(
      appBar: AppBar(
        title:const Text("routeArgs['title'] as String"),
      ),
      body:Container(),
    );
  }
}