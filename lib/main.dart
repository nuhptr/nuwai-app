import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'pages/detail_page.dart';
import 'pages/edit_profile_page.dart';
import 'pages/profile_page.dart';
import 'provider/page_provider.dart';
import 'pages/guide_page.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => SplashPage()),
          GetPage(name: "/login", page: () => LoginPage()),
          GetPage(name: "/register", page: () => RegisterPage()),
          GetPage(name: "/main", page: () => MainPage()),
          GetPage(name: "/guide", page: () => GuidePage()),
          GetPage(name: "/profile", page: () => ProfilePage()),
          GetPage(name: "/edit", page: () => EditProfile()),
          GetPage(name: "/detail", page: () => DetailPage()),
        ],
      ),
    );
  }
}
