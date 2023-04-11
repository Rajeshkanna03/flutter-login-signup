import 'package:flutter/material.dart';
import 'package:flutterproject/home.dart';
import 'colors.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgotpass.dart';
import 'register.dart';

class Loginscreen extends StatefulWidget {
  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String _email, _password;
  late String _errorMessage = "";
  Future<void> login() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      final auth = FirebaseAuth.instance;
      try {
        await auth.signInWithEmailAndPassword(
            email: _email, password: _password);
        print("Login successful");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homescreen(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            _errorMessage = 'No user found for that email.';
          });
        } else if (e.code == 'wrong-password') {
          setState(() {
            _errorMessage = 'Wrong password provided for that user.';
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      backimg,
                      height: height * 0.40,
                      width: width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: height * 0.40,
                      width: width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            // stops: [0.3,0.7],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.brown.shade100
                            ]),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              appname,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.orange[900],
                              ),
                            ),
                            Text(
                              slogan,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    top: 20,
                  ),
                  child: Container(
                    child: Text(
                      "  $loginstring",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          primarycolor.withOpacity(0.3),
                          Colors.transparent
                        ]),
                        border: Border(
                            left: BorderSide(color: primarycolor, width: 5))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _email = value!;
                    },
                    validator: (email) {
                      if (email!.isEmpty)
                        return "Please enter email";
                      else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(email)) return "Email invalid";
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primarycolor)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: primarycolor,
                        ),
                        labelText: "Email Address",
                        labelStyle:
                            TextStyle(color: primarycolor, fontSize: 20)),
                  ),
                ),
                Text(
                  _errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _password = value!;
                    },
                    validator: (password) {
                      if (password!.isEmpty) return "Please enter password";
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primarycolor)),
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: primarycolor,
                        ),
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: primarycolor, fontSize: 20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Forgotpassscreen();
                          },),);
                        },
                        child: Text(
                          forgotpass,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            final auth = FirebaseAuth.instance;
                            login();
                          }
                        },
                        child: Text(
                          "Login to account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Registerscreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                color: primarycolor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
