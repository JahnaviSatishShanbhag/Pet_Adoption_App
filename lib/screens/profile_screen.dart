import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/appbar_drawer.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';
  String _email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(
              20,
            ),
            child: const Text(
              "For adoption",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('pets_in_category')
                  .where('user',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .where('adoptedBy', isEqualTo: "")
                  .snapshots(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.brown,
                    ),
                  );
                } else {
                  final petDocs =
                      (snapshot.data as QuerySnapshot<Map<String, dynamic>>)
                          .docs;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: petDocs.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                        margin: const EdgeInsets.all(
                          10,
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
                        child: ListTile(
                          // leading: const CircleAvatar(
                          //   backgroundColor: Colors.brown,
                          // ),
                          title: Text(
                            petDocs[index]['name'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              final _formKey = GlobalKey<FormState>();
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          cursorColor: Colors.black,
                                          decoration: const InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            hintText:
                                                'Enter the email id of the adopter',
                                            hintStyle: TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                !value.contains('@')) {
                                              return 'Email address should contain @';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            _email = value as String;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    FlatButton(
                                      child: const Text(
                                        'Okay',
                                      ),
                                      onPressed: () {
                                        bool _isValid =
                                            _formKey.currentState!.validate();
                                        if (_isValid) {
                                          _formKey.currentState!.save();
                                          FirebaseFirestore.instance
                                              .collection('users')
                                              .where(
                                                'email',
                                                isEqualTo: _email,
                                              )
                                              .get()
                                              .then((data) async {
                                            await FirebaseFirestore.instance
                                                .collection('pets_in_category')
                                                .doc(petDocs[index].id)
                                                .update({
                                              'adoptedBy': data.docs[0].id
                                            });
                                            Navigator.of(context).pop();
                                          });
                                        }
                                      },
                                    ),
                                    FlatButton(
                                      child: const Text(
                                        'Cancel',
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            margin: const EdgeInsets.all(
              20,
            ),
            child: const Text(
              "Adopted",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('pets_in_category')
                  .where('adoptedBy',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.brown,
                    ),
                  );
                } else {
                  final petDocs =
                      (snapshot.data as QuerySnapshot<Map<String, dynamic>>)
                          .docs;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: petDocs.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          margin: const EdgeInsets.all(
                            10,
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
                          child: ListTile(
                            // leading: const CircleAvatar(
                            //   backgroundColor: Colors.brown,
                            // ),
                            title: Text(
                              petDocs[index]['name'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
