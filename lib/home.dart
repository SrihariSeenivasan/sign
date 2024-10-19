import 'package:flutter/material.dart';
import 'package:sign/auth/auth.dart';

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
                    children: [
                      Padding(padding: EdgeInsets.all(10)),
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
                        width: 10,
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
//we don't need this manual navigation because wrapper class manage it by signout state

// gotoLogin(BuildContext context) {
//   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
// }
