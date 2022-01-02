import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class PetForm extends StatefulWidget {
  final String categoryId;

  PetForm(this.categoryId);

  @override
  _PetFormState createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _location = "";
  String _description = "";
  String _breed = "";
  num _age = 0;
  dynamic _storedImage;

  // bool _isEmpty()
  // {
  //   return _name.trim().isEmpty && _location.trim().isEmpty && _description.trim().isEmpty && _breed.trim().isEmpty && _age == 0;
  // }

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });
  }

  void _submitForm(BuildContext context) async {
    bool _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      _formKey.currentState!.save();
      // Provider.of<Animals>(context, listen: false)
      //     .addPet(widget.categoryId, _name, _description);
      await FirebaseFirestore.instance.collection('pets_in_category').add({
        'name': _name,
        'age': _age,
        'description': _description,
        'breed': _breed,
        'location': _location,
        'category': widget.categoryId,
        'user': FirebaseAuth.instance.currentUser!.uid,
      });
      Navigator.of(context).pop();
    }
  }

  Widget _avatar() {
    return InkWell(
      onTap: _takePicture,
      child: Container(
        margin: const EdgeInsets.only(
          top: 15,
        ),
        height: 150,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.brown,
          ),
          shape: BoxShape.circle,
        ),
        child: _storedImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(
                  75,
                ),
                child: Image.file(
                  _storedImage as File,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              )
            : const Icon(
                Icons.camera_alt_rounded,
                size: 40,
              ),
      ),
    );
  }

  Widget _buildName() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Center(
        child: TextFormField(
          style: const TextStyle(
            color: Colors.brown,
          ),
          cursorColor: Colors.brown,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.brown,
                style: BorderStyle.solid,
                width: 100,
              ),
              borderRadius: BorderRadius.circular(
                25,
              ),
            ),
            labelText: 'Pet\'s Name',
            hintStyle: const TextStyle(
              fontSize: 17,
            ),
            fillColor: const Color.fromRGBO(241, 194, 125, 0.9),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.brown,
                width: 3.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(
                25,
              ),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty || value.length < 5) {
              return 'Enter the pet name with minimum length 5';
            }
            return null;
          },
          onSaved: (value) {
            _name = value as String;
          },
        ),
      ),
    );
  }

  Widget _buildLocation() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextFormField(
        cursorColor: Colors.brown,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.brown,
              style: BorderStyle.solid,
              width: 100,
            ),
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          labelText: 'Location',
          hintStyle: const TextStyle(
            fontSize: 17,
          ),
          fillColor: const Color.fromRGBO(241, 194, 125, 0.9),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.brown,
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty || value.length < 5) {
            return 'Enter the location with minimum length 5';
          }
          return null;
        },
        onSaved: (value) {
          _location = value as String;
        },
      ),
    );
  }

  Widget _buildBreed() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextFormField(
        cursorColor: Colors.brown,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.brown,
              style: BorderStyle.solid,
              width: 100,
            ),
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          labelText: 'Breed',
          hintStyle: const TextStyle(
            fontSize: 17,
          ),
          fillColor: const Color.fromRGBO(241, 194, 125, 0.9),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.brown,
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty || value.length < 5) {
            return 'Enter the breed with minimum length 5';
          }
          return null;
        },
        onSaved: (value) {
          _breed = value as String;
        },
      ),
    );
  }

  Widget _buildAge() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextFormField(
        cursorColor: Colors.brown,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.brown,
              style: BorderStyle.solid,
              width: 100,
            ),
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          labelText: 'Age',
          hintStyle: const TextStyle(
            fontSize: 17,
          ),
          fillColor: const Color.fromRGBO(241, 194, 125, 0.9),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.brown,
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter the age of the pet';
          }
          return null;
        },
        onSaved: (value) {
          _age = int.parse(value as String);
        },
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextFormField(
        cursorColor: Colors.brown,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.brown,
              style: BorderStyle.solid,
              width: 100,
            ),
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          labelText: 'Description',
          hintStyle: const TextStyle(
            fontSize: 17,
          ),
          fillColor: const Color.fromRGBO(241, 194, 125, 0.9),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.brown,
              width: 3.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty || value.length < 5) {
            return 'Enter the descrpition with minimum length 5';
          }
          return null;
        },
        onSaved: (value) {
          _description = value as String;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _avatar(),
            _buildName(),
            _buildAge(),
            _buildBreed(),
            _buildDescription(),
            _buildLocation(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                child: const Text('Submit',
                    style: TextStyle(color: Colors.brown, fontSize: 17)),
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
