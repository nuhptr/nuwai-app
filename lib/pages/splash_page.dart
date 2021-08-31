import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuwai_app/pages/login_page.dart';

import '/pages/main/main_page.dart';
import 'package:nuwai_app/pages/started_page.dart';
import 'package:nuwai_app/provider/job_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkPrefPage();
  }

  // TODO: conditional pref to started or main screen
  checkPrefPage() async {
    var pref = await SharedPreferences.getInstance();

    await Provider.of<JobProvider>(context, listen: false)
        .getJobByCategory('Perorangan');
    await Provider.of<JobProvider>(context, listen: false)
        .getJobByCategory('Perusahaan');
    checkStartedPage();
    if (pref.getString('token') != null) {
      startMainScreen();
    } else {
      startSplashScreen();
    }
  }

  checkStartedPage() async {
    var pref = await SharedPreferences.getInstance();
    if (pref.getBool('start') != null) {
      startLoginScreen();
    } else {
      startSplashScreen();
    }
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      // TODO: pindah ke page started
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => StartedPage()),
        (route) => false,
      );
    });
  }

  startMainScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      // TODO: pindah ke main screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
        (route) => false,
      );
    });
  }

  startLoginScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      // TODO: pindah ke login screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: 130.w,
            height: 150.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo.png"),
              ),
            ),
          ),
        ));
  }
}
