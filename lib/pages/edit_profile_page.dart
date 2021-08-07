import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nuwai_app/theme.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var nameController = TextEditingController(text: "");
  var usernameController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
          margin: EdgeInsets.only(
            top: 50,
            bottom: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // TODO: save data ke database lewat API, efek loading
                },
                child: Icon(
                  Icons.check,
                  size: 28,
                  color: orangeColor,
                ),
              )
            ],
          ));
    }

    Widget namaLengkap() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Lengkap",
              style: poppinsRegular.copyWith(fontSize: 15, color: grayColor),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: orangeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextFormField(
                  style: poppinsRegular.copyWith(color: Colors.white),
                  controller: nameController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukan Nama Lengkap',
                    hintStyle: poppinsLight.copyWith(
                      color: Colors.white38,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget username() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: poppinsRegular.copyWith(fontSize: 15, color: grayColor),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: orangeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextFormField(
                  style: poppinsRegular.copyWith(color: Colors.white),
                  controller: usernameController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukan Username',
                    hintStyle: poppinsLight.copyWith(
                      color: Colors.white38,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget password() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: poppinsRegular.copyWith(fontSize: 15, color: grayColor),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: orangeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextFormField(
                  style: poppinsRegular.copyWith(color: Colors.white),
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukan Password',
                    hintStyle: poppinsLight.copyWith(
                      color: Colors.white38,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget email() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: poppinsRegular.copyWith(fontSize: 15, color: grayColor),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: orangeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextFormField(
                  style: poppinsRegular.copyWith(color: Colors.white),
                  controller: emailController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukan Email',
                    hintStyle: poppinsLight.copyWith(
                      color: Colors.white38,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            namaLengkap(),
            username(),
            password(),
            email(),
          ],
        ),
      ),
    );
  }
}
