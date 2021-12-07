import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // title: const Text("Home"),
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.brown,
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle_sharp),
              onPressed: () {},
            ),
          ],
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
