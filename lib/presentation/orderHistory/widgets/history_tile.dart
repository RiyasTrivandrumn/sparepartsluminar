import 'package:flutter/material.dart';
import 'package:spare_parts/utils/apputils.dart';

class HistoryTile extends StatelessWidget {
 var quantity;
 var itemName;
 var image;
 var price;

   HistoryTile({super.key,required this.quantity,required this.itemName,required this.image,required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(AppUtils.baseUrl+image),
              
              title: Text(itemName),
              subtitle: Text("Price:₹$price"),
              trailing: Text("Quantity:$quantity",style: TextStyle(fontWeight: FontWeight.w700),),
            ),
          ),
        ),

        Divider()
      ],
    );
  }
}