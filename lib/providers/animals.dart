import 'package:flutter/foundation.dart';

import '../models/animal_in_category.dart';

class Animals with ChangeNotifier {
  final List<Animal> _pets = [
    Animal(
      id: 'a1',
      category: 'c1',
      name: 'name1',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a2',
      category: 'c1',
      name: 'name2',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a3',
      category: 'c1',
      name: 'name3',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a4',
      category: 'c1',
      name: 'name4',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a5',
      category: 'c2',
      name: 'name5',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a6',
      category: 'c2',
      name: 'name6',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a7',
      category: 'c2',
      name: 'name7',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a8',
      category: 'c2',
      name: 'name8',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a9',
      category: 'c3',
      name: 'name9',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a10',
      category: 'c3',
      name: 'name10',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a11',
      category: 'c3',
      name: 'name11',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a12',
      category: 'c3',
      name: 'name12',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a13',
      category: 'c4',
      name: 'name13',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a14',
      category: 'c4',
      name: 'name14',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a15',
      category: 'c4',
      name: 'name15',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a16',
      category: 'c4',
      name: 'name16',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a17',
      category: 'c5',
      name: 'name17',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a18',
      category: 'c5',
      name: 'name18',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a19',
      category: 'c5',
      name: 'name19',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a20',
      category: 'c5',
      name: 'name20',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a21',
      category: 'c6',
      name: 'name21',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a22',
      category: 'c6',
      name: 'name22',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a23',
      category: 'c6',
      name: 'name23',
      description: 'soething',
      imageUrl: '',
    ),
    Animal(
      id: 'a24',
      category: 'c6',
      name: 'name24',
      description: 'soething',
      imageUrl: '',
    ),
  ];

  List<Animal> get pets {
    return _pets;
  }

  void addPet(String petCategory, String petName, String petDescription) {
    Animal newPet = Animal(
      id: 'new',
      category: petCategory,
      description: petDescription,
      imageUrl: '',
      name: petName,
    );

    _pets.add(newPet);

    notifyListeners();
  }
}
