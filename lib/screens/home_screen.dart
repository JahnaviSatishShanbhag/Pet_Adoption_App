import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

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
        body: GridView(
          padding: const EdgeInsets.all(
            25,
          ),
          children: [
            ...DUMMY_ANIMALS
                .map((category) =>
                    CategoryItem(category.id, category.title, category.color))
                .toList()
          ],
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2,
          ),
        ),
      ),
    );
  }
}
