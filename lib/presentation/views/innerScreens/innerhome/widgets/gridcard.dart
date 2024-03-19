import 'package:flutter/material.dart';
// import 'package:spare_parts/presentation/views/innerScreens/innerhome/Model/catogerymodel.dart';
import 'package:spare_parts/utils/text_sizes.dart';
import 'package:spare_parts/presentation/views/spareList/view/sparelist.dart';
// import 'package:cached_network_image/cached_network_image.dart';


class Gridcard extends StatelessWidget {
   const Gridcard({super.key, required this.catogery,required this.image,required this.id});
 final String catogery;
final  image;
final id;
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
         Navigator.of(context).push(MaterialPageRoute(builder:(context) => SpareList(id:id,title:catogery),));
      },
      child: Card(
        child: Container(
          
          child: Column(
            children: [Expanded( flex: 3,child:Image.network(
               "http://10.0.2.2:8000$image"
              )),
            Expanded( flex: 2, child: Text(catogery,style:CustomStyle.MediumTextStyle,))],
            
          ),
        ),
      ),
    );
  }
}
