import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nuwai_app/theme.dart';
import 'package:nuwai_app/widget/content_profile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              width: 160,
              height: 160,
              // margin: ,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/people_model.png"),
                  )),
              child: Align(
                child: GestureDetector(
                  onTap: () {
                    // TODO: button add photo from gallery
                  },
                  child: Image.asset(
                    "assets/btn_add.png",
                    width: 35,
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
          "Adi Nugraha Putra",
          style: poppinsMedium.copyWith(
            fontSize: 24,
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
          "Flutter Mobile Developer",
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: poppinsRegular.copyWith(
            fontSize: 16,
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
                  Get.toNamed("/edit");
                },
              ),
              ContentProfile(
                text: "Cara Membuka Lowongan",
                icon: Icon(Icons.arrow_right_rounded),
                ontap: () {
                  Get.toNamed("/guide");
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
                ontap: () {
                  // TODO: destroy token and log out
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
