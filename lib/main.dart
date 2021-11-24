import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '/pages/not_found_page.dart';
import '/provider/job_provider.dart';
import '/provider/user_provider.dart';
import '/provider/work_provider.dart';
import '/pages/success_page.dart';
import '/pages/edit_profile_page.dart';
import '/provider/page_provider.dart';
import '/pages/guide_page.dart';
import '/pages/login_page.dart';
import '/pages/main/profile_page.dart';
import '/pages/main/main_page.dart';
import '/pages/register_page.dart';

void main() async {
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
          ChangeNotifierProvider(
            create: (context) => PageProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => JobProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => WorkProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (context) => LoginPage(),
            "/register": (context) => RegisterPage(),
            "/main": (context) => MainPage(),
            "/guide": (context) => GuidePage(),
            "/profile": (context) => ProfilePage(),
            "/edit": (context) => EditProfile(),
            "/success": (context) => SuccessPage(),
            "/notfound": (context) => NotFound(),
          },
        ),
      ),
    );
  }
}
