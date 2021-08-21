import 'package:flutter/material.dart';

// TODO: kumpulan function global
showError(String text, BuildContext context) async {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red.shade300,
  ));
}
