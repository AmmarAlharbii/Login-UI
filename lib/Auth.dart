import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sign_up_page/Screen_App.dart';
import './HomePage.dart';
import 'package:flutter/material.dart';
import './Screen_App.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance
          .userChanges(), //this to check the inputs if there  or not
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return ScreenApp();
        }
      },
    ));
  }
}
