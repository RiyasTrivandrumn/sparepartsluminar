import 'package:flutter/material.dart';
import 'package:spare_parts/presentation/views/cartpage/cartservice/get_from_cart.dart';
import 'package:spare_parts/presentation/views/cartpage/model/cart_model.dart';
import 'package:spare_parts/presentation/views/spareList/Service/list_service.dart';

class DespController extends ChangeNotifier {
  bool isloading = true;

  bool goToCart = false;

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

  void checkItemInCart({required id}) async {
    goToCart = false;
    notifyListeners();

    try {
      CartModel cartdata = await GetFromCart.getCart();

      goToCart = cartdata.cart!.any((item) => item.item == id);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
