import 'package:flutter/material.dart';
import 'package:nuwai_app/pages/login_page.dart';

import 'package:nuwai_app/theme.dart';

class StartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget? header() {
      return Container(
        margin: EdgeInsets.only(top: 40, left: defaultMargin),
        width: 66,
        height: 38,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/logo.png"),
        )),
      );
    }

    Widget? textTitle() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 74,
        ),
        child: Text(
          "Temukan Gawai\nDi Provinsi\nLampung",
          style: poppinsSemiBold.copyWith(
            fontSize: 31,
            color: orangeColor,
            height: 1.4,
          ),
        ),
      );
    }

    Widget? subtitleText() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: 9,
          right: defaultMargin,
        ),
        child: Text(
          "Mencari pekerjaan yang tentunya\nhalal",
          style: poppinsLight.copyWith(
            fontSize: 16,
            color: grayColor,
          ),
        ),
      );
    }

    Widget? buttonNext() {
      return Container(
        margin: EdgeInsets.only(
          top: 57,
          left: defaultMargin,
          right: defaultMargin,
        ),
        width: 200,
        height: 50,
        child: ElevatedButton(
          child: Text("Lanjutkan",
              style: poppinsMedium.copyWith(
                fontSize: 17,
              )),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/login",
              (route) => false,
            );
          },
          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: orangeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
        ),
      );
    }

    Widget? imageBottom() {
      return Container(
        width: double.infinity,
        height: 280,
        child: Image.asset(
          "assets/splash_image.png",
          fit: BoxFit.cover,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header()!,
            textTitle()!,
            subtitleText()!,
            buttonNext()!,
            Spacer(),
            imageBottom()!,
          ],
        ),
      ),
    );
  }
}
