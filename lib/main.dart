import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign/wrapper.dart';

Future<void> main() async {
  // Ensure that Flutter's widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCeqjJ7EMMVj74guOTM3_yfkWMcj9WEVlE",
          appId: "1:1093457445685:android:525ba9bdbf3247cc20c27c",
          messagingSenderId: "1093457445685",
          projectId: "sign-38ab7"));

  // Run the app
  runApp(const MyApp());
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
      home: Wrapper(),
    );
  }
}
