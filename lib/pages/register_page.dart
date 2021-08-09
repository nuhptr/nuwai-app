import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/theme.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var nameController = TextEditingController(text: "");
  var usernameController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget? header() {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(
            top: 40,
            bottom: 35,
          ),
          height: 35.h,
          width: 60.w,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/logo.png"),
          )),
        ),
      );
    }

    Widget? textTitle() {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Buat Akun",
          style: poppinsMedium.copyWith(fontSize: 35.sp, color: orangeColor),
        ),
      );
    }

    Widget? inputName() {
      return Container(
        margin: EdgeInsets.only(bottom: 20, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Lengkap",
              style: poppinsRegular.copyWith(fontSize: 16.sp, color: grayColor),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 45.h,
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
                  controller: nameController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukan Nama Lengkap',
                    hintStyle: poppinsLight.copyWith(
                      color: Colors.white38,
                      fontSize: 14..sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget? inputUserName() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: poppinsRegular.copyWith(fontSize: 16.sp, color: grayColor),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 45.h,
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
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget? inputPassword() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: poppinsRegular.copyWith(fontSize: 16.sp, color: grayColor),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 45.h,
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
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Password minimal 8 Character',
                    hintStyle: poppinsLight.copyWith(
                      color: Colors.white38,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget? inputEmail() {
      return Container(
        margin: EdgeInsets.only(bottom: 65),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: poppinsRegular.copyWith(fontSize: 16.sp, color: grayColor),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 45.h,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: orangeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: poppinsRegular.copyWith(color: Colors.white),
                  controller: emailController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukan email',
                    hintStyle: poppinsLight.copyWith(
                      color: Colors.white38,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget? buttonRegister() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 80),
        height: 45.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: orangeColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: () {
              Get.toNamed("/main");
            },
            child: Text(
              "Masuk",
              style: poppinsMedium.copyWith(fontSize: 16.sp),
            )),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          physics: BouncingScrollPhysics(),
          children: [
            header()!,
            textTitle()!,
            inputName()!,
            inputUserName()!,
            inputPassword()!,
            inputEmail()!,
            buttonRegister()!,
          ],
        ),
      ),
    );
  }
}
