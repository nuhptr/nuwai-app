import 'package:flutter/material.dart';

import 'package:nuwai_app/model/work_model.dart';
import 'package:nuwai_app/services/work_services.dart';

class WorkProvider with ChangeNotifier {
  WorkModel? _workModel;

  WorkModel get workModel => _workModel!;
  set workModel(WorkModel newValue) {
    _workModel = newValue;
  }

  Future<bool> submitLamaran({int? idPekerjaan, String? userToken}) async {
    try {
      WorkModel workModel = await WorkServices().submitJobs(
        idPekerjaan: idPekerjaan,
        userToken: userToken,
      );

      _workModel = workModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
