import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '/properties.dart';
import '/provider/user_provider.dart';
import '/theme.dart';
import '/widget/text_field_editprofile.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<String> statusWarga = ["Indonesia", "Non-Indonesia"];
  String? valWarga;

  List<String> pendidikanWarga = ["SD", "SMP", "SMA", "D3", "S1", "S2", "S3"];
  String? valPendidikan;

  bool? isLoading = false;
  XFile? imageFile;

  // TODO: not enabled
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  // TODO: get image from gallery
  Future getImageFromGallery() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      if (image != null) {
        imageFile = image;
      } else {
        print('No image selected');
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    // TODO: enabled
    var alamatController =
        TextEditingController(text: userProvider.user.alamat);
    var skillController = TextEditingController(text: userProvider.user.skill);
    var prestasiController =
        TextEditingController(text: userProvider.user.prestasi);
    var posisiTerakhirController =
        TextEditingController(text: userProvider.user.posisiTerakhirBekerja);
    var tempatTerakhirBekerjaController =
        TextEditingController(text: userProvider.user.tempatTerakhirBekerja);

    header() {
      return AppBar(
        backgroundColor: orangeColor,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_new_rounded),
          onTap: () {
            Navigator.pushNamed(context, "/main");
          },
        ),
        title: Text(
          "Edit Profil",
          style: poppinsMedium.copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                isLoading = true;
              });

              if (alamatController.text.trim() == "" ||
                  skillController.text.trim() == "" ||
                  prestasiController.text.trim() == "" ||
                  valWarga == "" ||
                  valPendidikan == "") {
                showError("Field masih ada yang kosong!", context);
              } else if (imageFile == null) {
                showError("Masukan Foto Profile", context);
              } else {
                await userProvider.updateProfile(
                  tempatTerakhirBekerja: tempatTerakhirBekerjaController.text,
                  posisiTerakhirBekerja: posisiTerakhirController.text,
                  prestasi: prestasiController.text,
                  skill: skillController.text,
                  pendidikan: valPendidikan,
                  kewarganegaraan: valWarga,
                  alamat: alamatController.text,
                  photoProfile: imageFile!.path,
                  userToken: userProvider.user.token,
                );

                showSuccess("Profil Terupdate", context);
              }
            },
            icon: Icon(Icons.check),
          )
        ],
      );
    }

    Widget fotoProfileEdited() {
      return Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              width: 140.w,
              height: 140.h,
              // margin: ,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageFile == null
                        ? NetworkImage(userProvider.user.photoProfile!)
                        : FileImage(File(imageFile!.path)) as ImageProvider,
                    fit: BoxFit.cover,
                  )),
              child: Align(
                child: GestureDetector(
                  onTap: () {
                    // TODO: button add photo from gallery
                    getImageFromGallery();
                  },
                  child: Image.asset("assets/btn_add.png", width: 35.w),
                ),
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
        ],
      );
    }

    Widget namaLengkap() {
      return TextFieldWidget(
        top: 30,
        name: "Nama",
        enabled: false,
        hintText: userProvider.user.name ?? "Masukan namamu",
        textEditingController: nameController,
        inputType: TextInputType.name,
      );
    }

    Widget email() {
      return TextFieldWidget(
        name: "Email",
        enabled: false,
        hintText: userProvider.user.email,
        textEditingController: emailController,
        inputType: TextInputType.emailAddress,
      );
    }

    Widget address() {
      return TextFieldWidget(
        name: "Alamat",
        hintText: userProvider.user.alamat ?? "Masukan Alamat",
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
              style: poppinsRegular.copyWith(fontSize: 15.sp, color: grayColor),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 45.h,
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
                          userProvider.user.kewarganegaraan ??
                              "pilih kewarganegaraan",
                          style: poppinsRegular.copyWith(
                            color: Colors.white,
                            fontSize: 14.sp,
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
              style: poppinsRegular.copyWith(fontSize: 15.sp, color: grayColor),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 45.h,
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
                          userProvider.user.pendidikan ?? "pilih pendidikan",
                          style: poppinsRegular.copyWith(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    isExpanded: true,
                    style: poppinsRegular.copyWith(color: Colors.orange),
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
        hintText: userProvider.user.skill ?? "Masukan Keahlianmu",
        textEditingController: skillController,
      );
    }

    Widget prestasi() {
      return TextFieldWidget(
        name: "Prestasi",
        hintText: userProvider.user.prestasi ?? "Prestasi yang pernah dicapai",
        textEditingController: prestasiController,
      );
    }

    Widget posisiTerakhir() {
      return TextFieldWidget(
        name: "Posisi Terakhir",
        hintText: userProvider.user.posisiTerakhirBekerja ??
            "Posisi terakhirmu (optional)",
        textEditingController: posisiTerakhirController,
      );
    }

    Widget tempatTerakhirBekerja() {
      return TextFieldWidget(
        name: "Tempat Terakhir Bekerja",
        hintText: userProvider.user.tempatTerakhirBekerja ??
            "Masukan Tempat terakhir bekerja (optional)",
        textEditingController: tempatTerakhirBekerjaController,
      );
    }

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: header(),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fotoProfileEdited(),
                namaLengkap(),
                email(),
                address(),
                kewarganegaraan(),
                pendidikan(),
                skill(),
                prestasi(),
                posisiTerakhir(),
                tempatTerakhirBekerja(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
