import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuwai_app/model/job_model.dart';

import '/theme.dart';

class CardJobPerusahaan extends StatelessWidget {
  final JobModel? job;
  final Function()? ontap;

  CardJobPerusahaan({
    this.job,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap != null ? ontap : () {},
      child: Container(
        margin: EdgeInsets.only(
          right: 16,
        ),
        height: 140.h,
        width: 125.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.network(
                job!.fotoLowongan!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 80.h,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                job!.namaPekerjaan!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: poppinsSemiBold.copyWith(
                    fontSize: 16.sp, color: orangeColor),
              ),
            ),
            Text(
              job!.lokasiPekerjaan!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: poppinsLight.copyWith(fontSize: 14.sp, color: grayColor),
            )
          ],
        ),
      ),
    );
  }
}
