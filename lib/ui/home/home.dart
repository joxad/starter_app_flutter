import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../app/theme.dart';
import '../../core/data/product.dart';
import '../background/main_background.dart';
import 'custom_bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController bottomTabController;

  @override
  void initState() {
    super.initState();
    bottomTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
        body: CustomPaint(
            painter: MainBackground(),
            child: ListView(scrollDirection: Axis.vertical, children: [
              const Text("Série Originale",
                  style: TextStyle(fontSize: 20, color: darkGrey)),
              ProductList(
                products: originals,
              ),
              const Text("Série Classique",
                  style: TextStyle(fontSize: 20, color: darkGrey)),
              ProductList(
                products: classics,
              )
            ])));
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  final SwiperController swiperController = SwiperController();

  ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height / 2.7;
    double cardWidth = MediaQuery.of(context).size.width / 1.8;

    return SizedBox(
      height: cardHeight,
      child: Swiper(
        itemCount: products.length,
        itemBuilder: (_, index) {
          return ProductCard(
              height: cardHeight, width: cardWidth, product: products[index]);
        },
        scale: 0.8,
        controller: swiperController,
        viewportFraction: 0.6,
        loop: false,
        fade: 0.5,
        pagination: SwiperCustomPagination(
          builder: (context, config) {
            if (config.itemCount > 20) {
              print(
                  "The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation");
            }
            Color activeColor = Colors.orange;
            Color color = Colors.grey.withOpacity(.3);
            double size = 10.0;
            double space = 5.0;

            if (config.indicatorLayout != PageIndicatorLayout.NONE &&
                config.layout == SwiperLayout.DEFAULT) {
              return PageIndicator(
                count: config.itemCount,
                controller: config.pageController!,
                layout: config.indicatorLayout,
                size: size,
                activeColor: activeColor,
                color: color,
                space: space,
              );
            }

            List<Widget> dots = [];

            int itemCount = config.itemCount;
            int activeIndex = config.activeIndex;

            for (int i = 0; i < itemCount; ++i) {
              bool active = i == activeIndex;
              dots.add(Container(
                key: Key("pagination_$i"),
                margin: EdgeInsets.all(space),
                child: ClipOval(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: active ? activeColor : color,
                    ),
                    width: size,
                    height: size,
                  ),
                ),
              ));
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: dots,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final double height;
  final double width;

  const ProductCard({
    required this.product,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
/*onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ProductPage(product: product))),*/
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 30),
            height: height,
            width: width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Colors.orange,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                  color: Colors.white,
                ),
                Column(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16.0),
                          ),
                        )),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 12.0, 4.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: Color.fromRGBO(224, 69, 10, 1),
                        ),
                        child: Text(
                          '\$${product.price}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            child: Hero(
              tag: product.image,
              child: Image.asset(
                product.image,
                height: height / 1.7,
                width: width / 1.4,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
