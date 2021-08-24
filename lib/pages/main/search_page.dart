import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuwai_app/model/job_model.dart';
import 'package:nuwai_app/provider/job_provider.dart';
import 'package:provider/provider.dart';

import '/theme.dart';
import '/widget/card_job_perorangan.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchController = TextEditingController(text: "");

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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: searchController,
                  onChanged: (text) {
                    text = text.toLowerCase();
                    setState(() {
                      // TODO: Menyesuaikan text dengan data API
                    });
                  },
                  style: poppinsRegular.copyWith(
                    fontSize: 14.sp,
                    color: blackGrayColor,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: "Cari pekerjaan",
                    hintStyle: poppinsRegular.copyWith(fontSize: 14.sp),
                  ),
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
        future: jobProvider.getAllJobs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 145),
              children: snapshot.data!
                  .map((job) => CardJobPerorangan(job: job))
                  .toList(),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
