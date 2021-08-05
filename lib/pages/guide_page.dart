import 'package:flutter/material.dart';

import 'package:nuwai_app/theme.dart';

class GuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget body() {
      return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(
            top: 50,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/profile");
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: grayColor,
                      size: 23,
                    ),
                  ),
                  Image.asset(
                    "assets/logo.png",
                    width: 35,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text("Cara Membuka\nLowongan",
                  style: poppinsSemiBold.copyWith(
                    fontSize: 25,
                    color: grayColor,
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                "1. Hubungi No Wa 089674135843 hal ini bertujuan untuk menghindari pembukaan lowongan yang bersifat menipu",
                style: poppinsRegular.copyWith(
                  color: orangeColor,
                  fontSize: 16,
                  height: 1.6,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "2. Sertakan KTP dan data-data pekerjaan yang bisa dilihat di halaman detail pekerjaan",
                style: poppinsRegular.copyWith(
                  color: orangeColor,
                  fontSize: 16,
                  height: 1.6,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "3. Untuk gaji boleh dicantumkan / tidak",
                style: poppinsRegular.copyWith(
                  color: orangeColor,
                  fontSize: 16,
                  height: 1.6,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "4. Pekerjaan bersifat halal dan tidak terpaku dengan bulanan / tetap, contoh : Pencuci Piring untuk 2 jam ",
                style: poppinsRegular.copyWith(
                  color: orangeColor,
                  fontSize: 16,
                  height: 1.6,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "5. Dengan membaca point 1-4 anda menyetujui persyaratan dan persetujuan kami",
                style: poppinsRegular.copyWith(
                  color: orangeColor,
                  fontSize: 16,
                  height: 1.6,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Selamat Mencari Jasa~",
                style: poppinsMedium.copyWith(
                  color: orangeColor,
                  fontSize: 16,
                  height: 1.6,
                ),
                textAlign: TextAlign.start,
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
