import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Function() onPressed;

  AppButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: RaisedButton(
        color: Colors.white,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

