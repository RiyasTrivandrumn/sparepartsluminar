import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_parts/presentation/views/cartpage/Widgets/cart_card.dart';
import 'package:spare_parts/presentation/views/cartpage/cartservice/remove_from_cart.dart';
import 'package:spare_parts/presentation/views/cartpage/controller/cart_controller.dart';
import 'package:spare_parts/utils/text_sizes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<CartController>(context, listen: false).getList();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart",
            style: CustomStyle.CartHeadder,
          ),
          centerTitle: true,
        ),
        body: Consumer<CartController>(
          builder: (context, value, child) {
            if (value.model!.cart!.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/emptyCart.png'),
                  Text(
                    "There is no items in your cart",
                    style: CustomStyle.MediumTextStyle,
                  )
                ],
              );
            } else {
              return Column(children: [
                Expanded(
                  child: Container(
                    child: (value.isLoading == true)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : value.model != null
                            ? ListView.builder(
                                itemCount: value.model!.cart!.length,
                                itemBuilder: (context, index) {
                                  final item = value.model!.cart![index];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: CartCard(
                                      quantity: item.quantity,
                                      
                                      itemId: item.item,
                                      title: item.itemDetails?.itemName ??
                                          "Item Name Not Available",
                                      price: item.itemDetails?.price,
                                      image: item.itemDetails?.itemImage,
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                  'Failed to load cart data',
                                  style: CustomStyle.MediumTextStyle,
                                ),
                              ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                        ),
                      ],
                      border: Border(
                          top:
                              BorderSide(width: 1, color: Colors.grey.shade400),
                          bottom: BorderSide(
                              width: 1, color: Colors.grey.shade400))),
                  height: 70,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total:₹${value.model!.total}",
                        style: CustomStyle.PriceText,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Place Order",
                          style: CustomStyle.MediumTextStyle,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.yellowAccent.shade700),
                        ),
                      )
                    ],
                  ),
                )
              ]);
            }
          },
        ));
  }
}
