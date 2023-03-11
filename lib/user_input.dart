import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final String label;
  final bool secret; //boolean

  final _Textcon; // to assaign the value from text field

  UserInput(this.label, this.secret, this._Textcon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding for the contienr to minmize the border
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black87,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            // take input from user
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: label, //text
            ),
            controller: _Textcon,
            obscureText: secret, //to hide the text if it password
          ),
        ),
      ),
    );
  }
}
