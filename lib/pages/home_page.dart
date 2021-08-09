import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/theme.dart';
import '/widget/card_job_perorangan.dart';
import '/widget/card_job_perusahaan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Adi Nugraha Putra",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: poppinsSemiBold.copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "nuhptr_",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: poppinsRegular.copyWith(
                      fontSize: 16.sp,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 55.w,
                height: 55.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/people_model.png"),
                  fit: BoxFit.cover,
                )),
              ),
            )
          ],
        ),
      );
    }

    Widget decorationImage() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Stack(
          children: [
            Image.asset(
              "assets/home_bg.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 160.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 130.w,
                    height: 130.h,
                    child: Lottie.asset(
                      "assets/lottie/work.json",
                      fit: BoxFit.cover,
                      repeat: true,
                      animate: true,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 18,
                  ),
                  child: Text(
                    "Cari\nPekerjaanmu\nHari Ini~",
                    style: poppinsSemiBold.copyWith(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget categoryPerusahaan() {
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
              "Perusahaan",
              style: poppinsMedium.copyWith(
                fontSize: 20.sp,
                color: blackGrayColor,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Pekerjaan yang berbasis corporate",
              style: poppinsRegular.copyWith(
                fontSize: 12.sp,
                color: grayColor,
              ),
            )
          ],
        ),
      );
    }

    Widget listPekerjaan() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin.w,
              ),
              CardJobPerusahaan(
                title: "Admin IG",
                city: "Pringsewu",
                image: "assets/image_beranda1.png",
                ontap: () {
                  Get.toNamed("/detail");
                },
              ),
              CardJobPerusahaan(
                title: "Asisten Rumah Tangga",
                city: "Bandar Lampung",
                image: "assets/image_beranda2.png",
              ),
              CardJobPerusahaan(
                title: "Transleter",
                city: "Sukarame",
                image: "assets/image_beranda3.png",
              ),
            ],
          ),
        ),
      );
    }

    Widget categoryPerorangan() {
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
              "Perorangan",
              style: poppinsMedium.copyWith(
                fontSize: 20.sp,
                color: blackGrayColor,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Pekerjaan yang berbasis personal",
              style: poppinsRegular.copyWith(
                fontSize: 12.sp,
                color: grayColor,
              ),
            )
          ],
        ),
      );
    }

    Widget listPekerjaanPerorangan() {
      return Container(
        margin: EdgeInsets.only(top: 30, bottom: 30),
        child: Column(
          children: [
            CardJobPerorangan(
              name: "Staff Toko Bangunan",
              city: "Tanjung Karang",
              time: DateTime.now(),
            ),
            CardJobPerorangan(
              name: "Kasir Indomaret",
              city: "Gadingrejo",
              time: DateTime.now(),
            ),
            CardJobPerorangan(
              name: "Admin IG Toko Online",
              city: "Tanggamus",
              time: DateTime.now(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            header(),
            decorationImage(),
            categoryPerusahaan(),
            listPekerjaan(),
            categoryPerorangan(),
            listPekerjaanPerorangan(),
          ],
        ),
      ),
    );
  }
}
