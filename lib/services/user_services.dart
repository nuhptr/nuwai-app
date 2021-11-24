import 'dart:convert';
import 'package:http/http.dart' as http;

import '/model/user_model.dart';

class UserServices {
  String baseUrl = 'https://nulungguwai.com/api';

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
    var url = '$baseUrl/user';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': userToken!,
    };

    uploadFile(String? filename) async {
      var uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll({'Authorization': userToken});

      request.files.add(await http.MultipartFile.fromPath('file', filename!));
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image Uploaded');
      } else {
        print('image nothing');
      }
    }

    var body = jsonEncode({
      'tempat_terakhir_bekerja': tempatTerakhirBekerja,
      'posisi_terakhir_bekerja': posisiTerakhirBekerja,
      'prestasi': prestasi,
      'skill': skill,
      'pendidikan': pendidikan,
      "kewarganegaraan": kewarganegaraan,
      'alamat': alamat,
      'file': uploadFile(photoProfile),
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

      return user;
    } else {
      throw Exception('gagal update data');
    }
  }

  Future<void> logout({String? token}) async {
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);
  }
}
