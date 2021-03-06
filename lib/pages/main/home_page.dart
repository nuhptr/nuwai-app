import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '/model/job_model.dart';
import '/pages/detail_page.dart';
import '/provider/job_provider.dart';
import '/provider/user_provider.dart';
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
    var userProvider = Provider.of<UserProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    List? imageSlider = [
      "https://image.freepik.com/free-vector/agenda-job-organization-schedule_107791-1848.jpg",
      "https://img.freepik.com/free-vector/businessman-planning-events-deadlines-agenda-calendar-schedule-organization-process-web-template_74855-8953.jpg?size=338&ext=jpg",
      "https://image.freepik.com/free-vector/businessman-planning-events-deadlines-agenda_74855-6908.jpg"
    ];

    Future<void> refreshList() async {
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        Provider.of<JobProvider>(context, listen: false)
            .getJobByCategory('Perorangan');
        Provider.of<JobProvider>(context, listen: false)
            .getJobByCategory('Perusahaan');
        Provider.of<UserProvider>(context, listen: false).user;
      });
    }

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
                    style: poppinsSemiBold.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    userProvider.user.email!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: poppinsRegular.copyWith(
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(userProvider.user.photoProfile!),
                    fit: BoxFit.cover,
                  )),
            )
          ],
        ),
      );
    }

    Widget decorationImage() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          bottom: 5,
        ),
        width: double.infinity,
        child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: true,
              pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              viewportFraction: 0.95,
            ),
            items: imageSlider
                .map((item) => Center(
                      child: Container(
                          width: double.infinity,
                          height: 160.h,
                          margin: EdgeInsets.only(left: 5, right: 5),
                          child: Image.network(
                            item,
                            fit: BoxFit.contain,
                          )),
                    ))
                .toList()),
      );
    }

    Widget categoryPerusahaan() {
      return Container(
        margin: EdgeInsets.only(
          top: 5,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Perusahaan",
              style: poppinsMedium.copyWith(
                fontSize: 16.sp,
                color: blackGrayColor,
              ),
            ),
            SizedBox(
              height: 2.h,
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
                                    print(job.id);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(job),
                                        ));
                                  },
                                ))
                            .take(5)
                            .toList(),
                      )
                    ],
                  ),
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.only(top: 20, bottom: 30),
              child: const Center(
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
                fontSize: 16.sp,
                color: blackGrayColor,
              ),
            ),
            SizedBox(
              height: 2.h,
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
                      .map((job) => CardJobPerorangan(
                            job: job,
                            ontap: () {
                              // print(job.id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(job)));
                            },
                          ))
                      .take(3)
                      .toList(),
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification? overscroll) {
            overscroll!.disallowIndicator();
            return true;
          },
          child: RefreshIndicator(
            onRefresh: () => refreshList(),
            edgeOffset: 1,
            backgroundColor: Colors.white,
            color: Colors.orange[400],
            child: ListView(
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
        ),
      ),
    );
  }
}
