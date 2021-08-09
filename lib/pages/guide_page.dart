import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/theme.dart';

class GuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget body() {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(
            top: 60,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/main");
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: grayColor,
                      size: 23,
                    ),
                  ),
                  Image.asset(
                    "assets/logo.png",
                    width: 35.w,
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Text("Cara Membuka\nLowongan",
                  style: poppinsSemiBold.copyWith(
                    fontSize: 25.sp,
                    color: grayColor,
                  )),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "1. Hubungi No Wa 089674135843 hal ini bertujuan untuk menghindari pembukaan lowongan yang bersifat menipu",
                style: poppinsMedium.copyWith(
                  color: orangeColor,
                  fontSize: 16.sp,
                  height: 1.6,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "2. Sertakan KTP dan data-data pekerjaan yang bisa dilihat di halaman detail pekerjaan",
                style: poppinsMedium.copyWith(
                  color: orangeColor,
                  fontSize: 16.sp,
                  height: 1.6,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "3. Untuk gaji boleh dicantumkan / tidak",
                style: poppinsMedium.copyWith(
                  color: orangeColor,
                  fontSize: 16.sp,
                  height: 1.6,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "4. Pekerjaan bersifat halal dan tidak terpaku dengan bulanan / tetap, contoh : Pencuci Piring untuk 2 jam ",
                style: poppinsMedium.copyWith(
                  color: orangeColor,
                  fontSize: 16.sp,
                  height: 1.6,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "5. Dengan membaca point 1-4 anda menyetujui persyaratan dan persetujuan kami",
                style: poppinsMedium.copyWith(
                  color: orangeColor,
                  fontSize: 16,
                  height: 1.6,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Selamat Mencari Jasa~",
                style: poppinsMedium.copyWith(
                  color: orangeColor,
                  fontSize: 16.sp,
                  height: 1.6,
                ),
                textAlign: TextAlign.start,
              )
            ],
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: body(),
      ),
    );
  }
}
