import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_parts/presentation/views/spareHome/controller/spareProvider.dart';

class SpareHome extends StatelessWidget {
  final index;
  const SpareHome({super.key,this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<SpareProvider>(
      builder: (context, spareprovider, child) => Scaffold(
        bottomNavigationBar: NavigationBar(
            height: 70,
            elevation: 0,
            selectedIndex: spareprovider.selectedIndex,
            onDestinationSelected: (index) => spareprovider.passedIndex(index),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.remove_shopping_cart), label: 'DeadStock'),
              NavigationDestination(
                  icon: Icon(Icons.account_circle), label: 'Profile'),

                   NavigationDestination(icon:Icon(Icons.history), label:"History"),
              NavigationDestination(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
            ]),
        body: spareprovider.screens[spareprovider.selectedIndex],
      ),
    );
  }
}
