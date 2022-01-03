import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data!['image']),
                        radius: 100,
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Name: " + snapshot.data!['name']),
                      ),
                      margin: const EdgeInsets.only(
                        top: 50,
                        bottom: 10,
                        left: 10,
                        right: 10,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.brown,
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child:
                              Text("Age: " + snapshot.data!['age'].toString())),
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.brown,
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text("Breed: " + snapshot.data!['breed'])),
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.brown,
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                              "Description: " + snapshot.data!['description'])),
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.brown,
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child:
                              Text("Location: " + snapshot.data!['location'])),
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.brown,
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text("Contact: " + snapshot.data!['contact'])),
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.brown,
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                    ),
                    if (FirebaseAuth.instance.currentUser!.uid !=
                        snapshot.data!['user'])
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 20,
                        ),
                        child: RaisedButton(
                            color: Colors.brown,
                            child: const Text(
                              'Adopt',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        actionsPadding: EdgeInsets.zero,
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              padding: const EdgeInsets.only(
                                                top: 45,
                                              ),
                                              icon: const Icon(Icons.call),
                                              iconSize: 80,
                                              onPressed: () async {
                                                var uri =
                                                    'tel:${snapshot.data!['contact']}';
                                                if (await canLaunch(uri)) {
                                                  await launch(uri);
                                                } else {
                                                  throw 'Could not launch $uri';
                                                }
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                  Icons.mail_outline),
                                              iconSize: 80,
                                              padding: const EdgeInsets.only(
                                                top: 45,
                                              ),
                                              onPressed: () async {
                                                // Android and iOS
                                                String _email = "";
                                                FirebaseFirestore.instance
                                                    .doc(
                                                        'users/${snapshot.data!['user']}')
                                                    .get()
                                                    .then((data) async {
                                                  _email = data['email'];
                                                  var uri = 'mailto:$_email';
                                                  if (await canLaunch(uri)) {
                                                    await launch(uri);
                                                  } else {
                                                    throw 'Could not launch $uri';
                                                  }
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            textColor: Colors.brown,
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          )
                                        ],
                                      ));
                            }),
                      ),
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
