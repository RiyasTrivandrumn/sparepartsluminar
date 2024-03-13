import 'package:flutter/material.dart';
import 'package:spare_parts/presentation/views/innerScreens/innerhome/service/api_service.dart';

class CatogoryController extends ChangeNotifier {
  var isLoading = true;

  var catogoryList = [];

  void getCatagory() async {
    try {
      isLoading = true;
      notifyListeners();

      var catogery = await HttpService.fetchproducts();
      

      if (catogery != null) {
        catogoryList = catogery;
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
