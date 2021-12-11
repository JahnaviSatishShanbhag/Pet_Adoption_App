import 'package:flutter/material.dart';
import 'package:pet_adoption_app/screens/pet_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/appbar_drawer.dart';
import '../models/animal_in_category.dart';
import '../providers/animals.dart';
import '../providers/animals.dart';

class CategoryAnimalsScreen extends StatelessWidget {
  static const routeName = '/category-animals';

  List<Animal> returnAnimalsCategorywise(
      Map<String, String> routeArgs, List<Animal> pets) {
    List<Animal> animals = [];
    pets.map((animal) {
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
    final animalData = Provider.of<Animals>(context);

    return Scaffold(
      appBar: Appbar(),
      drawer: MainDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
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
            ...returnAnimalsCategorywise(routeArgs, animalData.pets)
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
            RaisedButton(
                child: const Text('Add'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(PetScreen.routeName, arguments: {
                    'categoryId': routeArgs['id'] as String,
                  });
                }),
          ],
        ),
      ),
    );
  }
}
