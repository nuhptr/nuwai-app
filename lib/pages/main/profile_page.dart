import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuwai_app/shared_preference.dart';
import 'package:provider/provider.dart';

import '/provider/user_provider.dart';
import '/theme.dart';
import '/widget/content_profile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    // TODO: function destroy pref token api
    destroyPrefToken() {
      var pref = JsonSharedPreference();
      pref.removeSharedPrefApp();

      userProvider.logout(userProvider.user.token);
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (route) => false,
      );
    }

    Widget header() {
      return Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(top: 40),
            width: 120.w,
            height: 120.h,
            // margin: ,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: userProvider.user.photoProfile != null
                      ? NetworkImage(userProvider.user.photoProfile!)
                      : const NetworkImage(
                          'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80'),
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ]);
    }

    Widget name() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Text(
          userProvider.user.name!,
          style: poppinsMedium.copyWith(
            fontSize: 20.sp,
            color: blackGrayColor,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget skill() {
      return Container(
        margin: EdgeInsets.only(top: 3),
        child: Text(
          userProvider.user.skill != null
              ? userProvider.user.skill!
              : "Belum Ada Skill",
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: poppinsRegular.copyWith(
            fontSize: 16.sp,
            color: grayColor,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              header(),
              name(),
              skill(),
              Container(
                margin: EdgeInsets.only(top: 18, bottom: 30),
                child: Divider(color: orangeColor, thickness: 1),
              ),
              ContentProfile(
                text: "Edit Profile",
                icon: const Icon(Icons.arrow_right_rounded),
                ontap: () {
                  Navigator.pushNamed(context, "/edit");
                },
              ),
              ContentProfile(
                text: "Cara Membuka Lowongan",
                icon: const Icon(Icons.arrow_right_rounded),
                ontap: () {
                  Navigator.pushNamed(context, "/guide");
                },
              ),
              ContentProfile(
                text: "Rating App",
                icon: const Icon(Icons.arrow_right_rounded),
                ontap: () {
                  // TODO: Launcher URL to playstore if the app ready
                  Navigator.pushNamed(
                    context,
                    "/notfound",
                  );
                },
              ),
              ContentProfile(
                text: "Log Out",
                icon: const Icon(Icons.arrow_right_rounded),
                // TODO: destroy token and log out
                ontap: destroyPrefToken,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
