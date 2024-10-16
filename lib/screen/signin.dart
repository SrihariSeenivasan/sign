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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Method to navigate to Home page
  void gotoHome(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  // Signin function
  Future<void> _signin() async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          _emailController.text, _passwordController.text);
      if (user != null) {
        print("User created successfully");
        gotoHome(context);
      }
    } catch (e) {
      print("Error: $e");
    }
  }

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
                            )
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
}
