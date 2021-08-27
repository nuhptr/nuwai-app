import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuwai_app/model/job_model.dart';
import 'package:nuwai_app/pages/detail_page.dart';
import 'package:nuwai_app/provider/job_provider.dart';
import 'package:nuwai_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/theme.dart';
import '/widget/card_job_perorangan.dart';
import '/widget/card_job_perusahaan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loginStatus();
  }

  loginStatus() async {
    var pref = await SharedPreferences.getInstance();
    if (pref.getString('token') == null) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

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
                    userProvider.user.name!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: poppinsSemiBold.copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    userProvider.user.email!,
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
                  image: NetworkImage(userProvider.user.photoProfile!),
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
        child: Image.asset(
          "assets/home_image.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: 160.h,
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
      return FutureBuilder<List<JobModel>?>(
          future: jobProvider.getJobByCategory('Perusahaan'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
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
                      Row(
                        children: snapshot.data!
                            .map((job) => CardJobPerusahaan(
                                  job: job,
                                  ontap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(job),
                                        ));
                                  },
                                ))
                            .take(4)
                            .toList(),
                      )
                    ],
                  ),
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.only(top: 20, bottom: 30),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          });
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
      return FutureBuilder<List<JobModel>?>(
          future: jobProvider.getJobByCategory('Perorangan'),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                margin: EdgeInsets.only(top: 20, bottom: 70),
                child: Column(
                  children: snapshot.data!
                      .map((job) => CardJobPerorangan(job: job))
                      .take(4)
                      .toList(),
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          });
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
