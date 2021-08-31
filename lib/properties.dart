import 'package:flutter/material.dart';

// TODO: function global
showError(String text, BuildContext context) async {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red.shade300,
  ));
}

showSuccess(String text, BuildContext context) async {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.green.shade300,
  ));
}
