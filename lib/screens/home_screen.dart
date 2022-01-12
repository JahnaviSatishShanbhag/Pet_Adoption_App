import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';
import '../widgets/appbar_drawer.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar(),
        drawer: MainDrawer(),
        body: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 65,
              ),
              Padding(
                padding: const EdgeInsets.all(
                  10,
                ),
                
                child: GridView(
                  shrinkWrap: true,
                  children: [
                    
                    ...DUMMY_ANIMALS_CATEGORY
                        .map((category) => CategoryItem(
                            category.id, category.title, category.color,category.img))
                        .toList()
                  ],
                  
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.4,
                  ),
                ),
              ),
            ],
          ),
          
        backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
