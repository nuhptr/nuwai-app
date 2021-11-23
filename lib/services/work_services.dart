import 'dart:convert';
import 'package:http/http.dart' as http;

import '/model/work_model.dart';

class WorkServices {
  String baseUrl = 'https://nulungguwai.com/api';

  // TODO: Post the id of jobs with users id
  Future<WorkModel> submitJobs({int? idPekerjaan, String? userToken}) async {
    var url = '$baseUrl/lamaran?id_pekerjaan=$idPekerjaan';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': userToken!,
    };
    var body = jsonEncode({'id_pekerjaan': idPekerjaan});

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      WorkModel workModel = WorkModel.fromJson(data);

      return workModel;
    } else {
      throw Exception('Gagal Submit Pekerjaan');
    }
  }
}
