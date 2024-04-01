import 'package:flutter/material.dart';
import 'package:spare_parts/presentation/orderHistory/Service/historyService.dart';
import 'package:spare_parts/presentation/orderHistory/widgets/history_tile.dart';
import 'package:spare_parts/presentation/views/spareHome/sparehome.dart';
import 'package:spare_parts/utils/text_sizes.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed:() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SpareHome(index: 1,),));
          }, icon:Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text(
            "Order History",
            style: CustomStyle.CartHeadder,
          ),
        ),
        body: FutureBuilder<List<dynamic>>(
            future: HistoryService.fetchHistory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return HistoryTile(
                      image: snapshot.data![index]['item_image'],
                      quantity: snapshot.data![index]["quantity"],
                      itemName: snapshot.data![index]['item_name'],
                      price:snapshot.data![index]["item_price"]
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Error Occured"),
                );
              } else {
                return Center(
                  child: Text("No data available"),
                );
              }
            }));
  }
}
