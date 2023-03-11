import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'const.dart';
import './user_input.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScreenApp extends StatefulWidget {
  @override
  State<ScreenApp> createState() => _ScreenAppState();
}

class _ScreenAppState extends State<ScreenApp> {
  @override
  final _emailControler = TextEditingController();
  final _passwordControler = TextEditingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      //to sync with firebase
      email: _emailControler.text.trim(),
      password: _passwordControler.text.trim(),
    );
  }

  void signUpNow() {
    Navigator.of(context).pushReplacementNamed('signup');
  }

  void dispose() {
    // to dispose it if we dont use it
    super.dispose();
    _emailControler.dispose();
    _passwordControler.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/dragon.png",
                  height: 150,
                ),
                kVertical,
                Text(
                  //title
                  "SIGN IN",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                kVertical, // for space
                Text(
                  //subtitle
                  "welcome back! nice to see you again <3",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                UserInput(
                    //email
                    'Enter your email',
                    false,
                    _emailControler), //our widget
                kVertical,
                UserInput(
                    'Enter your password', true, _passwordControler), //password
                kVertical,
                ElevatedButton(
                  onPressed: signIn,
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(10),
                    backgroundColor:
                        MaterialStateProperty.all(Color.fromRGBO(240, 0, 0, 1)),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                          horizontal:
                              50), //pading for the space into the button
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        //this to reach to border and stayling it
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  child: Text(
                    'Sign in',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'not yet member?',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: signUpNow,
                      child: Text(
                        'Sign up now!',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
