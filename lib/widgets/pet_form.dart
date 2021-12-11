import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/animals.dart';

class PetForm extends StatefulWidget {
  final String categoryId;

  PetForm(this.categoryId);

  @override
  _PetFormState createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  final _formKey = GlobalKey<FormState>();

  String _name="";
  String _location="";
  String _description="";
  String _breed="";
  String _age="";

  void _submitForm(BuildContext context)
  {
    bool _isValid=_formKey.currentState!.validate();
    if (_isValid)
    {
      _formKey.currentState!.save();
      Provider.of<Animals>(context,listen: false).addPet(widget.categoryId, _name, _description);
      Navigator.of(context).pop();
      // print(_name);
      // print(_location);
      // print(_description);
      // print(_breed);
      // print(_age);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Pet\'s Name',
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length<5) {
                    return 'Enter the pet name with minimum length 5';
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
                  if (value!.isEmpty || value.length<5) {
                    return 'Enter your location with minum length 5';
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
                  if (value!.isEmpty || value.length<5) {
                    return 'Enter description with minum length 5';
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
                  if (value!.isEmpty || value.length<5) {
                    return 'Enter the breed with minimum length 5';
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
                  if (value!.isEmpty) {
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
                child: RaisedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    _submitForm(context);
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}