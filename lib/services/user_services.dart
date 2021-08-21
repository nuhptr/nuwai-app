import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nuwai_app/model/user_model.dart';

class UserServices {
  String baseUrl = 'http://192.168.43.108:8000/api';

  // TODO: user melakukan register
  Future<UserModel> register({
    String? name,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('User Gagal Register');
    }
  }

  // TODO: user melakukan login
  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('User Gagal Login');
    }
  }

  // TODO: user melakukan update profile
  Future<UserModel> updateProfile({
    String? name,
    String? email,
    String? password,
    double? lamaTerakhirBekerja,
    String? tempatTerakhirBekerja,
    String? posisiTerakhirBekerja,
    String? prestasi,
    String? skill,
    String? pendidikan,
    String? kewarganegaraan,
    String? alamat,
    String? photoProfile,
    UserModel? user,
  }) async {
    var url = '$baseUrl/user';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': user!.token!,
    };
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'lama_terakhir_bekerja': lamaTerakhirBekerja,
      'tempat_terakhir_bekerja': tempatTerakhirBekerja,
      'posisi_terakhir_bekerja': posisiTerakhirBekerja,
      'prestasi': prestasi,
      'skill': skill,
      'pendidikan': pendidikan,
      "kewarganegaraan": kewarganegaraan,
      'alamat': alamat,
      'profile_photo_url': photoProfile,
    });

    var response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);

      return user;
    } else {
      throw Exception('gagal update data');
    }
  }
}
