import 'package:flutter/material.dart';
import 'package:spare_parts/presentation/views/DescriptPage/DescrPage.dart';
import 'package:spare_parts/utils/text_sizes.dart';

class ListCard extends StatelessWidget {
   final  itemname;
   final  price;
  final  isAvailable;
  final  image;
  final id;

    
   const ListCard({super.key,required this.itemname,required this.price,required this.isAvailable,required this.image,required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => DescriptPage(id: id,),));
        
      },
      child: Card(
        elevation: 2,
        
        color: Colors.white70,
        child: Row(
     
          children: [
            SizedBox(
              height: 200,
              width: 140,
              child: Image.network("http://10.0.2.2:8000$image",fit: BoxFit.contain,),
              
              
              
            ),
            Padding(
              padding: const EdgeInsets.only(left:6),
              child: Container(
                width: 6, // Specify the width of the vertical divider
                height: 200, // Adjust the height as needed
                color: Colors.pink.shade800, // Set the color of the vertical divider
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                 
                  children: [Text(itemname,
                  
                  maxLines: 2,
                  style: CustomStyle.MediumTextStyle),
                  SizedBox(height: 10,),
                  Text("₹$price",style: CustomStyle.PriceText,),
                  SizedBox(height: 20,),
                 
                  Text(isAvailable ? "Item Available":"Out of Stock",style: isAvailable ? TextStyle(color: Colors.green,fontSize: 16,fontWeight:FontWeight.w500 ):TextStyle(color: Colors.red,fontSize: 16,fontWeight:FontWeight.w500 ),)]
                ),
              ),
            )



          ],
        ),
        
        
        ),
    );
      
  }
}