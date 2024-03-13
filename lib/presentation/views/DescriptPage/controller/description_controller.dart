import 'package:flutter/material.dart';
import 'package:spare_parts/presentation/views/spareList/Service/list_service.dart';

class DespController extends ChangeNotifier {
  bool isloading = true;


  var deslist = [];

  void getList({required id}) async {
    try {
      isloading = true;
      notifyListeners();

      var list = await ListService.fetchlist();

      if (list != null) {
        
        deslist = list.where((element) => element.id == id).toList();
        
        notifyListeners();
      }
    } catch (e) {
      print(e);
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
