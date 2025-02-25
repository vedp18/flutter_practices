import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  final imageUrl = "https://avatars.githubusercontent.com/u/158450303?v=4";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //? this backgroundColor property can be used instead of wraping ListView with a Container
      backgroundColor: Colors.deepPurple,
      // child: Container(
      // color: Colors.deepPurple,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              border: Border(
                bottom: Divider.createBorderSide(
                  context,
                  color: Colors.deepPurple,
                  width: 0.0,
                ),
              ),
              // color: Colors.transparent,
            ),
            //? this padding changes around DrawerHeader so makes zero paddings
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              // arrowColor: Colors.deepPurple,
              //? this margin only changes margin around UserAccountsDrawerHeader
              //? so this doesn't remove total spaces arond Text or widget
              margin: EdgeInsets.zero,
              accountName: Text("Vedkumar Patel"),
              accountEmail: Text("vedkumar1881@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),

          // others
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              textScaler: TextScaler.linear(1.1),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              "Profile",
              textScaler: TextScaler.linear(1.1),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.email,
              color: Colors.white,
            ),
            title: Text(
              "Email Me",
              textScaler: TextScaler.linear(1.1),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

        ],
      ),
      // ), // Container
    );
  }
}
