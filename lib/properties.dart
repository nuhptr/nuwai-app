import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
