import 'package:flutter/material.dart';
import 'package:spare_parts/utils/apputils.dart';

class CheckCard extends StatelessWidget {

  final title;
  final image;
  final price;
  final quantity;
  const CheckCard({super.key,required this.title,required this.image,required this.price,required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListTile(
          leading: Image.network(AppUtils.baseUrl+image),

         
         
          title: Text(title),
          subtitle: Text("₹${price}"),
          trailing: Text(quantity.toString()),
        ),
      ),
    );
  }
}