import 'package:flutter/material.dart';

class PetForm extends StatefulWidget {

  @override
  _PetFormState createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _name;
  late String _location;
  late String _description;
  late String _breed;
  late String _age;

  void _submitForm()
  {
    bool _isValid=_formKey.currentState!.validate();
    if (_isValid)
    {
      _formKey.currentState!.save();
      print(_name);
      print(_location);
      print(_description);
      print(_breed);
      print(_age);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      key: _formKey,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Pet\'s Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter the name';
              }
              return null;
            },
            onSaved: (value) {
              _name=value as String;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Location',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your location';
              }
              return null;
            },
            onSaved: (value) {
              _location=value as String;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Description',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'About the pet';
              }
              return null;
            },
            onSaved: (value) {
              _description=value as String;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Breed',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter the breed';
              }
              return null;
            },
            onSaved: (value) {
              _breed=value as String;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Age',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter the age of your pet';
              }
              return null;
            },
            onSaved: (value) {
              _age=value as String;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}