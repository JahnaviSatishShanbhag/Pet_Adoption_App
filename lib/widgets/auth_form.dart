import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      color: const Color.fromRGBO(241, 194, 125, 0.9),
      margin: const EdgeInsets.all(
        16,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Colors.brown,
                      fontSize: 15,
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email address',
                    labelStyle: TextStyle(
                      color: Colors.brown,
                      fontSize: 15,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.brown,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                RaisedButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    color: Colors.brown,
                    onPressed: () {}),
                FlatButton(
                  child: const Text(
                    'Create new account',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
