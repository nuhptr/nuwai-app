import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nuwai_app/theme.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.offNamed("/main");
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 200.w,
                  height: 200.h,
                  child: Lottie.asset(
                    "assets/lottie/success.json",
                    repeat: true,
                    animate: true,
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Kamu Berhasil\nMelamar Hurray",
                textAlign: TextAlign.center,
                style: poppinsMedium.copyWith(
                  fontSize: 24.sp,
                  color: grayColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
