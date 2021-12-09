import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/appbar_drawer.dart';
import '../models/animal_in_category.dart';

class CategoryAnimalsScreen extends StatelessWidget {
  static const routeName = '/category-animals';

  List<Animal> returnAnimalsCategorywise(Map<String, String> routeArgs) {
    List<Animal> animals = [];
    DUMMY_ANIMALS.map((animal) {
      if (animal.category == (routeArgs['id'] as String)) {
        animals.add(animal);
      }
    }).toList();
    return animals;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: Appbar(),
      drawer: MainDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(
              30,
            ),
            child: Text(
              routeArgs['title'] as String,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          ...returnAnimalsCategorywise(routeArgs)
              .map((animal) => Container(
                    margin: const EdgeInsets.all(
                      10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 3.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.brown,
                      ),
                      title: Text(
                        animal.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
