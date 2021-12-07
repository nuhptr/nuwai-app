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
  bool? isLoading = false;
  XFile? imageFile;
  XFile? cvFileImage;

  // TODO: not enabled
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  // TODO: get image Photo from gallery
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

  // TODO: get image cv from gallery
  Future getImageCvFromGallery() async {
    var cvFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      if (cvFile != null) {
        cvFileImage = cvFile;
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    // TODO: enabled
    var alamatController = TextEditingController(text: "");

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

              if (alamatController.text.trim() == "") {
                showError("Field masih ada yang kosong!", context);
              } else if (imageFile == null) {
                showError("Masukan Foto Profile", context);
              } else {
                await userProvider.updateProfile(
                  cvPath: cvFileImage!.path,
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
        name: "Alamat Lengkap",
        hintText: userProvider.user.alamat ?? "Masukan Alamat",
        textEditingController: alamatController,
        inputType: TextInputType.text,
      );
    }

    Widget fotoCv() {
      return Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Container(
            height: 35.h,
            child: ElevatedButton(
              onPressed: () {
                getImageCvFromGallery();
              },
              style: ElevatedButton.styleFrom(
                primary: orangeColor,
              ),
              child: Text(
                "Upload Cv",
                style: poppinsMedium,
              ),
            ),
          )
        ],
      );
    }

    Widget showImageCV() {
      return Container(
          margin: EdgeInsets.only(top: 18),
          height: 200.h,
          width: 160.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: cvFileImage == null
                    ? NetworkImage(userProvider.user.cvPath!)
                    : FileImage(File(cvFileImage!.path)) as ImageProvider),
          ));
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
                fotoCv(),
                showImageCV(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
