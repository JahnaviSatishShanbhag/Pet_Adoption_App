import 'package:flutter/material.dart';

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
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize
  {
    return const Size.fromHeight(50,);
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
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Categories'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Create an Account'),
            onTap: () {

            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Log Out'),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}