import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/appbar_drawer.dart';

class PetDesc extends StatelessWidget {
  static const routeName = '/pet-description-screen';

  @override
  Widget build(BuildContext context) {
    Map<String, String> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: Appbar(),
      backgroundColor: Theme.of(context).primaryColor,
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('pets_in_category')
            .doc(routeArgs['pet_id'] as String)
            .get(),
        builder: (ctx, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data!['image']),
                      radius: 75,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(snapshot.data!['name']),
                      ),
                      margin: const EdgeInsets.all(
                        25,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(snapshot.data!['age'].toString())),
                      margin: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(snapshot.data!['breed'])),
                      margin: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(snapshot.data!['description'])),
                      margin: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(snapshot.data!['location'])),
                      margin: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                    if (FirebaseAuth.instance.currentUser!.uid !=
                        snapshot.data!['user'])
                      RaisedButton(
                          child: const Text('Adopt'), onPressed: () {}),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
