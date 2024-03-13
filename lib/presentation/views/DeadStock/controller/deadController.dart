import 'package:flutter/material.dart';
import 'package:spare_parts/presentation/views/DeadStock/model/deadmodel.dart';
import 'package:spare_parts/presentation/views/DeadStock/service/dead_service.dart';

class DeadController extends ChangeNotifier {
  bool isLoading = true;

  List<DeadModel> deadlist = [];

  void getList() async {
    try {
      isLoading = true;
      notifyListeners();

      var list = await DeadService.fetchdead();

      if (list != null) {
        deadlist = list;

        notifyListeners();
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
