import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuwai_app/provider/page_provider.dart';
import 'package:provider/provider.dart';

import 'pages/login_page.dart';
import 'pages/main_page.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashPage(),
          "/login": (context) => LoginPage(),
          "/register": (context) => RegisterPage(),
          "/main": (context) => MainPage(),
        },
      ),
    );
  }
}
