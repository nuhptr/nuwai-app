import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

import '/provider/job_provider.dart';
import '/model/job_model.dart';
import '/pages/detail_page.dart';
import '/theme.dart';
import '/widget/card_job_perorangan.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchController = TextEditingController(text: "");
  String? searchResult = '';
  bool? isSearch = false;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);

    Widget header() {
      return Container(
        height: 45.h,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 40,
          left: defaultMargin,
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: bottomNavColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: searchController,
                  style: poppinsRegular.copyWith(
                    fontSize: 14.sp,
                    color: blackGrayColor,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: "Cari Pekerjaan",
                    hintStyle: poppinsRegular.copyWith(fontSize: 14.sp),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              IconButton(
                iconSize: 20,
                splashColor: Colors.transparent,
                onPressed: () {
                  // TODO: call the api
                  setState(() {
                    isSearch = true;
                    searchResult = searchController.text;
                  });
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.orange,
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: header(),
      body: FutureBuilder<List<JobModel>?>(
        future: jobProvider.searchJobs(searchResult!),
        builder: (context, snapshot) {
          if (isSearch! && snapshot.connectionState == ConnectionState.done) {
            return ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 145),
              children: snapshot.data!
                  .map((job) => CardJobPerorangan(
                        job: job,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(job)));
                        },
                      ))
                  .toList(),
            );
          } else {
            return Center(
              child: Container(
                width: 200.w,
                height: 200.w,
                child: Lottie.asset(
                  'assets/lottie/search.json',
                  repeat: true,
                  animate: true,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
