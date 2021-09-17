import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:nuwai_app/theme.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200.w,
              height: 200.h,
              child: Lottie.asset(
                'assets/lottie/notfound.json',
                repeat: true,
                animate: true,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Page Belum Tersedia',
              style: poppinsMedium.copyWith(
                color: Colors.grey[400],
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
