import 'package:flutter/material.dart';

import '../screens/category_animals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color colour;
  final String image;

  CategoryItem(
    this.id,
    this.title,
    this.colour,
    this.image,
  );

  void _selectCategory(BuildContext context) {
    Navigator.of(context)
        .pushNamed(CategoryAnimalsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectCategory(context);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15,
            ),
            image:  DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/"+image+".jpg"))),
      ),
    );
  }
}
