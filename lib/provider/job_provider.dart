import 'package:flutter/material.dart';
import 'package:nuwai_app/model/job_model.dart';
import 'package:nuwai_app/services/job_services.dart';

class JobProvider with ChangeNotifier {
  List<JobModel>? _job = [];

  List<JobModel> get jobs => _job!;
  set jobs(List<JobModel> jobs) {
    _job = jobs;
    notifyListeners();
  }

  Future<List<JobModel>> getJobByCategory(String category) async {
    try {
      List<JobModel>? job = await JobServices().getJobByCategory(category);
      _job = job;

      return job;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<JobModel>> searchJobs(String result) async {
    try {
      List<JobModel>? job = await JobServices().searchJob(result);
      _job = job;

      return job;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
