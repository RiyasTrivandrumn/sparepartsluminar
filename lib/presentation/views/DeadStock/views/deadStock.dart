import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_parts/presentation/views/DeadStock/controller/deadController.dart';
import 'package:spare_parts/presentation/views/DeadStock/widgets/deadcard.dart';

import 'package:spare_parts/utils/text_sizes.dart';


class DeadStock extends StatelessWidget {
  const DeadStock();

  @override
  Widget build(BuildContext context) {
    Provider.of<DeadController>(context, listen: false).getList();
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
                "Dead Stock Items",
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
              Consumer<DeadController>(
                builder: (context, value, child) {
                  if (value.isLoading == true) {
                    return Expanded(
                        child: SizedBox(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ));
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: value.deadlist.length,
                        itemBuilder: (context, index) {
                          return DeadCard(image:value.deadlist[index].itemImage ,title:value.deadlist[index].deadstockItem ,price:value.deadlist[index].price ,manufacturer:value.deadlist[index].manufacturer ,
                          
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
