import 'package:flutter/material.dart';
import 'package:flutterproject/home.dart';
import 'package:flutterproject/loginscreen.dart';
import 'colors.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register.dart';

class Forgotpassscreen extends StatefulWidget {
  @override
  State<Forgotpassscreen> createState() => _ForgotpassscreenState();
}

class _ForgotpassscreenState extends State<Forgotpassscreen> {

  late TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);
          // print("success");
          showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text("Password Reset link sent to your email"),);
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text("Email not register"),);
          });
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
                    child: Center(
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: TextField(
                    controller: _emailController,
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
                      child: MaterialButton(
                        onPressed:passwordReset ,
                        child: Text(
                          "Reset Password",
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
                      Text("Remember Password ?"),
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
                            "Login",
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
    );
  }
}
