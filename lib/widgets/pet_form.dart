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

  String _name = "";
  String _location = "";
  String _description = "";
  String _breed = "";
  String _age = "";

  void _submitForm(BuildContext context) {
    bool _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      _formKey.currentState!.save();
      Provider.of<Animals>(context, listen: false)
          .addPet(widget.categoryId, _name, _description);
      Navigator.of(context).pop();
      // print(_name);
      // print(_location);
      // print(_description);
      // print(_breed);
      // print(_age);
    }
  }

  Widget _avatar() {
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.brown[500],
        radius: 100, //Text
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
          _name = value as String;
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
          _name = value as String;
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
          _name = value as String;
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
          _name = value as String;
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
            SizedBox(height: 30),
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

// Widget _buildDescription() {
  //   return Container(
  //     margin: const EdgeInsets.only(
  //       bottom: 10,
  //     ),
  //     child: TextFormField(
  //       key: const ValueKey('password'),
  //       obscureText: true,
  //       cursorColor: Colors.brown,
  //       validator: (value) {
  //         if (value!.isEmpty || value.length < 7) {
  //           return 'Password length should not be less than 7';
  //         }
  //         return null;
  //       },
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             color: Colors.brown,
  //             style: BorderStyle.solid,
  //           ),
  //           borderRadius: BorderRadius.circular(
  //             25,
  //           ),
  //         ),
  //         hintText: 'Enter your password',
  //         hintStyle: const TextStyle(
  //           fontSize: 17,
  //         ),
  //         fillColor: const Color.fromRGBO(241, 194, 125, 1),
  //         filled: true,
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             color: Colors.brown,
  //             width: 3.0,
  //             style: BorderStyle.solid,
  //           ),
  //           borderRadius: BorderRadius.circular(
  //             25,
  //           ),
  //         ),
  //       ),
  //       onSaved: (value) {
  //         _description = value as String;
  //       },
  //     ),
  //   );
  //             ),Container(
  //   margin: const EdgeInsets.only(
  //     bottom: 10,
  //   ),
  //   child: TextFormField(
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(
  //         borderSide: const BorderSide(
  //           color: Colors.brown,
  //           style: BorderStyle.solid,
  //           width: 100,
  //         ),
  //         borderRadius: BorderRadius.circular(
  //           25,
  //         ),
  //       ),
  //       hintText: 'Description',
  //       hintStyle: const TextStyle(
  //         fontSize: 17,
  //       ),
  //       fillColor: const Color.fromRGBO(241, 194, 125, 0.9),
  //       filled: true,
  //     ),
  //     validator: (value) {
  //       if (value!.isEmpty || value.length < 5) {
  //         return 'Enter description with minum length 5';
  //       }
  //       return null;
  //     },
  //     onSaved: (value) {
  //       _description = value as String;
  //     },
  //   ),
  // );
  // }

  // Widget _buildBreed() {
  //   return Container(
  //       margin: const EdgeInsets.only(
  //         bottom: 10,
  //       ),
  //       child: TextFormField(
  //         decoration: InputDecoration(
  //           border: OutlineInputBorder(
  //             borderSide: const BorderSide(
  //               color: Colors.brown,
  //               style: BorderStyle.solid,
  //               width: 100,
  //             ),
  //             borderRadius: BorderRadius.circular(
  //               25,
  //             ),
  //           ),
  //           hintText: 'Breed',
  //           hintStyle: const TextStyle(
  //             fontSize: 17,
  //           ),
  //           fillColor: const Color.fromRGBO(241, 194, 125, 0.9),
  //           filled: true,
  //         ),
  //         validator: (value) {
  //           if (value!.isEmpty || value.length < 5) {
  //             return 'Enter the breed with minimum length 5';
  //           }
  //           return null;
  //         },
  //         onSaved: (value) {
  //           _breed = value as String;
  //         },
  //       ));
  // }

  // Widget _buildAge() {
  //   return Container(
  //     margin: const EdgeInsets.only(
  //       bottom: 10,
  //     ),
  //     child: TextFormField(
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             color: Colors.brown,
  //             style: BorderStyle.solid,
  //             width: 100,
  //           ),
  //           borderRadius: BorderRadius.circular(
  //             25,
  //           ),
  //         ),
  //         hintText: 'Age',
  //         hintStyle: const TextStyle(
  //           fontSize: 17,
  //         ),
  //         fillColor: const Color.fromRGBO(241, 194, 125, 0.9),
  //         filled: true,
  //       ),
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return 'Enter the age of your pet';
  //         }
  //         return null;
  //       },
  //       onSaved: (value) {
  //         _age = value as String;
  //       },
  //     ),
  //   );
