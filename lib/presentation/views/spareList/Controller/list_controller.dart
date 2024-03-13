import 'package:flutter/material.dart';
import 'package:spare_parts/presentation/views/spareList/Service/list_service.dart';

class ListController extends ChangeNotifier {
  bool isloading = true;


  var sparelist = [];

  void getList({required id}) async {
    try {
      isloading = true;
      notifyListeners();

      var list = await ListService.fetchlist();

      if (list != null) {
        
        sparelist = list.where((element) => element.category?.id == id).toList();
        
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
