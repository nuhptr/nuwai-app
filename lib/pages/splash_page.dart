import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nuwai_app/pages/started_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    startSplashScreen();
    super.initState();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      // TODO: pindah ke page started
      Get.off(StartedPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: 130,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo.png"),
              ),
            ),
          ),
        ));
  }
}
