import 'package:flutter/material.dart';
import 'package:spare_parts/presentation/views/cartpage/cartservice/add_to_cart.dart';

import 'package:spare_parts/presentation/views/cartpage/cartservice/get_from_cart.dart';
import 'package:spare_parts/presentation/views/cartpage/cartservice/remove_from_cart.dart';
import 'package:spare_parts/presentation/views/cartpage/model/cart_model.dart';

class CartController extends ChangeNotifier {
  bool isLoading = false;

  // List<CartModel> cartlist = [];
  CartModel? model;

  // int itemnumber = 1;

  Future<void> getList() async {
    try {
      isLoading = true;
      notifyListeners();

      var cart = await GetFromCart.getCart();

      if (cart != null) {
        model = cart;
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching cart : $e');
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateCart({id}) async {
    try {
      await Remove.removeitem(id: id);
      await getList();
    } catch (e) {
      print("Error udating cart : $e");
    }
  }

  void increment({required id}) async {
    // if (itemnumber < 10) {
    //   itemnumber++;
    //   notifyListeners();

      try {
        await AddToCart.addTo(id: id);
        await getList();
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  

  void decrement({required id}) async {
    // if (itemnumber > 1) {
    //   itemnumber--;
    //   notifyListeners();

      try {
        await Remove.removeitem(id: id);
        await getList();
      } catch (e) {
        print("Error udating cart : $e");
      }
    }
  }

