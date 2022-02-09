import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String? label;
  String? hint;
  bool senha;
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  FocusNode? nextFocus;

  AppText(
    this.label, String s,
  {this.hint,
    this.senha= false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,}
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: senha,
      validator: validator,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.dark,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        hintText: hint,
      ),
    );
  }
}
