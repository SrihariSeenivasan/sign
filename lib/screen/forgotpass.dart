import 'package:flutter/material.dart';
import 'package:sign/method/textfieldmethod.dart';
import 'package:sign/screen/signin.dart';

class Forgotpass extends StatefulWidget {
  const Forgotpass({super.key});

  @override
  State<Forgotpass> createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
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
                    //color: Colors.blueGrey,
                    image: DecorationImage(
                        image: AssetImage("assets/page_img/forgot.png"),
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Reset your password",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          textfieldmethod("Password", "Password",
                              Icons.password, true, null),
                          SizedBox(height: 20),
                          textfieldmethod("Confirm Password",
                              "Confirm password", Icons.password, true, null),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signin()));
                            },
                            child: Text("   Set password   "),
                          ),
                        ],
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
}
