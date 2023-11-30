import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final TabController controller;

  const CustomBottomBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Image.asset('assets/icons/c77.png'),
            onPressed: () {
              controller.animateTo(0);
            },
          ),
          IconButton(
            icon: Image.asset('assets/icons/3_eyes.png'),
            onPressed: () {
              controller.animateTo(1);
            },
          )
        ],
      ),
    );
  }
}
