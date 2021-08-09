import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String? name;
  final TextEditingController? textEditingController;
  final String? hintText;
  final bool? obsecureText;
  final double? top;
  final TextInputType? inputType;

  TextFieldWidget(
      {this.name,
      this.textEditingController,
      this.hintText,
      this.obsecureText,
      this.top,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 18,
        top: top != null ? 20 : 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name!,
            style: poppinsRegular.copyWith(fontSize: 15.sp, color: grayColor),
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
                controller: textEditingController!,
                obscureText: obsecureText != null ? obsecureText! : false,
                keyboardType: inputType != null ? inputType : null,
                decoration: InputDecoration.collapsed(
                  hintText: hintText != null ? hintText : "",
                  hintStyle: poppinsLight.copyWith(
                    color: Colors.white,
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
}
