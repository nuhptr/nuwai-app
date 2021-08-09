import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nuwai_app/theme.dart';
import 'package:nuwai_app/widget/text_field_editprofile.dart';

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
  var skillController = TextEditingController(text: "");
  var prestasiController = TextEditingController(text: "");
  var posisiTerakhirController = TextEditingController(text: "");
  var lamaTerakhirBekerjaController = TextEditingController(text: "");
  var tempatTerakhirBekerjaController = TextEditingController(text: "");

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
      return TextFieldWidget(
        top: 30,
        name: "Nama",
        hintText: "Masukan namamu",
        textEditingController: nameController,
        inputType: TextInputType.name,
      );
    }

    Widget username() {
      return TextFieldWidget(
        name: "Username",
        hintText: "Masukan username",
        textEditingController: usernameController,
        inputType: TextInputType.text,
      );
    }

    Widget password() {
      return TextFieldWidget(
        name: "Password",
        hintText: "Masukan Password",
        textEditingController: passwordController,
        obsecureText: true,
      );
    }

    Widget email() {
      return TextFieldWidget(
        name: "Email",
        hintText: "Masukan Email",
        textEditingController: emailController,
        inputType: TextInputType.emailAddress,
      );
    }

    Widget address() {
      return TextFieldWidget(
        name: "Alamat",
        hintText: "Masukan Alamat",
        textEditingController: alamatController,
        inputType: TextInputType.text,
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

    Widget skill() {
      return TextFieldWidget(
        name: "Keahlian",
        hintText: "Masukan Keahlianmu (optional)",
        textEditingController: skillController,
      );
    }

    Widget prestasi() {
      return TextFieldWidget(
        name: "Prestasi",
        hintText: "Prestasi yang pernah dicapai",
        textEditingController: prestasiController,
      );
    }

    Widget posisiTerakhir() {
      return TextFieldWidget(
        name: "Posisi Terakhir",
        hintText: "Posisi terakhirmu (optional)",
        textEditingController: posisiTerakhirController,
      );
    }

    Widget lamaTerakhirBekerja() {
      return TextFieldWidget(
        name: "Lama Terakhir Bekerja",
        hintText: "Masukan durasi terakhir bekerja (optional)",
        textEditingController: lamaTerakhirBekerjaController,
      );
    }

    Widget tempatTerakhirBekerja() {
      return TextFieldWidget(
        name: "Tempat Terakhir Bekerja",
        hintText: "Masukan Tempat terakhir bekerja (optional)",
        textEditingController: tempatTerakhirBekerjaController,
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
                skill(),
                prestasi(),
                posisiTerakhir(),
                lamaTerakhirBekerja(),
                tempatTerakhirBekerja(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
