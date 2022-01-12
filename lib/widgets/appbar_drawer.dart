import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/auth_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.brown,
      // title: const Text(
      //   'Pet Adoption',
      //   style: TextStyle(
      //     color: Colors.white,
      //   ),
      // ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            Navigator.of(context).pushNamed(ProfileScreen.routeName);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(
      50,
    );
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // const DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.brown,
          //   ),
          //   child: Text(
          //     'Pet Adoption',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 24,
          //     ),
          //   ),
          // ),
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.brown,
            padding: const EdgeInsets.all(
              20,
            ),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Pet Adoption',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height:15,),
          StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
                    .snapshots(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.brown,
                      ),
                    );
                  } else {
                    final userDocs =
                        (snapshot.data as QuerySnapshot<Map<String, dynamic>>)
                            .docs;
                    return Text("Hi, ${userDocs[0]['username']}",style:const TextStyle(fontSize: 15,color: Colors.brown,),textAlign: TextAlign.left,);
                  }
                }),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Categories'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Log Out'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx) => AuthScreen(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
