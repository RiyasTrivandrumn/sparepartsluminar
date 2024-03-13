import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:spare_parts/global/custom_appbar.dart';
import 'package:spare_parts/presentation/views/cartpage/controller/cart_controller.dart';
import 'package:spare_parts/presentation/views/innerScreens/drawer.dart';
import 'package:spare_parts/presentation/views/innerScreens/innerhome/Controller/catogoryController.dart';
import 'package:spare_parts/utils/inner_screen_catogory.dart';
import 'package:spare_parts/utils/text_sizes.dart';
import 'package:spare_parts/presentation/views/innerScreens/innerhome/widgets/gridcard.dart';

class InnerHome extends StatelessWidget {
  const InnerHome({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<CatogoryController>(context, listen: false).getCatagory();
    Provider.of<CartController>(context, listen: false).getList();

    return Scaffold(
        drawer: Drawerbar(),
        appBar: AppBar(
          toolbarHeight: 70,
          // leading: IconButton(
          //     onPressed: () {
          //       Drawerbar();
          //     },
          //     icon: Icon(Icons.menu)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good day forShopping",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text("Riyas F",
                  style: TextStyle(color: Colors.white, fontSize: 20))
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -3, end: 0),
                badgeContent: Consumer<CartController>(
                  builder: (context, value, child) {
                    return Text(value.model!.cart!.length.toString());
                  },
                ),
                child: IconButton(
                  onPressed: () {

                    Navigator.of(context).pushNamed("/CartPage");
                    // Add your onPressed action here
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Search item",
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 30,
                          ))),
                ),
              ),
              Text(
                "Main Catogories",
                style: CustomStyle.LargeTextStyle,
              ),
              //widget that is wrapped with consumer (provider)
              Consumer<CatogoryController>(
                builder: (context, catogoryProvider, child) {
                  if (catogoryProvider.isLoading) {
                    return Expanded(
                        child: SizedBox(
                            child: Center(
                      child: CircularProgressIndicator(),
                    )));
                  } else {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8.0, // Adjust as needed
                            mainAxisSpacing: 8.0, // Adjust as needed
                            childAspectRatio:
                                0.75, // Adjust aspect ratio as needed
                          ),
                          itemCount: catogoryProvider.catogoryList.length,
                          itemBuilder: (context, index) {
                            return Gridcard(
                              catogery: catogoryProvider
                                  .catogoryList[index].categoryName,
                              image: catogoryProvider
                                  .catogoryList[index].categoryImage,
                              id: catogoryProvider.catogoryList[index].id,
                              // catogery: catogoryProvider.catogoryList[index],
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ));
  }
}
