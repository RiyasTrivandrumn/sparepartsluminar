import 'package:flutter/material.dart';
import 'package:spare_parts/presentation/views/DescriptPage/DescrPage.dart';
import 'package:spare_parts/utils/text_sizes.dart';

class DeadCard  extends StatelessWidget {
 final image;
 final price;
 final title;
 final manufacturer;


   
    
   const DeadCard({required this.image,required this.manufacturer,required this.price,required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
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
               
                children: [Text(title,
                
                maxLines: 2,
                style: CustomStyle.MediumTextStyle),
                SizedBox(height: 10,),
                Text("₹$price",style: CustomStyle.PriceText,),
                SizedBox(height: 20,),
                Text("Manufacturer:$manufacturer ",style: CustomStyle.MediumTextStyle,)
               
               ]
              ),
            ),
          )
    
    
    
        ],
      ),
      
      
      );
      
  }
}