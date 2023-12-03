import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../core/data/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  final SwiperController swiperController = SwiperController();

  ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height / 2.5;
    double cardWidth = MediaQuery.of(context).size.width / 2.5;

    return SizedBox(
      height: cardHeight,
      child: Swiper(
        itemCount: products.length,
        itemBuilder: (_, index) {
          return ProductCard(
              height: cardHeight, width: cardWidth, product: products[index]);
        },
        scale: 0.5,
        controller: swiperController,
        viewportFraction: 0.5,
        loop: false,
        fade: 0.5,
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final double height;
  final double width;

  const ProductCard({
    super.key,
    required this.product,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
/*onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ProductPage(product: product))),*/
        child: Hero(
            tag: product.image,
            child: Image.asset(
              product.image,
              height: height,
              width: width,
              fit: BoxFit.contain,
            )));
  }
}
