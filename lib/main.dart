import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
      },
    );
  }
}
