import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_up_page/Screen_App.dart';
import './Auth.dart';
import './HomePage.dart';
import './signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //home: Auth(),
      routes: {
        // this to go to any page but must use the route
        '/': (context) => const Auth(),
        'signup': (context) => SignUP(),
        'homepage': (context) => HomePage(),
        'signin': (context) => ScreenApp()
      },
    );
  }
}
