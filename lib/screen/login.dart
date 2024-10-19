import 'package:flutter/material.dart';
import 'package:sign/auth/auth.dart';
import 'package:sign/method/textfieldmethod.dart';
import 'package:sign/screen/forgotpass.dart';
import 'package:sign/screen/signin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = AuthService();
  bool isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
                    //color: Colors.blueGrey,
                    image: DecorationImage(
                        image: AssetImage("assets/page_img/login.png"),
                        fit: BoxFit.contain),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Container(
                  height: 380,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 10)
                      ]),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            textfieldmethod("Enter your email", "E-mail",
                                Icons.person, false, _emailController),
                            SizedBox(height: 20),
                            textfieldmethod("Enter your Password", "Password",
                                Icons.password, true, _passwordController),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Forgotpass()));
                                    },
                                    child: Text(
                                      " Forgot password ?",
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {
                                _login();
                              },
                              child: Text("   Login   "),
                            ),
                            isLoading
                                ? const CircularProgressIndicator()
                                : OutlinedButton(
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      await _auth.loginWithGoogle();
                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color: Colors
                                              .blueGrey), // Optional: custom border color
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize
                                          .min, // Keep the button compact
                                      children: [
                                        Image.asset(
                                          'assets/logo/google.png', // Replace with the path to your image
                                          height:
                                              12.0, // Set the size of the image
                                        ),
                                        SizedBox(
                                            width:
                                                8.0), // Add some space between image and text
                                        Text(
                                          "Continue with Google",
                                          style:
                                              TextStyle(color: Colors.blueGrey),
                                        ),
                                      ],
                                    ),
                                  ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have account !"),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Signin()));
                                    },
                                    child: Text("Sign in "))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login() async {
    await _auth.loginUserWithEmailAndPassword(
        _emailController.text, _passwordController.text);
  }
}
