import 'package:flutter/material.dart';
import 'package:sign/auth/auth.dart';
import 'package:sign/screen/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //creating auth service
  final _auth = AuthService();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.blue,
                child: Text("Hi flutter developer's"),
              ),
            ),
            Center(
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.amber,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 75,
                        width: 85,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 75,
                        width: 85,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 75,
                        width: 85,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 75,
                        width: 85,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 75,
                        width: 85,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 75,
                          width: 85,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/page_img/login.png"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
                child: Column(
              children: [
                Container(
                    height: 100,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              await _auth.signout();
                              gotoLogin(context);
                            },
                            child: Text("Sign_out"))
                      ],
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}

gotoLogin(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
}
