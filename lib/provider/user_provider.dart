import 'package:flutter/material.dart';

import '/model/user_model.dart';
import '/services/user_services.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel get user => _user!;
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? name,
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await UserServices().register(
        name: name,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({String? email, String? password}) async {
    try {
      UserModel user = await UserServices().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateProfile({
    num? lamaTerakhirBekerja,
    String? tempatTerakhirBekerja,
    String? posisiTerakhirBekerja,
    String? prestasi,
    String? skill,
    String? pendidikan,
    String? kewarganegaraan,
    String? alamat,
    String? photoProfile,
    String? userToken,
  }) async {
    try {
      UserModel user = await UserServices().updateProfile(
        lamaTerakhirBekerja: lamaTerakhirBekerja,
        tempatTerakhirBekerja: tempatTerakhirBekerja,
        posisiTerakhirBekerja: posisiTerakhirBekerja,
        prestasi: prestasi,
        skill: skill,
        pendidikan: pendidikan,
        kewarganegaraan: kewarganegaraan,
        alamat: alamat,
        photoProfile: photoProfile,
        userToken: userToken!,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout(String? token) async {
    try {
      await UserServices().logout(token: token);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
