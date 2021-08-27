import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nuwai_app/provider/job_provider.dart';
import 'package:provider/provider.dart';

import '/provider/user_provider.dart';
import '/model/job_model.dart';
import '/provider/work_provider.dart';
import '/theme.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.jobModel);

  final JobModel? jobModel;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool? isLoading = false;

  @override
  Widget build(BuildContext context) {
    WorkProvider workProvider = Provider.of<WorkProvider>(context);
    JobProvider jobProvider = Provider.of<JobProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);

    handleSubmit() async {
      setState(() {
        isLoading = true;
      });

      // TODO: handle submit
      if (await workProvider.submitLamaran(
        idPekerjaan: jobProvider.jobs[0].id,
        userToken: userProvider.user.token,
      )) {
        Navigator.pushNamed(context, '/success');
      }

      setState(() {
        isLoading = false;
      });
    }

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
                child: isLoading!
                    ? CircularProgressIndicator()
                    : ListBody(
                        children: [
                          Text(
                            'Apakah kamu ingin melamar pekerjaan ini?',
                            style:
                                poppinsRegular.copyWith(color: blackGrayColor),
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
                  // TODO: Jika tombol ditekan panggil function handleSubmit
                  onPressed: handleSubmit,
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
          image: NetworkImage(
            widget.jobModel!.fotoLowongan == null
                ? 'https://www.betterteam.com/i/job-descriptions-960x480-20171117.png'
                : widget.jobModel!.fotoLowongan!,
          ),
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
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/icon_arrow_left.png",
                  width: 13,
                )),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  // TODO: conditional if image null
                  Image.network(
                widget.jobModel!.logoPerusahaanPath == null
                    ? 'https://images.template.net/wp-content/uploads/2017/04/Logo-Design1.jpg?width=584'
                    : widget.jobModel!.logoPerusahaanPath!,
                width: 50,
                height: 40,
                fit: BoxFit.cover,
              ),
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
                                widget.jobModel!.namaPerusahaan!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: poppinsMedium.copyWith(
                                    fontSize: 14, color: yellowColor),
                              )
                            ],
                          ),
                        ),
                        Text(
                          widget.jobModel!.lokasiPekerjaan!,
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
                            widget.jobModel!.namaPekerjaan!,
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
                            NumberFormat.currency(
                                    locale: "id_ID",
                                    decimalDigits: 0,
                                    symbol: "IDR ")
                                .format(widget.jobModel!.gaji!),
                            style: poppinsRegular.copyWith(
                              color: orangeColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Text(
                            DateFormat("dd/MM/y")
                                .format(
                                    widget.jobModel!.tenggangWaktuPekerjaan!)
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
                          // TODO: non null
                          widget.jobModel!.deskripsi!,
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
                          widget.jobModel!.tentangPembukaLowongan == null
                              ? 'Tidak Ada Tentang Perusahaan'
                              : widget.jobModel!.tentangPembukaLowongan!,
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
                                    "assets/icon_arrow_right_white.png",
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
