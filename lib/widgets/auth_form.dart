import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _userName = "";
  String _userEmail = "";
  String _userPassword = "";
  bool _isLogin = true;

  void _trySubmit() {
    final _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      _formKey.currentState!.save();
      print(_userName);
      print(_userEmail);
      print(_userPassword);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // color: const Color.fromRGBO(241, 194, 125, 0.9),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!_isLogin)
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: TextFormField(
                      key: const ValueKey('username'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 5) {
                          return 'Please enter a username with minimum length 5';
                        }
                        return null;
                      },
                      cursorColor: Colors.brown,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                        ),
                        hintText: 'Enter your username',
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
                      onSaved: (value) {
                        _userName = value as String;
                      },
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: TextFormField(
                    cursorColor: Colors.brown,
                    key: const ValueKey('email'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Email address should contain @';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                      ),
                      hintText: 'Enter your email address',
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
                    onSaved: (value) {
                      _userEmail = value as String;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: TextFormField(
                    key: const ValueKey('password'),
                    obscureText: true,
                    cursorColor: Colors.brown,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'Password length should not be less than 7';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          25,
                        ),
                      ),
                      hintText: 'Enter your password',
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
                    onSaved: (value) {
                      _userPassword = value as String;
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                  height: 50,
                  child: RaisedButton(
                    child: Text(
                      _isLogin ? 'Login' : 'Signup',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    color: Colors.brown,
                    onPressed: () {
                      _trySubmit();
                    },
                  ),
                ),
                FlatButton(
                  child: Text(
                    _isLogin
                        ? 'Create new account'
                        : 'I already have an account',
                    style: const TextStyle(
                      color: Colors.brown,
                      fontSize: 17,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
