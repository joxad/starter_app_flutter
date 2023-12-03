import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../core/data/product.dart';
import '../products/products.dart';

class Custom77Tab extends StatelessWidget {
  List<Product> originals = [
    Product(
        image: 'assets/images/lust_for_life.png',
        name: "Lust For Life",
        description: "La plus belle",
        price: 1245),
    Product(
        image: 'assets/images/breakdown.png',
        name: "Breakdown",
        description: "Telecaster",
        price: 1245),
    Product(
        image: 'assets/images/goin_steady.png',
        name: "Breakdown",
        description: "Telecaster",
        price: 995),
  ];

  List<Product> classics = [
    Product(
        image: 'assets/images/sister_midnight.png',
        name: "Sister Midnight",
        description: "La plus belle",
        price: 795),
    Product(
        image: 'assets/images/locket_love.png',
        name: "Locket Love",
        description: "Telecaster",
        price: 795),
  ];

  Custom77Tab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.vertical, children: [
      const Text("Série Originale",
          style: TextStyle(fontSize: 20, color: darkGrey)),
      ProductList(
        products: originals,
      ),
      const Text("Série Classique",
          style: TextStyle(fontSize: 20, color: darkGrey)),
      ProductList(
        products: classics,
      ),
    ]);
  }
}
