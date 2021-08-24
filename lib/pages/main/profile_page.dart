import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuwai_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '/theme.dart';
import '/widget/content_profile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    // TODO: function destroy token api
    destroyPrefToken() async {
      // var pref = await SharedPreferences.getInstance();
      // pref.clear();
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (route) => false,
      );
    }

    Widget header() {
      return Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              width: 140.w,
              height: 140.h,
              // margin: ,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(userProvider.user.photoProfile!),
                    fit: BoxFit.cover,
                  )),
              child: Align(
                child: GestureDetector(
                  onTap: () {
                    // TODO: button add photo from gallery
                  },
                  child: Image.asset(
                    "assets/btn_add.png",
                    width: 35.w,
                  ),
                ),
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
        ],
      );
    }

    Widget name() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          userProvider.user.name!,
          style: poppinsMedium.copyWith(
            fontSize: 24.sp,
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
        margin: EdgeInsets.only(top: 2),
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
                icon: Icon(Icons.arrow_right_rounded),
                ontap: () {
                  Navigator.pushNamed(context, "/edit");
                },
              ),
              ContentProfile(
                text: "Cara Membuka Lowongan",
                icon: Icon(Icons.arrow_right_rounded),
                ontap: () {
                  Navigator.pushNamed(context, "/guide");
                },
              ),
              ContentProfile(
                text: "Rating App",
                icon: Icon(Icons.arrow_right_rounded),
                ontap: () {
                  // TODO: Launcher URL to playstore if the app ready
                },
              ),
              ContentProfile(
                text: "Log Out",
                icon: Icon(Icons.arrow_right_rounded),
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
