import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_parts/presentation/views/cartpage/controller/cart_controller.dart';

class Counter extends StatelessWidget {
  final value;
  final id;
  final quantity;
  
  const Counter({super.key, this.value,required this.id,required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildCounterButton(Icons.remove_outlined, () {
              Provider.of<CartController>(context, listen: false).decrement(id: id,);
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(quantity.toString()),
          ),
          buildCounterButton(Icons.add_outlined, () {
            Provider.of<CartController>(context, listen: false).increment(id:id );
          })
        ],
      ),
    );
  }
}

InkWell buildCounterButton(IconData icon, void Function() change) {
  return InkWell(
    onTap: () {
      change();
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Icon(icon),
    ),
  );
}
