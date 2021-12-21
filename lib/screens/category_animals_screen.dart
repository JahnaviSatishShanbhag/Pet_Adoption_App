import 'package:flutter/material.dart';
import 'package:pet_adoption_app/screens/pet_screen.dart';
// import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/appbar_drawer.dart';
import '../screens/petdesc.dart';
// import '../models/animal_in_category.dart';
// import '../providers/animals.dart';

class CategoryAnimalsScreen extends StatelessWidget {
  static const routeName = '/category-animals';

  // List<Animal> returnAnimalsCategorywise(
  //     Map<String, String> routeArgs, List<Animal> pets) {
  //   List<Animal> animals = [];
  //   pets.map((animal) {
  //     if (animal.category == (routeArgs['id'] as String)) {
  //       animals.add(animal);
  //     }
  //   }).toList();
  //   return animals;
  // }

  void _showDescriptionPage(BuildContext context,String id)
  {
    Navigator.of(context).pushNamed(PetDesc.routeName,arguments: {'pet_id':id});
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // final animalData = Provider.of<Animals>(context);

    return Scaffold(
      appBar: Appbar(),
      drawer: MainDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
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
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('pets_in_category')
                    .where('category',isEqualTo: routeArgs['id'])
                    .snapshots(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final petDocs =
                        (snapshot.data as QuerySnapshot<Map<String, dynamic>>)
                            .docs;
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: petDocs.length,
                        itemBuilder: (ctx, index) {
                          return InkWell(
                            onTap: () {
                              _showDescriptionPage(context,petDocs[index].id);
                            },
                            child: Container(
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
                                  petDocs[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
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
    );
  }
}
