import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(40),
            sliver: SliverGrid.count(
              crossAxisSpacing: 30,
              mainAxisSpacing: 50,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text("Dogs"),
                  color: Colors.green[100],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Cats'),
                  color: Colors.green[200],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Rabbits'),
                  color: Colors.green[300],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Birds'),
                  color: Colors.green[400],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Aquatic animals'),
                  color: Colors.green[500],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text('Others'),
                  color: Colors.green[600],
                ),
              ],
            ),
          ),
        ],
      ),
      ));
  }
}
