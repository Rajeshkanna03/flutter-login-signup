import "package:flutter/material.dart";
import 'package:flutterproject/forgotpass.dart';
import 'package:flutterproject/home.dart';
import 'package:flutterproject/register.dart';
import 'constants.dart';
import 'loginscreen.dart';
import 'menu.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyAnuulOrVSk8NgtwfVAOvXF9sRDEPJob5w",
    projectId: "flutterweb-1fb62",
    messagingSenderId: "1026970922228",
    appId: "1:1026970922228:web:b5fe4fb727daa3a08cc2a1",
  ));
  runApp(Initialscreen());
}

class Initialscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Forgotpassscreen(),
      title: appname,
      debugShowCheckedModeBanner: false,
    );
  }
}
