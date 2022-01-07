import 'package:flutter/material.dart';

import 'models/animal_category.dart';
// ignore: unused_import
import 'models/animal_in_category.dart';

// ignore: non_constant_identifier_names
List<AnimalCategory> DUMMY_ANIMALS_CATEGORY = [
  AnimalCategory(
    id: 'c1',
    title: 'Dogs',
    color: Colors.green[100] as Color,
    img:'pup',
  ),
  AnimalCategory(
    id: 'c2',
    title: 'Cats',
    color: Colors.green[200] as Color,
    img:'catto'
  ),
  AnimalCategory(
    id: 'c3',
    title: 'Rabbits',
    color: Colors.green[300] as Color,
    img:'rabbit'
  ),
  AnimalCategory(
    id: 'c4',
    title: 'Birds',
    color: Colors.green[400] as Color,
    img:'birds'
  ),
  AnimalCategory(
    id: 'c5',
    title: 'Aquatic animals',
    color: Colors.green[500] as Color,
    img:'fish'
  ),
  AnimalCategory(
    id: 'c6',
    title: 'Others',
    color: Colors.green[600] as Color,
    img:'others'
  ),
];