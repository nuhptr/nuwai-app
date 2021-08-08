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
  var alamatController = TextEditingController(text: "");

  List<String> statusWarga = ["Indonesia", "Non-Indonesia"];
  String? valWarga;

  List<String> pendidikanWarga = ["SD", "SMP", "SMA", "D3", "S1", "S2", "S3"];
  String? valPendidikan;

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
                  Get.toNamed("/main");
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
                      color: Colors.white,
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
                      color: Colors.white,
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
                      color: Colors.white,
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukan Email',
                    hintStyle: poppinsLight.copyWith(
                      color: Colors.white,
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

    Widget address() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alamat",
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
                  controller: alamatController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukan alamat',
                    hintStyle: poppinsLight.copyWith(
                      color: Colors.white,
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

    // TODO: dropdown menu item
    Widget kewarganegaraan() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kewarganegaraan",
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    elevation: 1,
                    iconEnabledColor: Colors.white,
                    hint: Center(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "pilih kewarganegaraan",
                          style: poppinsRegular.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    isExpanded: true,
                    style: poppinsRegular.copyWith(
                      color: Colors.orange,
                    ),
                    value: valWarga,
                    onChanged: (value) {
                      setState(() {
                        valWarga = value;
                        print(valWarga);
                      });
                    },
                    selectedItemBuilder: (BuildContext context) {
                      return statusWarga.map((value) {
                        return Row(
                          children: [
                            Text(value,
                                style: poppinsRegular.copyWith(
                                    color: Colors.white)),
                          ],
                        );
                      }).toList();
                    },
                    items: statusWarga
                        .map((value) => DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    // TODO: dropdown menu item
    Widget pendidikan() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pendidikan",
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    elevation: 1,
                    iconEnabledColor: Colors.white,
                    hint: Center(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "pilih pendidikan",
                          style: poppinsRegular.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    isExpanded: true,
                    style: poppinsRegular.copyWith(
                      color: Colors.orange,
                    ),
                    value: valPendidikan,
                    onChanged: (value) {
                      setState(() {
                        valPendidikan = value;
                        print(valPendidikan);
                      });
                    },
                    selectedItemBuilder: (BuildContext context) {
                      return pendidikanWarga.map((value) {
                        return Row(
                          children: [
                            Text(value,
                                style: poppinsRegular.copyWith(
                                    color: Colors.white)),
                          ],
                        );
                      }).toList();
                    },
                    items: pendidikanWarga
                        .map((value) => DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                namaLengkap(),
                username(),
                password(),
                email(),
                address(),
                kewarganegaraan(),
                pendidikan(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
