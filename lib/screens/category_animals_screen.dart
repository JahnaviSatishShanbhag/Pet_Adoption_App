import 'package:flutter/material.dart';

import '../widgets/appbar_drawer.dart';

class CategoryAnimalsScreen extends StatelessWidget {
  static const routeName = '/category-animals';

  @override
  Widget build(BuildContext context) {
    Map<String, String> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: Appbar(),
      drawer: MainDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text(routeArgs['title'] as String),
      ),
    );
  }
}
