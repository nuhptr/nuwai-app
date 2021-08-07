import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nuwai_app/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usernameController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");

  bool? isHide = true;
  bool? obsecureText = true;

  @override
  Widget build(BuildContext context) {
    Widget? header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: defaultMargin),
            width: 66,
            height: 38,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/logo.png"),
            )),
          ),
          SizedBox(
            height: 26,
          ),

          // TODO: Title Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              "Login",
              style: poppinsMedium.copyWith(fontSize: 24, color: yellowColor),
            ),
          ),
          SizedBox(
            height: 2,
          ),

          // TODO: subtitle text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              "NUWAI",
              style: poppinsBold.copyWith(fontSize: 40, color: yellowColor),
            ),
          )
        ],
      );
    }

    Widget? usernameInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 35,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: poppinsLight.copyWith(
                fontSize: 18,
                color: grayColor,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: orangeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextFormField(
                  style: poppinsRegular.copyWith(color: Colors.white),
                  controller: usernameController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukan Username',
                    hintStyle: poppinsLight.copyWith(
                      color: Colors.white38,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget? passwordInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: poppinsLight.copyWith(
                fontSize: 18,
                color: grayColor,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: orangeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: poppinsRegular.copyWith(color: Colors.white),
                        obscureText: obsecureText!,
                        controller: passwordController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Password minimal 8 character',
                          hintStyle: poppinsLight.copyWith(
                            color: Colors.white38,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: logic show/hide password
                        setState(() {
                          isHide = !isHide!;
                          obsecureText = !obsecureText!;
                        });
                      },
                      child: isHide!
                          ? Icon(
                              Icons.lock_outline,
                              size: 17,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.lock_open_sharp,
                              size: 17,
                              color: Colors.white,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget? buttonLogin() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          left: defaultMargin,
          right: defaultMargin,
        ),
        width: 156,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: orangeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          onPressed: () {
            Get.toNamed("/main");
          },
          child: Text(
            "Masuk",
            style: poppinsMedium.copyWith(fontSize: 18),
          ),
        ),
      );
    }

    Widget? registerText() {
      return Container(
        margin: EdgeInsets.only(top: 25, left: defaultMargin, bottom: 15),
        child: Row(
          children: [
            Text(
              "Belum punya akun?",
              style: poppinsLight.copyWith(color: grayColor),
            ),
            SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () {
                Get.offNamed("/register");
              },
              child: Text(
                "Daftar",
                style: poppinsMedium.copyWith(color: orangeColor),
              ),
            ),
          ],
        ),
      );
    }

    Widget? footer() {
      return Container(
        width: double.infinity,
        height: 220,
        child: Image.asset(
          "assets/register_image.png",
          fit: BoxFit.cover,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header()!,
              usernameInput()!,
              passwordInput()!,
              buttonLogin()!,
              registerText()!,
              footer()!,
            ],
          ),
        ),
      ),
    );
  }
}
