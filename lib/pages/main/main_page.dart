import 'package:flutter/material.dart';
import 'package:nuwai_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_page.dart';
import 'profile_page.dart';
import 'search_page.dart';
import '/provider/page_provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget? body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return SearchPage();
        case 2:
          return ProfilePage();

        default:
          return HomePage();
      }
    }

    Widget? customNav() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BottomAppBar(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: BottomNavigationBar(
            backgroundColor: bottomNavColor,
            currentIndex: pageProvider.currentIndex!,
            onTap: (value) {
              print(value);
              pageProvider.currentIndex = value;
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: pageProvider.currentIndex == 0
                      ? Image.asset(
                          "assets/home_orange.png",
                          width: 24.w,
                        )
                      : Image.asset(
                          "assets/home_gray.png",
                          width: 24.w,
                        ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: pageProvider.currentIndex == 1
                      ? Image.asset(
                          "assets/search_orange.png",
                          width: 24.w,
                        )
                      : Image.asset(
                          "assets/search_gray.png",
                          width: 24.w,
                        ),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: pageProvider.currentIndex == 2
                      ? Image.asset(
                          "assets/people_orange.png",
                          width: 24.w,
                        )
                      : Image.asset(
                          "assets/people_gray.png",
                          width: 24.w,
                        ),
                ),
                label: "",
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: body()!,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: customNav()!,
      ),
    );
  }
}
