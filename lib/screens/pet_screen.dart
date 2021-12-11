import 'package:flutter/material.dart';
import 'package:pet_adoption_app/widgets/appbar_drawer.dart';

import '../widgets/pet_form.dart';

class PetScreen extends StatefulWidget {
  static const routeName='/pet-screen';

  @override
  _PetScreenState createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {

  @override
  Widget build(BuildContext context) {
    Map<String,String> routeArgs=ModalRoute.of(context)!.settings.arguments as Map<String,String> ;

    return Scaffold(
      appBar: Appbar(),
      backgroundColor: Theme.of(context).primaryColor,
      body: PetForm(routeArgs['categoryId'] as String),
    );
  }
}