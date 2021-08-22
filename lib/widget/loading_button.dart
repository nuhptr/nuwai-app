import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme.dart';

class LoadingButton extends StatelessWidget {
  final double? top;
  final double? height;
  final double? width;

  LoadingButton({this.top, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height!.h,
      width: width!.w,
      margin: EdgeInsets.only(
        top: top!,
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
