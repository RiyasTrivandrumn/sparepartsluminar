import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_parts/presentation/views/spareList/Controller/list_controller.dart';
import 'package:spare_parts/utils/text_sizes.dart';
import 'package:spare_parts/presentation/views/spareList/widgets/listcard.dart';

class SpareList extends StatelessWidget {
  final id;
  final title;
  const SpareList({super.key, required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    Provider.of<ListController>(context, listen: false).getList(id: id);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CustomStyle.ListHeader,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey.shade400,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                ),
              ),
              Center(
                  child: Text(
                "Products",
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 7,
              ),
              Consumer<ListController>(
                builder: (context, value, child) {
                  if (value.isloading == true) {
                    return Expanded(
                        child: SizedBox(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ));
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: value.sparelist.length,
                        itemBuilder: (context, index) {
                          return ListCard(price: value.sparelist[index].price,
                          isAvailable: value.sparelist[index].available,
                          itemname: value.sparelist[index].itemName,
                          image: value.sparelist[index].itemImage,
                          id: value.sparelist[index].id,
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          )),
    );
  }
}
