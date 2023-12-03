import 'package:flutter/material.dart';
import 'package:starter_app/ui/home/custom_77_tab.dart';
import 'custom_bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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
        appBar: AppBar(title: const Text("Custom 77")),
        bottomNavigationBar: CustomBottomBar(controller: bottomTabController),
        body: /*CustomPaint(
            painter: MainBackground(),
            child:*/
            TabBarView(
                controller: bottomTabController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[Custom77Tab(), Custom77Tab()]));
  }
}
