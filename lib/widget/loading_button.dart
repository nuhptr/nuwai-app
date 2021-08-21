import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme.dart';

class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 155.w,
      margin: EdgeInsets.only(
        top: 40,
        left: defaultMargin,
        right: defaultMargin,
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          elevation: 0,
          backgroundColor: orangeColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 16.w,
              height: 16.h,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              'Loading',
              style: poppinsMedium.copyWith(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
