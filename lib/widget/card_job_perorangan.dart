import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/theme.dart';

class CardJobPerorangan extends StatelessWidget {
  final String? name;
  final String? city;
  final DateTime? time;

  CardJobPerorangan({this.name, this.city, this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: 20,
        left: defaultMargin,
        right: defaultMargin,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey.shade100,
              blurRadius: 5,
              spreadRadius: 1)
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name!,
                    style: poppinsMedium.copyWith(
                      fontSize: 16.sp,
                      color: orangeColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    city!,
                    style: poppinsLight.copyWith(
                      fontSize: 13.sp,
                      color: grayColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              ),
            ),
            Text(
              DateFormat("dd/MM/yyyy").format(time!),
              style:
                  poppinsRegular.copyWith(fontSize: 13.sp, color: orangeColor),
            )
          ],
        ),
      ),
    );
  }
}
