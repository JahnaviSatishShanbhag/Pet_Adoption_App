import 'package:flutter/material.dart';

import '../screens/category_animals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color colour;

  CategoryItem(
    this.id,
    this.title,
    this.colour,
  );

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryAnimalsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectCategory(context);
      },
      child: Container(
        child: Center(
            child: Text(title,
                style: const TextStyle(
                  fontSize: 20,
                ))),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          color: colour,
        ),
      ),
    );
  }
}