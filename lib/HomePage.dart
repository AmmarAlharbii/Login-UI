import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sign_up_page/main.dart';
import './Screen_App.dart';

class HomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login complete',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(
              user.email!,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                backgroundColor:
                    MaterialStateProperty.all(Color.fromRGBO(240, 0, 0, 1)),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                      horizontal: 80), //pading for the space into the button
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    //this to reach to border and stayling it
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
              child: Text(
                'Logout',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
