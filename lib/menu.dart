import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/loginscreen.dart';
import 'home.dart';

class Menuscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orange.shade400,
      // width: MediaQuery.of(context).size.width * 0.70,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
            "_username",
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text(
              "email",
              style: TextStyle(fontSize: 20),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                "assets/demo/user.png",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              )
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("demo/foodbg.jpg"), fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(
              Icons.border_color,
              color: Colors.black,
            ),
            title: Text(
              "Orders",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark,
              color: Colors.black,
            ),
            title: Text(
              "Address",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: Colors.black,
            ),
            title: Text(
              "Help",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_box,
              color: Colors.black,
            ),
            title: Text(
              "About",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.star_half,
              color: Colors.black,
            ),
            title: Text(
              "Rate Us",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              children: [
                Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        print("Logout Successfully");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginscreen(),
                          ),
                        );
                      });
                    },
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
