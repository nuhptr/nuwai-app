import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nuwai_app/model/job_model.dart';

class JobServices {
  String baseUrl = 'http://192.168.43.108:8000/api';

  // TODO: get all job
  Future<List<JobModel>?> getJobs() async {
    var url = '$baseUrl/jobs';
    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<JobModel>? job = [];

      for (var item in data) {
        job.add(JobModel.fromJson(item));
      }

      return job;
    } else {
      throw Exception('Gagal Get Jobs');
    }
  }

  // TODO: get job by category
  Future<List<JobModel>?> getJobByCategory(String? category) async {
    var url = '$baseUrl/jobs?kategori=$category';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<JobModel>? job = [];

      for (var item in data) {
        job.add(JobModel.fromJson(item));
      }

      return job;
    } else {
      throw Exception('Gagal get kategori pekerjaan');
    }
  }
}
