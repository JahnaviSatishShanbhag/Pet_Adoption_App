import 'package:flutter/material.dart';

class PetForm extends StatefulWidget {
  @override
  _PetFormState createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Pet\'s Name',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter the name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Location',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter your location';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'About the pet';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Breed',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter the breed';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Age',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter the age of your pet';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
