import 'package:flutter/material.dart';
import 'package:flutterproject/home.dart';
import 'package:flutterproject/loginscreen.dart';
import 'colors.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registerscreen extends StatefulWidget {
  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String _username;
  late String _email;
  late String _password;
  late String _confirmpassword;
  bool _emailAlreadyInUse = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      // resizeToAvoidBottomInset: true,
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
                      "  $registerstring",
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
                      _username = value!;
                    },
                    validator: (username) {
                      if (username!.isEmpty) return "Please enter username";
                      return null;
                    },
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primarycolor)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: primarycolor,
                        ),
                        labelText: "Username",
                        labelStyle:
                            TextStyle(color: primarycolor, fontSize: 20)),
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
                if (_emailAlreadyInUse)
                  Text(
                    'This email is already registered.',
                    style: TextStyle(color: Colors.red),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _password = value!;
                    },
                    controller: _passwordController,
                    validator: (password) {
                      if (password!.isEmpty)
                        return "Please enter password";
                      else if (password.length < 8 || password.length > 15)
                        return "Password have 8-15 characters";
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: TextFormField(
                    onSaved: (value) {
                      _confirmpassword = value!;
                    },
                    controller: _confirmPasswordController,
                    validator: (confirmPassword) {
                      final password = _passwordController.text;
                      if (confirmPassword!.isEmpty) {
                        return "Please enter password";
                      }
                      if (password != confirmPassword) {
                        return "Password doesn't match";
                      }
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
                        labelText: "Confirm Password",
                        labelStyle:
                            TextStyle(color: primarycolor, fontSize: 20)),
                  ),
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
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            final auth = FirebaseAuth.instance;
                            try {
                              await auth
                                  .createUserWithEmailAndPassword(
                                      email: _email, password: _password)
                                  .then((value) {
                                print("Account created");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Homescreen(),
                                  ),
                                );
                              }).onError((error, stackTrace) {
                                setState(() {
                                  _emailAlreadyInUse = true;
                                });
                                // print("error ${error.toString()}");
                              });

                              FocusScope.of(context).unfocus();
                            }
                            //  on FirebaseAuthException catch (e) {
                            //   if (e.code == 'email-already-in-use') {
                            //     setState(() {
                            //       errorMessage =
                            //           'This email is already in use. Please use a different email.';
                            //     });
                            //     // Email is already registered
                            //   } else {
                            //     // Other error occurred, handle appropriately
                            //   }
                            // }
                            catch (e) {
                              // Other error occurred, handle appropriately
                            }
                          }
                        },
                        child: Text(
                          "Register account",
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
                      Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginscreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Login Now",
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
