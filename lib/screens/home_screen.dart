import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        // title: const Text(
        //   'Pet Adoption',
        //   style: TextStyle(
        //     color: Colors.white,
        //   ),
        // ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // const DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.brown,
            //   ),
            //   child: Text(
            //     'Pet Adoption',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 24,
            //     ),
            //   ),
            // ),
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.brown,
              padding: const EdgeInsets.all(
                20,
              ),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Pet Adoption',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTile(
              leading: Icon(Icons.message),
              title: Text('Categories'),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Create an Account'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Log Out'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(
              10,
            ),
            child: GridView(
              shrinkWrap: true,
              children: [
                ...DUMMY_ANIMALS
                    .map((category) => CategoryItem(
                        category.id, category.title, category.color))
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
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
