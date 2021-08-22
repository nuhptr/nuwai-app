import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuwai_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'pages/success_page.dart';
import 'pages/detail_page.dart';
import 'pages/edit_profile_page.dart';
import 'pages/home/profile_page.dart';
import 'provider/page_provider.dart';
import 'pages/guide_page.dart';
import 'pages/login_page.dart';
import 'pages/home/main_page.dart';
import 'pages/register_page.dart';
import 'pages/splash_page.dart';

void main() {
  // TODO: Lock device orientation
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
    return ScreenUtilInit(
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PageProvider()),
          ChangeNotifierProvider(create: (context) => UserProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (context) => SplashPage(),
            "/login": (context) => LoginPage(),
            "/register": (context) => RegisterPage(),
            "/main": (context) => MainPage(),
            "/guide": (context) => GuidePage(),
            "/profile": (context) => ProfilePage(),
            "/edit": (context) => EditProfile(),
            "/detail": (context) => DetailPage(),
            "/success": (context) => SuccessPage(),
          },
        ),
      ),
    );
  }
}
