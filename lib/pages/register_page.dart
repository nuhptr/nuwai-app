import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuwai_app/properties.dart';
import 'package:nuwai_app/provider/page_provider.dart';
import 'package:nuwai_app/provider/user_provider.dart';
import 'package:nuwai_app/widget/loading_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/theme.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var nameController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  var confirmPasswordController = TextEditingController(text: "");

  bool? isLoading = false;

  @override
  Widget build(BuildContext context) {
    var pageProvider = Provider.of<PageProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    handleSignUp() async {
      var pref = await SharedPreferences.getInstance();

      setState(() {
        isLoading = true;
      });

      if (nameController.text.trim() == '' &&
          emailController.text.trim() == '' &&
          passwordController.text.trim() == '' &&
          confirmPasswordController.text.trim() == '') {
        showError('Field Harus Diisi Semua', context);
      } else if (passwordController.text != confirmPasswordController.text) {
        showError('Password tidak sama', context);
      } else if (passwordController.text.length < 8) {
        showError('Password harus lebih dari 8', context);
      } else {
        await userProvider.register(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
        );

        // TODO: set preference from token user
        pref.setString('token', userProvider.user.token!);
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/main',
          (route) => false,
        );
      }

      setState(() {
        isLoading = false;
        pageProvider.currentIndex = 0;
      });
    }

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

    Widget? inputEmail() {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
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
                  obscuringCharacter: '*',
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

    Widget? inputConfirmPassword() {
      return Container(
        margin: EdgeInsets.only(bottom: 65),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Konfirmasi Password",
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
                  controller: confirmPasswordController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukan ulang password',
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
            onPressed: handleSignUp,
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
            inputEmail()!,
            inputPassword()!,
            inputConfirmPassword()!,
            isLoading!
                ? LoadingButton(
                    marginLeft: 80,
                    marginRight: 80,
                    marginTop: 0,
                    height: 45,
                    width: 0,
                  )
                : buttonRegister()!,
          ],
        ),
      ),
    );
  }
}
