import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Pet Adoption'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                'Pet Adoption',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Categories'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Create an Account'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Log Out'),
            ),
          ],
        ),
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
                  child: const Image(
                      image: AssetImage('assets/pup.jpg'),
                      height: 150,
                      fit: BoxFit.fill),
                ),
                Container(
                  child: const Image(
                      image: AssetImage('assets/catto.jpg'),
                      height: 150,
                      fit: BoxFit.fill),
                ),
                Container(
                  child: const Image(
                      image: AssetImage('assets/birds.jpg'),
                      height: 150,
                      fit: BoxFit.fill),
                ),
                Container(
                  child: const Image(
                      image: AssetImage('assets/rabbit.jpg'),
                      height: 150,
                      fit: BoxFit.fill),
                ),
                Container(
                  child: const Image(
                      image: AssetImage('assets/fish.jpg'),
                      height: 150,
                      fit: BoxFit.fill),
                ),
                Container(
                  child: const Image(
                      image: AssetImage('assets/pup.jpg'),
                      height: 150,
                      fit: BoxFit.fill),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
