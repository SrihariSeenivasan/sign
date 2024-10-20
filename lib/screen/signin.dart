import 'package:firebase_core/firebase_core.dart'; // Ensure you import this
import 'package:flutter/material.dart';
import 'package:sign/auth/auth.dart';
import 'package:sign/home.dart';
import 'package:sign/method/textfieldmethod.dart';
import 'package:sign/screen/login.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _auth = AuthService();

  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  // Method to navigate to Home page

  // Signin function

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/page_img/signIn.png"))),
                ),
                SizedBox(height: 40),
                Center(
                  child: Container(
                    height: 380,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(2, 2),
                          )
                        ]),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            textfieldmethod("Enter your email", "E-mail",
                                Icons.person, false, _emailController),
                            SizedBox(height: 20),
                            textfieldmethod("Password", "Password",
                                Icons.password, true, _passwordController),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _signin,
                              child: Text("   Sign in   "),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?"),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    child: Text("Login "))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signin() async {
    try {
      // Ensure Firebase is initialized before calling any Firebase services
      await Firebase.initializeApp();

      await _auth.createUserWithEmailAndPassword(
          _emailController.text, _passwordController.text);
      Navigator.pop(context);
    } catch (e) {
      print("Error: $e");
      // You can show a dialog to the user if something goes wrong
    }
  }
}

gotoHome(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
}
