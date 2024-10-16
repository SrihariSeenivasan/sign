import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sign/screen/login.dart';

Future<void> main() async {
  //if the app is web application
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAUEFgLa88zOzDBvsupyZ3vuUki_ZSODqE",
            authDomain: "sign-38ab7.firebaseapp.com",
            projectId: "sign-38ab7",
            storageBucket: "sign-38ab7.appspot.com",
            messagingSenderId: "1093457445685",
            appId: "1:1093457445685:web:3e91bddc8e055a7020c27c"));
  } else {
    await Firebase.initializeApp();
  }
//auth
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: LoginPage());
  }
}
