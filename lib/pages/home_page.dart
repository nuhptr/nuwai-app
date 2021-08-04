import 'package:flutter/material.dart';
import 'package:nuwai_app/theme.dart';
import 'package:nuwai_app/widget/card_job.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget? header() {
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
                    style: poppinsSemiBold.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "nuhptr_",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: poppinsRegular.copyWith(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 58,
                height: 58,
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

    Widget? decorationImage() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Image.asset(
          "assets/home_image.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: 185,
        ),
      );
    }

    Widget? categoryPerusahaan() {
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
                fontSize: 20,
                color: blackGrayColor,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Pekerjaan yang berbasis corporate",
              style: poppinsRegular.copyWith(
                fontSize: 12,
                color: grayColor,
              ),
            )
          ],
        ),
      );
    }

    Widget? listPekerjaan() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              CardJob(
                title: "Admin IG",
                city: "Pringsewu",
                image: "assets/image_beranda1.png",
              ),
              CardJob(
                title: "Asisten Rumah Tangga",
                city: "Bandar Lampung",
                image: "assets/image_beranda2.png",
              ),
              CardJob(
                title: "Transleter",
                city: "Sukarame",
                image: "assets/image_beranda3.png",
              ),
            ],
          ),
        ),
      );
    }

    Widget? categoryPerorangan() {
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
                fontSize: 20,
                color: blackGrayColor,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "Pekerjaan yang berbasis personal",
              style: poppinsRegular.copyWith(
                fontSize: 12,
                color: grayColor,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            header()!,
            decorationImage()!,
            categoryPerusahaan()!,
            listPekerjaan()!,
            categoryPerorangan()!,
          ],
        ),
      ),
    );
  }
}
