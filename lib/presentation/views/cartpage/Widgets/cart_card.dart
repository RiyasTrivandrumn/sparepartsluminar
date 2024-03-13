import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_parts/presentation/views/cartpage/Widgets/incre_decre.dart';
import 'package:spare_parts/presentation/views/cartpage/cartservice/remove_from_cart.dart';
import 'package:spare_parts/presentation/views/cartpage/controller/cart_controller.dart';

import 'package:spare_parts/utils/text_sizes.dart';

class CartCard extends StatelessWidget {

  final String title;
  final String? price;
  final String? image;
  final  itemId;
  
  final quantity;
  
  const CartCard({super.key,required this.title,required this.price,required this.image,required this.itemId,required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        height: 200,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network("http://10.0.2.2:8000$image",
              height: 160,
              width: 150,
              
              
              fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(title,overflow: TextOverflow.ellipsis,maxLines: 1,style:CustomStyle.LargeTextStyle,),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text("₹"+price.toString(),style: CustomStyle.PriceText,),

                    Consumer<CartController>(builder:(context, value, child) {
                      return  Counter(id:itemId ,quantity: quantity,) ;
                    },)

                    
                    ],
                    
                  ),
                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(onPressed:() {
                       Provider.of<CartController>(context, listen: false).updateCart(id: itemId);
                    
                      
                    }, icon:Icon(Icons.delete,color: Colors.red.shade600,), label:Text("Remove item",style:TextStyle(color: Colors.grey.shade600),)),
                  )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}