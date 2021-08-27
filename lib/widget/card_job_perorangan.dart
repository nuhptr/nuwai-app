import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuwai_app/model/job_model.dart';

import '/theme.dart';

class CardJobPerorangan extends StatelessWidget {
  CardJobPerorangan({this.job, this.ontap});

  final JobModel? job;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap != null ? ontap! : () {},
      child: Container(
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
                      job!.namaPekerjaan!,
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
                      job!.lokasiPekerjaan!,
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
                DateFormat("dd/MM/yyyy").format(job!.createdAt!),
                style: poppinsRegular.copyWith(
                    fontSize: 13.sp, color: orangeColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
