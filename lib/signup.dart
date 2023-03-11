import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './user_input.dart';
import 'package:flutter/material.dart';
import 'package:sign_up_page/const.dart';

class SignUP extends StatefulWidget {
  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  @override
  final _emailControler = TextEditingController();
  final _passwordControler = TextEditingController();
  final _confirmPasswordControler = TextEditingController();
  Future signUp() async {
    if (passwordCheck()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //to sync with firebase and create the account
        email: _emailControler.text.trim(),
        password: _passwordControler.text.trim(),
      );
      Navigator.of(context).pushNamed('/');
    } else {
      showDialog(
        //this for pop screen
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Your passwords does not matching !',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: Text('please enter your password corectly'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Ok",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              )
            ],
          );
        },
      );
    }
  }

  void dispose() {
    // to dispose it if we dont use it
    super.dispose();
    _emailControler.dispose();
    _passwordControler.dispose();
    _confirmPasswordControler.dispose();
  }

  bool passwordCheck() {
    //to check if the passwords are equals
    if (_passwordControler.text.trim() ==
        _confirmPasswordControler.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        // appbar
        title: Text(
          'Sign up screen',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        leading: IconButton(
          //leadin is the top left corner spacce
          // icon to return to signup screen
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('signin');
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
          ),
          iconSize: 25,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("images/dragon.png", height: 150),
              kVertical,
              Text(
                //title
                "SIGN UP",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                //subtitle
                "welcome here you can sign up<3",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              UserInput('Email', false, _emailControler),
              kVertical,
              UserInput('Password', true, _passwordControler),
              kVertical,
              UserInput('Confirm Password', true, _confirmPasswordControler),
              kVertical,
              ElevatedButton(
                onPressed: signUp,
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromRGBO(240, 0, 0, 1)),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                        horizontal: 50), //pading for the space into the button
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      //this to reach to border and stayling it
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                child: Text(
                  'Sign up',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              kVertical,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Are you a member?',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // to back to sign in screen
                      Navigator.of(context).pushReplacementNamed('signin');
                    },
                    child: Text(
                      'Sign in now!',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
