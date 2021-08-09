import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:nuwai_app/theme.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: function show dialog
    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Konfirmasi',
                style: poppinsMedium,
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text(
                      'Apakah kamu ingin melamar pekerjaan ini?',
                      style: poppinsRegular.copyWith(color: blackGrayColor),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Batal'),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed("/success");
                  },
                  child: Text('Iya'),
                )
              ],
            );
          });
    }

    Widget header() {
      return Container(
        width: double.infinity,
        height: 370,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/detail_image.png"),
          fit: BoxFit.cover,
        )),
      );
    }

    Widget logo() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  "assets/icon_arrow_left.png",
                  width: 13,
                )),
            Image.asset(
              "assets/logo.png",
              width: 50,
              fit: BoxFit.cover,
            )
          ],
        ),
      );
    }

    Widget content() {
      // TODO: lost the glowing light overscroll
      return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: ListView(
          children: [
            SizedBox(
              height: 300,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icon_company.png",
                                width: 28,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "Bank Bni",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: poppinsMedium.copyWith(
                                    fontSize: 14, color: yellowColor),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "Pringsewu",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: poppinsMedium.copyWith(
                            fontSize: 14,
                            color: grayColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Admin IG",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: poppinsSemiBold.copyWith(
                                fontSize: 30, color: orangeColor, height: 1.25),
                          ),
                        ),
                        Text(
                          "tersedia sampai",
                          style: poppinsLight.copyWith(
                              fontSize: 15, color: grayColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Gaji Rp. 300.000",
                            style: poppinsRegular.copyWith(
                              color: orangeColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Text(
                            DateFormat("MM/dd/y")
                                .format(DateTime.now())
                                .toString(),
                            style: poppinsSemiBold.copyWith(
                              fontSize: 14,
                              color: grayColor,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deskripsi Pekerjaan",
                          style: poppinsMedium.copyWith(
                            fontSize: 16,
                            color: orangeColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Anda disini ditugaskan menjadi admin instagram bank BNI. Bisa kerja dari rumah maupun di kantor, setiap pekerjaan akan kami awasi kinerjanya.\n\n- Requirement :\n1.  Mengerti tentang Teknologi terutama sosmed\n2. fast respon\n3. Menjawab setiap keluhan yang nasabah\najukan ke akun instagram",
                          style: poppinsRegular.copyWith(
                              color: blackGrayColor, height: 1.5),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Tentang Perusahaan",
                          style: poppinsMedium.copyWith(
                            fontSize: 16,
                            color: orangeColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Bank Negara Indonesia atau BNI adalah sebuah institusi bank milik pemerintah, dalam hal ini adalah perusahaan BUMN, di Indonesia. Dalam struktur manajemen organisasinya, Bank Negara Indonesia, dipimpin oleh seorang Direktur Utama yang saat ini dijabat oleh Royke Tumilar.",
                          style: poppinsRegular.copyWith(
                              color: blackGrayColor, height: 1.5),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Container(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: orangeColor,
                              ),
                              onPressed: () async {
                                // TODO: return dialog
                                await showConfirmation();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Lamar",
                                    style: poppinsMedium.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Image.asset(
                                    "assets/icon_arrow_right.png",
                                    width: 8,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            header(),
            content(),
            logo(),
          ],
        ),
      ),
    );
  }
}
