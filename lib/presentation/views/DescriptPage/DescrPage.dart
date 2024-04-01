import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_parts/presentation/views/DescriptPage/controller/description_controller.dart';
import 'package:spare_parts/presentation/views/buyNowCheckout/views/buyNow.dart';
import 'package:spare_parts/presentation/views/cartpage/cartservice/add_to_cart.dart';
import 'package:spare_parts/utils/text_sizes.dart';

class DescriptPage extends StatefulWidget {
  final id;
  const DescriptPage({super.key, required this.id});

  @override
  State<DescriptPage> createState() => _DescriptPageState();
}

class _DescriptPageState extends State<DescriptPage> {


  @override
  void setState(VoidCallback fn) {
    print("101");
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
       
      print("1");


    Provider.of<DespController>(context, listen: false).getList(id: widget.id);
    Provider.of<DespController>(context, listen: false).checkItemInCart(id: widget.id);

    print("2");
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Consumer<DespController>(
          builder: (context, value, child) {
            if (value.isloading == true) {
              return Expanded(
                  child: SizedBox(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
            } else {
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: Image.network(
                              "http://10.0.2.2:8000${value.deslist[0].itemImage}")),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          value.deslist[0].itemName,
                          style: CustomStyle.DescriptionTitle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 8),
                        child: Text(
                          value.deslist[0].manufacturer,
                          style: CustomStyle.LargeTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                        ),
                        child: Text("₹" + value.deslist[0].price,
                            style: CustomStyle.PriceText),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "MRP Inclusive of all Taxes",
                          style: CustomStyle.VerySmallTextStyle,
                        ),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "Product Description",
                          style: CustomStyle.ListHeader,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Card(
                          child: Text(
                            value.deslist[0].description,
                            style: CustomStyle.MediumTextStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
        bottomNavigationBar: Container(
            child: Consumer<DespController>(builder: (context, value, child) {
          return Row(
            children: [
              Consumer<DespController>(
                builder: (context, value, child) {
                  return Expanded(
                      flex: 1,
                      child: value.goToCart
                          ? InkWell(
                              onTap: () {

                                Navigator.pushNamed(context, "/CartPage");
                              },
                              child: Container(
                                  height: 60,
                                  child: Center(
                                      child: Text(
                                    "Go to Cart",
                                    style: CustomStyle.DescriptionButton,
                                  ))),
                            )
                          : InkWell(
                              onTap: () async{
                                 await AddToCart.addTo(
                                    id: value.deslist[0].id, context: context);

                                    value.checkItemInCart(id: widget.id);



                              },
                              child: Container(
                                  height: 60,
                                  child: Center(
                                      child: Text(
                                    "Add to Cart",
                                    style: CustomStyle.DescriptionButton,
                                  ))),
                            ));
                },
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ByNowCheckout(
                            image: value.deslist[0].itemImage,
                            title: value.deslist[0].itemName,
                            price: value.deslist[0].price,
                            id: value.deslist[0].id,
                          ),
                        ));
                  },
                  child: Container(
                    color: Colors.yellow.shade700,
                    height: 60,
                    child: Center(
                        child: Text(
                      "Buy Now",
                      style: CustomStyle.DescriptionButton,
                    )),
                  ),
                ),
              )
            ],
          );
        })));
  }
}
