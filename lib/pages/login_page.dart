import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '/properties.dart';
import '/provider/page_provider.dart';
import '/provider/user_provider.dart';
import '/widget/loading_button.dart';
import '/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");

  bool? isHide = true;
  bool? obsecureText = true;
  bool? isLoading = false;
  bool? isEmailValid = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var pageProvider = Provider.of<PageProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await userProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        // TODO: set preference from user (kalo udah selesai json response aktifin)
        // var pref = JsonSharedPreference();
        // pref.save('token', userProvider.user.token);

        Navigator.pushNamedAndRemoveUntil(
          context,
          '/main',
          (route) => false,
        );
      } else {
        showError('Gagal Login', context);
      }

      setState(() {
        isLoading = false;
        pageProvider.currentIndex = 0;
      });
    }

    Widget? header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: defaultMargin),
            width: 60.w,
            height: 35.h,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/logo.png"),
            )),
          ),
          SizedBox(
            height: 20.h,
          ),

          // TODO: Title Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              "Login",
              style: poppinsRegular.copyWith(
                fontSize: 20.sp,
                color: yellowColor,
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),

          // TODO: subtitle text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              "NUWAI",
              style: poppinsBold.copyWith(fontSize: 38.sp, color: yellowColor),
            ),
          )
        ],
      );
    }

    Widget? emailInput() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: poppinsLight.copyWith(
                fontSize: 16.sp,
                color: grayColor,
              ),
            ),
            SizedBox(
              height: 10.h,
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
                  keyboardType: TextInputType.emailAddress,
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
                fontSize: 16.sp,
                color: grayColor,
              ),
            ),
            SizedBox(
              height: 10.h,
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
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: poppinsRegular.copyWith(color: Colors.white),
                        obscureText: obsecureText!,
                        obscuringCharacter: '*',
                        controller: passwordController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Password minimal 8 character',
                          hintStyle: poppinsLight.copyWith(
                            color: Colors.white38,
                            fontSize: 14.sp,
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
        width: 155.w,
        height: 45.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: orangeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          onPressed: handleSignIn,
          child: Text(
            "Masuk",
            style: poppinsRegular.copyWith(fontSize: 16.sp),
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
              width: 4.w,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register');
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
        height: 185.h,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/register_image.png"),
          fit: BoxFit.cover,
        )),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification? overscroll) {
            overscroll!.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            // physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header()!,
                emailInput()!,
                passwordInput()!,
                isLoading!
                    ? LoadingButton(
                        marginLeft: defaultMargin,
                        marginRight: defaultMargin,
                        marginTop: 40,
                        height: 45,
                        width: 155,
                      )
                    : buttonLogin()!,
                registerText()!,
                footer()!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
